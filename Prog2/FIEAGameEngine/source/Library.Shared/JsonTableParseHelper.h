#pragma once

#include "JsonParseCoordinator.h"
#include "IJsonParseHelper.h"
#include "Stack.h"
#include "Scope.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Context frame keeps the current context for scope parsing
	/// </summary>
	struct ContextFrame
	{
		/// <summary>
		/// Constructor for ContextFrame. 
		/// </summary>
		/// <param name="currentKey">The current key.</param>
		/// <param name="currentScope">The current Scope.</param>
		ContextFrame(const std::string& currentKey, Scope* currentScope, const std::string currentClassName) :
			_currentKey(currentKey), _currentScope(currentScope), _currentClassName(currentClassName)
		{
		}
		std::string _currentKey;
		Scope* _currentScope;
		std::string _currentClassName;
		//class name 
	};

	/// <summary>
	/// Helper class for dealing with Scopes. 
	/// </summary>
	class JsonTableParseHelper final : public IJsonParseHelper
	{
		RTTI_DECLARATIONS(JsonTableParseHelper, IJsonParseHelper);
	public:

		/// <summary>
		/// Wrapper class that maintains the data read in from the JSON. 
		/// </summary>
		class SharedData final : public JsonParseCoordinator::SharedData
		{
			RTTI_DECLARATIONS(SharedData, JsonParseCoordinator::SharedData);
		public:
			/// <summary>
			/// Constructor for SharedData. 
			/// </summary>
			/// <param name="scope">The scope you want to push to.</param>
			SharedData(Scope& scope);

			/// <summary>
			/// Initializes data.
			/// </summary>
			virtual void Initialize() override;

			/// <summary>
			/// Cleans up any Initialized data.
			/// </summary>
			virtual void Cleanup() override;

			/// <summary>
			/// Creates a new SharedData pointer, the user is responsible for deleting it
			/// </summary>
			/// <returns>A gsl owner to the SharedData pointer.</returns>
			virtual gsl::owner<SharedData*> Create() const override;

			Scope* _scope{ nullptr };


		};

		/// <summary>
		/// Creates a new IJsonParseHelper pointer, the user is responsible for deleting it
		/// </summary>
		/// <returns>A gsl owner to the IJsonParseHelper pointer.</returns>
		virtual gsl::owner<IJsonParseHelper*> Create() const override;

		/// <summary>
		/// Initializes any needed data in this helper.
		/// </summary>
		virtual void Initialize() override;

		/// <summary>
		/// Cleanups any Initialized data in this helper.
		/// </summary>
		virtual void Cleanup() override;

		/// <summary>
		/// Starts the handler for the JsonValue parsed in.
		/// </summary>
		/// <param name="sharedData">A reference to the SharedData.</param>
		/// <param name="key">The key in the value pair for parsing.</param>
		/// <param name="value">The JsonValue corresponding to the key.</param>
		/// <returns></returns>
		virtual bool StartHandler(FieaGameEngine::JsonParseCoordinator::SharedData& sharedData, const std::string& key, const Json::Value& value, const std::size_t arrayIndex) override;

		/// <summary>
		/// Ends the handler for the JsonValue being parsed.
		/// </summary>
		/// <param name="sharedData">A reference to the SharedData.</param>
		/// <param name="key">The key in the value pair for parsing.</param>
		/// <param name="value">The JsonValue corresponding to the key.</param>
		/// <returns></returns>
		virtual bool EndHandler(FieaGameEngine::JsonParseCoordinator::SharedData& sharedData, const std::string& key, const Json::Value& value) override;

	private:
		inline static const std::string _typeKey = "type";
		inline static const std::string _valueKey = "value";
		inline static const std::string _classKey = "class";

		Stack<ContextFrame> _context;
		HashMap<std::string, DatumTypes> _typeMap;

	};
}

