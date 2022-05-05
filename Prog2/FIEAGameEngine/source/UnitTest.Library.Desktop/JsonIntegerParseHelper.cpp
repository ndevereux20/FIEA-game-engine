#include "pch.h"
#include "JsonIntegerParseHelper.h"

using namespace FieaGameEngine;
namespace UnitTestLibraryDesktop
{

#pragma region SharedData
	RTTI_DEFINITIONS(JsonIntegerParseHelper::SharedData);

	void JsonIntegerParseHelper::SharedData::Initialize()
	{
		JsonParseCoordinator::SharedData::Initialize();
		_data.Clear();
	}

	gsl::owner<JsonIntegerParseHelper::SharedData*> JsonIntegerParseHelper::SharedData::Create() const
	{
		return new JsonIntegerParseHelper::SharedData();
	}
	
#pragma endregion

#pragma region JsonIntegerParseHelper
	RTTI_DEFINITIONS(JsonIntegerParseHelper);

	gsl::owner<IJsonParseHelper*> JsonIntegerParseHelper::Create() const
	{
		return new JsonIntegerParseHelper();
	}
	
	void JsonIntegerParseHelper::Initialize()
	{
		IJsonParseHelper::Initialize();
		_parsingData = false;
	}

	bool JsonIntegerParseHelper::StartHandler(JsonParseCoordinator::SharedData& sharedData, const string& key, const Json::Value& value, const std::size_t)
	{
		JsonIntegerParseHelper::SharedData* customSharedData = sharedData.As<JsonIntegerParseHelper::SharedData>();
		if (customSharedData == nullptr)
		{
			return false;
		}
		if (key != _integerKey)
		{
			return false;
		}
		if (_parsingData)
		{
			throw runtime_error("Received another start element while already parsing an integer.");
		}
		customSharedData->_data.PushBack(value.asInt());
		return true;
	}
	bool JsonIntegerParseHelper::EndHandler(JsonParseCoordinator::SharedData& sharedData, const string& key, const Json::Value& )
	{
		JsonIntegerParseHelper::SharedData* customSharedData = sharedData.As<JsonIntegerParseHelper::SharedData>();
		if (customSharedData == nullptr || key != _integerKey || _parsingData == false)
		{
			return false;
		}
		_parsingData = false;
		return true;
	}

#pragma endregion

}