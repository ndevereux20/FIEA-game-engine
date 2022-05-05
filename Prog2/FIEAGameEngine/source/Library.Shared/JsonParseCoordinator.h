#pragma once
#pragma warning(push)
#pragma warning(disable:4635)
#pragma warning(disable:26812)
#include <json/json.h>
#pragma warning(pop)
#include "RTTI.h"
#include "Vector.h"
#include <gsl/pointers>

namespace FieaGameEngine
{
	class IJsonParseHelper;

	/// <summary>
	/// JsonParseCoordinator, controls the functionality of JsonParseHelpers. Finds an associated Helper that can handle the grammar of the Json.
	/// Wraps JsonCpp functionality. 
	/// </summary>
	class JsonParseCoordinator final
	{
		
	public:

		/// <summary>
		/// SharedData class is a wrapper class. It represents all the data that the helpers share with each other and the JsonParseCoordinator
		/// </summary>
		class SharedData : public RTTI
		{
			friend JsonParseCoordinator;
			RTTI_DECLARATIONS(SharedData, RTTI);
		public:
			/// <summary>
			/// Defaulted Constructor.
			/// </summary>
			SharedData() = default;

			/// <summary>
			/// Defaulted Destructor.
			/// </summary>
			virtual ~SharedData() = default;

			/// <summary>
			/// Defaulted Copy Constructor.
			/// </summary>
			/// <param name="other">The other SharedData.</param>
			SharedData(const SharedData& other) = default;

			/// <summary>
			/// Defaulted Copy Assignment.
			/// </summary>
			/// <param name="other">The other SharedData.</param>
			/// <returns>The new SharedData.</returns>
			SharedData& operator=(const SharedData& other) = default;

			/// <summary>
			/// Default Move Constructor.
			/// </summary>
			/// <param name="other">The other SharedData.</param>
			SharedData(SharedData&& other) = default;

			/// <summary>
			/// Default Move Assignment. 
			/// </summary>
			/// <param name="other">The other SharedData.</param>
			/// <returns>The new SharedData.</returns>
			SharedData& operator=(SharedData&& other) = default;

			/// <summary>
			/// Returns the JsonParseCoordinator associated with this SharedData.
			/// </summary>
			/// <returns>The JsonParseCoordinator.</returns>
			JsonParseCoordinator* GetJsonParseCoordinator();

			/// <summary>
			/// Returns the JsonParseCoordinator associated with this SharedData.
			/// </summary>
			/// <returns>The JsonParseCoordinator.</returns>
			const JsonParseCoordinator* GetJsonParseCoordinator() const;

			/// <summary>
			/// Increment the Depth of the SharedData.
			/// </summary>
			void IncrementDepth();

			/// <summary>
			/// Decrements the Depth of the SharedData.
			/// </summary>
			void DecrementDepth();

			/// <summary>
			/// Gets the Depth of the SharedData.
			/// </summary>
			/// <returns></returns>
			std::size_t Depth();

			/// <summary>
			/// Initializes the SharedData. 
			/// </summary>
			virtual void Initialize();

			/// <summary>
			/// Cleans up the SharedData.
			/// </summary>
			virtual void Cleanup();

			/// <summary>
			/// Pure virtual Create function.
			/// </summary>
			/// <returns></returns>
			virtual gsl::owner<SharedData*> Create() const = 0;

		private:
			void SetJsonParseCoordinator(JsonParseCoordinator* parseCoordinator);
			std::size_t _depth = 0;
			JsonParseCoordinator* _owner{ nullptr };
		};

		/// <summary>
		/// Constructor for JsonParseCoordinator that takes in the SharedData to associate with it.
		/// </summary>
		/// <param name="sharedData"></param>
		JsonParseCoordinator(SharedData& sharedData);

		/// <summary>
		/// Destructor for JsonParseCoordinator.
		/// </summary>
		~JsonParseCoordinator();

		/// <summary>
		/// Clones this JsonParseCoordinator, The user is responsible for deleting the Cloned object.
		/// </summary>
		/// <returns>A pointer to a new JsonParseCoordinator.</returns>
		gsl::owner<JsonParseCoordinator*> Clone();
		JsonParseCoordinator(const JsonParseCoordinator& other) = delete;
		JsonParseCoordinator& operator=(const JsonParseCoordinator& other) = delete;

		/// <summary>
		/// Move Constructor for JsonParseCoordinator, expects no exceptions. 
		/// </summary>
		/// <param name="other">The other JsonParseCoordinator.</param>
		JsonParseCoordinator(JsonParseCoordinator&& other) noexcept;

		/// <summary>
		/// Move Assignment for JsonParseCoordinator, expects no exceptions.
		/// </summary>
		/// <param name="other">The other JsonParseCoordinator.</param>
		/// <returns>A reference to the JsonParseCoordinator.</returns>
		JsonParseCoordinator& operator=(JsonParseCoordinator&& other) noexcept;

		/// <summary>
		/// Initialize the JsonParseCoordinator.
		/// </summary>
		void Initialize();


		/// <summary>
		/// Adds a helper to the JsonParseCoordinator. Cannot do this if it is a Clone.
		/// </summary>
		/// <param name="helper">A reference to the Helper to add.</param>
		void AddHelper(IJsonParseHelper& helper);

		/// <summary>
		/// Removes a helper from the JsonParseCoordinator. Cannot do this if it is a Clone.
		/// </summary>
		/// <param name="helper">A reference to the Helper to remove.</param>
		void RemoveHelper(IJsonParseHelper& helper);

		/// <summary>
		/// Parses a string in Json format.
		/// </summary>
		/// <param name="jsonString">The Json string to Parse.</param>
		void Parse(const std::string& jsonString);

		/// <summary>
		/// Parses a Json file.
		/// </summary>
		/// <param name="filename">The file to Parse.</param>
		void ParseFromFile(const std::string& filename);

		/// <summary>
		/// Parses an istream in Json format.
		/// </summary>
		/// <param name="jsonStream">The Json istream to Parse.</param>
		void Parse(std::istream& jsonStream);

		/// <summary>
		/// Sets the SharedData for the JsonParseCoordinator.
		/// </summary>
		/// <param name="sharedData">The SharedData to set.</param>
		void SetSharedData(SharedData* sharedData);

		/// <summary>
		/// Gets the SharedData associated with this JsonParseCoordinator.
		/// </summary>
		/// <returns>A pointer to the SharedData.</returns>
		SharedData* GetSharedData();

		/// <summary>
		/// Gets the SharedData associated with this JsonParseCoordinator.
		/// </summary>
		/// <returns>A pointer to the SharedData.</returns>
		const SharedData* GetSharedData() const;

		/// <summary>
		/// Asks whether the JsonParseCoordinator is a clone or not.
		/// </summary>
		/// <returns>A bool as to whether the JsonParseCoordinator is a clone.</returns>
		bool IsClone() const;

		/// <summary>
		/// Gets the Vector of Helpers associated with this JsonParseCoordinator.
		/// </summary>
		/// <returns>A constant reference to the Vector Helper pointers.</returns>
		const Vector<IJsonParseHelper*>& Helpers();
	
	private:
		void ParseMembers(const Json::Value& jsonValue);
		void Parse(const std::string& key, const Json::Value& stringJsonPair, const std::size_t arrayIndex);
		void Cleanup();

		Vector<IJsonParseHelper*> _helpers;
		SharedData* _sharedData = nullptr;
		bool _isClone = false; 
	};

}
