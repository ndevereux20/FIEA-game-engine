#pragma once
#include "pch.h"
#include "Factory.h"
#include "JsonTableParseHelper.h"

using namespace std;
namespace FieaGameEngine
{
	

#pragma region SharedData
	RTTI_DEFINITIONS(JsonTableParseHelper::SharedData);

	JsonTableParseHelper::SharedData::SharedData(Scope& scope)
	{
		_scope = &scope;
	}
	void JsonTableParseHelper::SharedData::Initialize()
	{
		JsonParseCoordinator::SharedData::Initialize();
	}

	gsl::owner<JsonTableParseHelper::SharedData*> JsonTableParseHelper::SharedData::Create() const
	{
		return new JsonTableParseHelper::SharedData(*_scope);
	}

	void JsonTableParseHelper::SharedData::Cleanup()
	{
		JsonParseCoordinator::SharedData::Cleanup();
		_scope->Clear();
	}

#pragma endregion

#pragma region JsonTableParseHelper
	RTTI_DEFINITIONS(JsonTableParseHelper);

	gsl::owner<IJsonParseHelper*> JsonTableParseHelper::Create() const
	{
		return new JsonTableParseHelper();
	}

	void JsonTableParseHelper::Initialize()
	{
		IJsonParseHelper::Initialize();
		_typeMap.Insert(make_pair("integer", DatumTypes::Integer));
		_typeMap.Insert(make_pair("float", DatumTypes::Float));
		_typeMap.Insert(make_pair("vector", DatumTypes::Vector));
		_typeMap.Insert(make_pair("matrix", DatumTypes::Matrix));
		_typeMap.Insert(make_pair("string", DatumTypes::String));
		_typeMap.Insert(make_pair("pointer", DatumTypes::Pointer));
		_typeMap.Insert(make_pair("table", DatumTypes::Table));
	}

	void JsonTableParseHelper::Cleanup()
	{
		IJsonParseHelper::Cleanup();
		_typeMap.Clear();
		_context.Clear();
	}

	bool JsonTableParseHelper::StartHandler(JsonParseCoordinator::SharedData& sharedData, const string& key, const Json::Value& value, const std::size_t arrayIndex)
	{
		JsonTableParseHelper::SharedData* customSharedData = sharedData.As<JsonTableParseHelper::SharedData>();
		if (customSharedData == nullptr)
		{
			return false;
		}
		//string lowercaseKey;
		//lowercaseKey.resize(key.size());
		//transform(key.begin(), key.end(), lowercaseKey.begin(), ::tolower);

		else if (key == _typeKey)
		{
			auto it = _typeMap.Find(value.asString());
			if (it == _typeMap.end())
			{
				throw std::exception("Not a valid type key.");
			}
			DatumTypes datumType = it->second;

			Datum& datum = _context.Top()._currentScope->Append(_context.Top()._currentKey);
			datum.SetType(datumType);
		}
		else if (key == _classKey)
		{
			_context.Top()._currentClassName = value.asString();
		}
		else if (key == _valueKey)
		{
			Datum* datum = _context.Top()._currentScope->Find(_context.Top()._currentKey);
			assert(datum != nullptr);
			if (datum->Type() != DatumTypes::Table)
			{
				if (datum->IsExternal())
				{
					datum->SetFromString(value.asString(), arrayIndex);
				}
				else
				{
					datum->PushBackFromString(value.asString());
				}
			}
			else
			{
				if (_context.Top()._currentClassName.empty() == false)
				{
					Scope* newScope = Factory<Scope>::Create(_context.Top()._currentClassName);
					assert(newScope != nullptr);
					_context.Top()._currentScope->Adopt(_context.Top()._currentKey, *newScope);
					_context.Push(ContextFrame(_context.Top()._currentKey, newScope, _context.Top()._currentClassName));
				}
			}
		}
		else
		{
			if (_context.IsEmpty())
			{
				_context.Push(ContextFrame(key, customSharedData->_scope, ""s));
			}
			else
			{
				_context.Push(ContextFrame(key, _context.Top()._currentScope, ""s));
			}
			
		}
		
		return true;
	}
	bool JsonTableParseHelper::EndHandler(JsonParseCoordinator::SharedData& sharedData, const string& , const Json::Value& value)
	{
		JsonTableParseHelper::SharedData* customSharedData = sharedData.As<JsonTableParseHelper::SharedData>();
		if (customSharedData == nullptr)
		{
			return false;
		}
		if (value.isObject())
		{
			_context.Pop();
		}
		return true;
	}

#pragma endregion
}