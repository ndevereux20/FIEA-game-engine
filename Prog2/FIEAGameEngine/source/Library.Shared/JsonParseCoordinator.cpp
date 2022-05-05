#include "pch.h"
#include "JsonParseCoordinator.h"
#include "IJsonParseHelper.h"
#include <istream>
#include <fstream>
using namespace std;
using namespace std::string_literals;

namespace FieaGameEngine
{
#pragma region SharedData
	RTTI_DEFINITIONS(JsonParseCoordinator::SharedData);
	JsonParseCoordinator* JsonParseCoordinator::SharedData::GetJsonParseCoordinator()
	{
		return _owner;
	}

	const JsonParseCoordinator* JsonParseCoordinator::SharedData::GetJsonParseCoordinator() const
	{
		return _owner;
	}

	void JsonParseCoordinator::SharedData::SetJsonParseCoordinator(JsonParseCoordinator* parseCoordinator)
	{
		if (parseCoordinator != nullptr)
		{
			_owner = parseCoordinator;
		}
	}
	void JsonParseCoordinator::SharedData::IncrementDepth()
	{
		++_depth;
	}

	void JsonParseCoordinator::SharedData::DecrementDepth()
	{
		if (_depth > 0)
		{
			--_depth;
		}
	}
	
	std::size_t JsonParseCoordinator::SharedData::Depth()
	{
		return _depth;
	}

	void JsonParseCoordinator::SharedData::Initialize()
	{
		_depth = 0;
	}

	void JsonParseCoordinator::SharedData::Cleanup()
	{
	}

#pragma endregion 

#pragma region JsonParseCoordinator

	JsonParseCoordinator::JsonParseCoordinator(SharedData& sharedData) : 
		_sharedData(&sharedData)
	{
		_sharedData->Initialize();
		_sharedData->SetJsonParseCoordinator(this);
	}

	JsonParseCoordinator::~JsonParseCoordinator()
	{
		Cleanup();
		if (_isClone)
		{
			delete _sharedData;
			for (IJsonParseHelper* helper : _helpers)
			{
				delete helper;
			}
		}
	}

	JsonParseCoordinator::JsonParseCoordinator(JsonParseCoordinator&& other) noexcept : 
		_helpers(std::move(other._helpers)), _sharedData(std::move(other._sharedData)), _isClone(other._isClone)
	{
		_sharedData->SetJsonParseCoordinator(this);
	}

	JsonParseCoordinator& JsonParseCoordinator::operator=(JsonParseCoordinator&& other) noexcept
	{
		_helpers = std::move(other._helpers);
		_sharedData = std::move(other._sharedData);
		_isClone = other._isClone;

		_sharedData->SetJsonParseCoordinator(this);
		return *this;
	}

	void JsonParseCoordinator::Initialize()
	{
		//call shared data initialize and cleanup 
		_sharedData->Initialize();
		for (IJsonParseHelper* helper : _helpers)
		{
			helper->Initialize();
		}
		//_sharedData->Cleanup();
	}

	void JsonParseCoordinator::Cleanup()
	{
		for (IJsonParseHelper* helper : _helpers)
		{
			helper->Cleanup();
		}
	}

	void JsonParseCoordinator::AddHelper(IJsonParseHelper& helper)
	{
		assert(_isClone == false);
		for (size_t i = 0; i < _helpers.Size(); ++i)
		{
			if (_helpers[i]->TypeIdInstance() == helper.TypeIdInstance())
			{
				throw std::exception("Helper is already added.");
			}
		}
		_helpers.PushBack(&helper);
	}

	void JsonParseCoordinator::RemoveHelper(IJsonParseHelper& helper)
	{
		assert(_isClone == false);
		_helpers.Remove(&helper);
	}


	JsonParseCoordinator::SharedData* JsonParseCoordinator::GetSharedData()
	{
		return _sharedData;
	}

	const JsonParseCoordinator::SharedData* JsonParseCoordinator::GetSharedData() const
	{
		return _sharedData;
	}

	void JsonParseCoordinator::SetSharedData(SharedData* sharedData)
	{
		if (sharedData != nullptr)
		{
			assert(_isClone == false);
			_sharedData = sharedData;
			_sharedData->Initialize();
			_sharedData->SetJsonParseCoordinator(this);
		}
	}

	
	gsl::owner<JsonParseCoordinator*> JsonParseCoordinator::Clone() 
	{
		JsonParseCoordinator* coordinator = new JsonParseCoordinator(*_sharedData->Create());
		for (size_t i = 0; i < _helpers.Size(); ++i)
		{
			coordinator->_helpers.PushBack(_helpers[i]->Create());
		}
		coordinator->_isClone = true;
		return coordinator;
	}

	bool JsonParseCoordinator::IsClone() const
	{
		return _isClone;
	}

	const Vector<IJsonParseHelper*>& JsonParseCoordinator::Helpers()
	{
		return _helpers;
	}
	void JsonParseCoordinator::Parse(const std::string& jsonString) 
	{
		std::istringstream stream(jsonString);
		Parse(stream);
	}

	//make this the main one that the other versions call (i.e. the string or file)
	void JsonParseCoordinator::Parse(std::istream& jsonStream)
	{
		Initialize();

		Json::Value value;
		jsonStream >> value;
		_sharedData->IncrementDepth();
		ParseMembers(value);
		_sharedData->DecrementDepth();

		Cleanup();
	}

	void JsonParseCoordinator::ParseFromFile(const std::string& filename)
	{
		std::ifstream inputStream(filename);
		if (!inputStream.good())
		{
			throw std::runtime_error("Couldn't open the file.");
		}
		Parse(inputStream);
	}

	void JsonParseCoordinator::ParseMembers(const Json::Value& jsonValue)
	{
		const auto& keys = jsonValue.getMemberNames();
		for (auto& key : keys)
		{
			Parse(key, jsonValue[key], 0);
		}
	}

	void JsonParseCoordinator::Parse(const std::string& key, const Json::Value& jsonValue, const std::size_t arrayIndex)
	{	
		if (jsonValue.isObject())
		{
			_sharedData->IncrementDepth();
			for (IJsonParseHelper* helper : _helpers)
			{
				if (helper->StartHandler(*_sharedData, key, jsonValue, arrayIndex) == true)
				{
					ParseMembers(jsonValue);
					helper->EndHandler(*_sharedData, key, jsonValue);
					break;
				}
			}
			_sharedData->DecrementDepth();
		}
		else if (jsonValue.isArray())
		{
			size_t index = 0; 
			for (auto& jsonVArray : jsonValue)
			{
				if (jsonVArray.isObject())
				{
					_sharedData->IncrementDepth();
					ParseMembers(jsonVArray);
					_sharedData->DecrementDepth();
				}
				else
				{
					Parse(key, jsonVArray, index);
				}
				++index;
			}
		}
		else
		{
			for (IJsonParseHelper* helper : _helpers)
			{
				if (helper->StartHandler(*_sharedData, key, jsonValue, arrayIndex) == true)
				{
					helper->EndHandler(*_sharedData, key, jsonValue);
					break;
				}

			}
		}
	}

	
#pragma endregion

}