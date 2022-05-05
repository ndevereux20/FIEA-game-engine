#pragma once

#include "JsonParseCoordinator.h"
#include "IJsonParseHelper.h"
#include "Vector.h"
namespace UnitTestLibraryDesktop
{
	class JsonIntegerParseHelper final : public FieaGameEngine::IJsonParseHelper
	{
		RTTI_DECLARATIONS(JsonIntegerParseHelper, FieaGameEngine::IJsonParseHelper);
	public: 
		class SharedData final : public FieaGameEngine::JsonParseCoordinator::SharedData
		{
			RTTI_DECLARATIONS(SharedData, FieaGameEngine::JsonParseCoordinator::SharedData);
		public: 
			virtual void Initialize() override;
			virtual gsl::owner<SharedData*> Create() const override;

			FieaGameEngine::Vector<int> _data;
		};

		virtual gsl::owner<IJsonParseHelper*> Create() const override;
		virtual void Initialize() override;
		virtual bool StartHandler(FieaGameEngine::JsonParseCoordinator::SharedData& sharedData, const std::string& key, const Json::Value& value, const std::size_t arrayIndex) override;
		virtual bool EndHandler(FieaGameEngine::JsonParseCoordinator::SharedData& sharedData, const std::string& key, const Json::Value& value) override;

	private: 
		inline static const std::string _integerKey = "integer";
		bool _parsingData = false;
	};
}

