#pragma once
#include "JsonParseCoordinator.h"
#include "IJsonParseHelper.h"

namespace UnitTestLibraryDesktop
{
	class JsonTestParseHelper final : public FieaGameEngine::IJsonParseHelper
	{
		RTTI_DECLARATIONS(JsonTestParseHelper, FieaGameEngine::IJsonParseHelper);
	public:
		class SharedData final : public FieaGameEngine::JsonParseCoordinator::SharedData
		{
			RTTI_DECLARATIONS(SharedData, FieaGameEngine::JsonParseCoordinator::SharedData);
		public: 
			virtual void Initialize() override;
			virtual gsl::owner<SharedData*> Create() const override;

			std::size_t _maxDepth = 0;

		};

		virtual gsl::owner<IJsonParseHelper*> Create() const override;
		virtual void Initialize() override;
		virtual bool StartHandler(FieaGameEngine::JsonParseCoordinator::SharedData& sharedData, const std::string& key, const Json::Value& value, const std::size_t arrayIndex) override;
		virtual bool EndHandler(FieaGameEngine::JsonParseCoordinator::SharedData& sharedData, const std::string& key, const Json::Value& value) override;

		bool _initializedCall = false;
		std::size_t _startHandlerCount = 0; 
		std::size_t _endHandlerCount = 0;
		//std::size_t _arrayElementCount = 0;
	};
}

