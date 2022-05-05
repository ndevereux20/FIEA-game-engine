#pragma once
#include "JsonParseCoordinator.h"
#include "RTTI.h"
#include <gsl/pointers>

namespace FieaGameEngine
{
	/// <summary>
	/// Pure Virtual abstract base class for JsonParseHelpers.
	/// </summary>
	class IJsonParseHelper : public RTTI
	{
		RTTI_DECLARATIONS(IJsonParseHelper, RTTI);
	public:
		/// <summary>
		/// Default Constructor for IJsonParseHelper.
		/// </summary>
		IJsonParseHelper() = default;

		/// <summary>
		/// Default Destructor for IJsonParseHelper.
		/// </summary>
		virtual ~IJsonParseHelper() = default;

		/// <summary>
		/// Default Copy Constructor for IJsonParseHelper.
		/// </summary>
		/// <param name="other">The other IJsonParseHelper.</param>
		IJsonParseHelper(const IJsonParseHelper & other) = default;

		/// <summary>
		/// Default Copy Assignment for IJsonParseHelper.
		/// </summary>
		/// <param name="other">The other IJsonParseHelper.</param>
		/// <returns>A reference to the new IJsonParseHelper.</returns>
		IJsonParseHelper& operator=(const IJsonParseHelper & other) = default;

		/// <summary>
		/// Default Move Constructor for IJsonParseHelper.
		/// </summary>
		/// <param name="other">The other IJsonParseHelper.</param>
		IJsonParseHelper(IJsonParseHelper && other) = default;

		/// <summary>
		/// Default Move Assignment for IJsonParseHelper.
		/// </summary>
		/// <param name="other">The other IJsonParseHelper.</param>
		/// <returns>A reference to the new IJsonParseHelper.</returns>
		IJsonParseHelper& operator=(IJsonParseHelper && other) = default;

		/// <summary>
		/// Pure Virtual Create, creates a new IJsonParseHelper.
		/// </summary>
		/// <returns></returns>
		virtual gsl::owner<IJsonParseHelper*> Create() const = 0;

		/// <summary>
		/// Initializes the IJsonParseHelper.
		/// </summary>
		virtual void Initialize();

		virtual void Cleanup();
		
		/// <summary>
		/// Pure Virtual StartHandler call, starts the Handler.
		/// </summary>
		/// <param name="sharedData">A reference to the SharedData.</param>
		/// <param name="key">The key to add as the Scope. This is associated with JsonValue.</param>
		/// <param name="value">A reference to the JsonValue object that we are adding to a Scope.</param>
		/// <returns>A bool as to wheter the StartHandler was called.</returns>
		virtual bool StartHandler(JsonParseCoordinator::SharedData & sharedData, const std::string & key, const Json::Value & value, const std::size_t arrayIndex) = 0;

		/// <summary>
		/// Pure Virtual EndHandler call, ends the Handler.
		/// </summary>
		/// <param name="sharedData">A reference to the SharedData.</param>
		/// <param name="key">The key associated with the JsonValue.</param>
		/// <returns>A bool as to whether the EndHandler was called.</returns>
		virtual bool EndHandler(JsonParseCoordinator::SharedData & sharedData, const std::string & key, const Json::Value& value) = 0;

	private:

	};
}

