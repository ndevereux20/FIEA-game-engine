#include "pch.h"
#include "JsonTestParseHelper.h"

using namespace FieaGameEngine;

namespace UnitTestLibraryDesktop
{

#pragma region SharedData
	RTTI_DEFINITIONS(JsonTestParseHelper::SharedData);

	
	void JsonTestParseHelper::SharedData::Initialize()
	{
		JsonParseCoordinator::SharedData::Initialize();
		_maxDepth = 0;
	}

	gsl::owner<JsonTestParseHelper::SharedData*> JsonTestParseHelper::SharedData::Create() const
	{
		return new JsonTestParseHelper::SharedData();
	}

#pragma endregion

#pragma region JsonIntegerParseHelper
	RTTI_DEFINITIONS(JsonTestParseHelper);

	IJsonParseHelper* JsonTestParseHelper::Create() const
	{
		return new JsonTestParseHelper();
	}

	void JsonTestParseHelper::Initialize()
	{
		IJsonParseHelper::Initialize();
		_initializedCall = true;
	    _startHandlerCount = 0;
		_endHandlerCount = 0;
		//_arrayElementCount = 0;
	}

	bool JsonTestParseHelper::StartHandler(JsonParseCoordinator::SharedData& sharedData, const string& key, const Json::Value& value, const std::size_t)
	{
		JsonTestParseHelper::SharedData* customSharedData = sharedData.As<JsonTestParseHelper::SharedData>();
		if (customSharedData == nullptr)
		{
			return false;
		}
		key;
		if (customSharedData->Depth() > customSharedData->_maxDepth)
		{
			customSharedData->_maxDepth = customSharedData->Depth();
		}
		++_startHandlerCount;
		value;
		return true;
	}
	bool JsonTestParseHelper::EndHandler(JsonParseCoordinator::SharedData& sharedData, const string& , const Json::Value&)
	{
		JsonTestParseHelper::SharedData* customSharedData = sharedData.As<JsonTestParseHelper::SharedData>();
		if (customSharedData == nullptr || _initializedCall == false)
		{
			return false;
		}
		++_endHandlerCount;
		return true;
	}

#pragma endregion

}