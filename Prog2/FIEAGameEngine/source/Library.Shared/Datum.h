#pragma once
#include <cstdint>
#include <string.h> 

#pragma warning(push)
#pragma warning(disable:4201)
#pragma warning(disable:4635)
#include "glm\glm.hpp"
#pragma warning(pop)

namespace FieaGameEngine
{
	/// <summary>
	/// Enum class of the types that can be stored in the Datum
	/// </summary>
	enum class DatumTypes
	{
		Unknown, 
		Integer,
		Float, 
		Vector, 
		Matrix, 
		String, 
		Pointer,
		Table,

		Begin = Integer,
		End = Table
	};

	class RTTI;
	class Scope;
	/// <summary>
	/// Datum is a Vector that determines its type at runtime.
	/// </summary>
	class Datum final 
	{
		friend Scope;
	public: 
		using size_type = std::size_t;

		/// <summary>
		/// Constructor for a Datum.
		/// </summary>
		Datum();
		/// <summary>
		/// Constructor for a datum that takes in a type and an optional capacity (defaults to 10).
		/// </summary>
		/// <param name="type">Type for the Datum.</param>
		/// <param name="capacity">Capacity of Datum.</param>
		Datum(DatumTypes type, size_type capacity = 10);

		/// <summary>
		/// Assigns an already instantiated Datum to another instantiated Datum.
		/// </summary>
		/// <param name="otherDatum">The Datum we are assigning to this one.</param>
		/// <returns>A reference to a Datum.</returns>
		Datum& operator=(const Datum& otherDatum);

		/// <summary>
		/// Scalar assignment for an int to a datum. Sets the first element in the datum to the passed in value.
		/// </summary>
		/// <param name="value">The integer value.</param>
		/// <returns>A reference to a Datum.</returns>
		Datum& operator=(const std::int32_t value);

		/// <summary>
		/// Scalar assignment for a float to a datum. Sets the first element in the datum to the passed in value.
		/// </summary>
		/// <param name="value">The float value.</param>
		/// <returns>A reference to a Datum.</returns>
		Datum& operator=(const float value);

		/// <summary>
		/// Scalar assignment for a math vector to a datum. Sets the first element in the datum to the passed in value.
		/// </summary>
		/// <param name="value">The vector (of 4 floats) value.</param>
		/// <returns>A reference to a Datum.</returns>
		Datum& operator=(const glm::vec4& value);

		/// <summary>
		/// Scalar assignment for a math matrix to a datum. Sets the first element in the datum to the passed in value.
		/// </summary>
		/// <param name="value">The matrix (of 16 floats) value.</param>
		/// <returns>A reference to a Datum.</returns>
		Datum& operator=(const glm::mat4& value);

		/// <summary>
		/// Scalar assignment for a string to a datum. Sets the first element in the datum to the passed in value.
		/// </summary>
		/// <param name="value">The string value.</param>
		/// <returns>A reference to a Datum.</returns>
		Datum& operator=(const std::string& value);

		/// <summary>
		/// Scalar assignment for a Run Time Type Information pointer to a datum. Sets the first element in the datum to the passed in value.
		/// </summary>
		/// <param name="value">The Run Time Type Information pointer value.</param>
		/// <returns>A reference to a Datum.</returns>
		Datum& operator=(RTTI* value);


		/// <summary>
		/// Destructor for a Datum.
		/// </summary>
		~Datum();

		/// <summary>
		/// Instantiates a Datum from another one, by copy.
		/// </summary>
		/// <param name="value">The other Datum.</param>
		Datum(const Datum& otherDatum);

		/// <summary>
		/// Instantiates a Datum from a scalar int.
		/// </summary>
		/// <param name="value">the int value.</param>
		Datum(const std::int32_t& value);

		/// <summary>
		/// Instantiates a Datum from a scalar float.
		/// </summary>
		/// <param name="value">the float value.</param>
		Datum(const float& value);

		/// <summary>
		/// Instantiates a Datum from a scalar math vector.
		/// </summary>
		/// <param name="value">the math vector value.</param>
		Datum(const glm::vec4& value);

		/// <summary>
		/// Instantiates a Datum from a scalar math matrix.
		/// </summary>
		/// <param name="value">the math matrix value.</param>
		Datum(const glm::mat4& value);

		/// <summary>
		/// Instantiates a Datum from a scalar string.
		/// </summary>
		/// <param name="value">the string value.</param>
		Datum(const std::string& value);

		/// <summary>
		/// Instantiates a Datum from a scalar Run Time Type Information pointer.
		/// </summary>
		/// <param name="value">the Run Time Type Information pointer value.</param>
		Datum(RTTI* value);


		/// <summary>
		/// Move copy for a Datum.
		/// </summary>
		/// <param name="otherDatum">The other Datum.</param>
		Datum(Datum&& otherDatum) noexcept;

		/// <summary>
		/// Move assignment for a Datum.
		/// </summary>
		/// <param name="otherDatum">The other Datum.</param>
		/// <returns>A reference to this Datum.</returns>
		Datum& operator=(Datum&& otherDatum) noexcept;

		/// <summary>
		/// Returns the type the Datum is.
		/// </summary>
		/// <returns>A constant Datum Type.</returns>
		const DatumTypes Type() const;

		/// <summary>
		/// Sets the type of the Datum.
		/// </summary>
		/// <param name="type">the type to set the Datum to.</param>
		void SetType(DatumTypes type);

		/// <summary>
		/// Gets the size of the Datum.
		/// </summary>
		/// <returns>A unsigned integer of the size.</returns>
		const size_type Size() const;

		/// <summary>
		/// Gets the capacity of the Datum.
		/// </summary>
		/// <returns>A unsigned integer of the capacity.</returns>
		const size_type Capacity() const; 

		/// <summary>
		/// Returns a bool as to whether the Datum is empty or not.
		/// </summary>
		/// <returns>a bool as to whether the Datum is empty or now.</returns>
		bool IsEmpty() const;

		/// <summary>
		/// Returns a bool as to whether the Datum is external or not.
		/// </summary>
		/// <returns>a bool as to whether the Datum is external or now.</returns>
		bool IsExternal() const;

		/// <summary>
		/// Resizes the Datum to the passed in size. Can shrink or grow the Datum.
		/// </summary>
		/// <param name="size">The unsigned int to resize to.</param>
		void Resize(size_type size);

		/// <summary>
		/// Reserves space to the passed in size, cannot shrink the Datum.
		/// </summary>
		/// <param name="capacity">The unsigned int to resize to.</param>
		void Reserve(size_type capacity);

		/// <summary>
		/// Shrinks the Datum to the current size.
		/// </summary>
		void ShrinkToFit();

		/// <summary>
		/// Clear all elements in the Datum.
		/// </summary>
		void Clear();

		/// <summary>
		/// Sets the storage to external for the Datum.
		/// </summary>
		/// <param name="list">Pointer to an integer(or many)</param>
		/// <param name="numElements">The number of elements.</param>
		void SetStorage(std::int32_t* list, size_type numElements);

		/// <summary>
		/// Sets the storage to external for the Datum.
		/// </summary>
		/// <param name="list">Pointer to an float(or many)</param>
		/// <param name="numElements">The number of elements.</param>
		void SetStorage(float* list, size_type numElements);

		/// <summary>
		/// Sets the storage to external for the Datum.
		/// </summary>
		/// <param name="list">Pointer to an math vector(or many)</param>
		/// <param name="numElements">The number of elements.</param>
		void SetStorage(glm::vec4* list, size_type numElements);

		/// <summary>
		/// Sets the storage to external for the Datum.
		/// </summary>
		/// <param name="list">Pointer to an math matrix(or many)</param>
		/// <param name="numElements">The number of elements.</param>
		void SetStorage(glm::mat4* list, size_type numElements);

		/// <summary>
		/// Sets the storage to external for the Datum.
		/// </summary>
		/// <param name="list">Pointer to an string(or many)</param>
		/// <param name="numElements">The number of elements.</param>
		void SetStorage(std::string* list, size_type numElements);

		/// <summary>
		/// Sets the storage to external for the Datum.
		/// </summary>
		/// <param name="list">Pointer to an Run Time Type Information pointer(or many)</param>
		/// <param name="numElements">The number of elements.</param>
		void SetStorage(RTTI** list, size_type numElements);

		/// <summary>
		/// Equivalence comparison for Datums.
		/// </summary>
		/// <param name="otherDatum">The Datum we are equating to.</param>
		/// <returns>bool as to whether they are the equivelent.</returns>
		bool operator==(const Datum& otherDatum) const;

		/// <summary>
		/// Equivalence comparison for an int. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The int we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator==(std::int32_t i) const;

		/// <summary>
		/// Equivalence comparison for a float. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The float we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator==(float f) const;

		/// <summary>
		/// Equivalence comparison for a math vector. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The math vector we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator==(const glm::vec4& vec) const;

		/// <summary>
		/// Equivalence comparison for a math matrix. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The math matrix we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator==(const glm::mat4& vec) const;

		/// <summary>
		/// Equivalence comparison for a string. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The string we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator==(const std::string& s) const;

		/// <summary>
		/// Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator==(RTTI* r) const;

		/// <summary>
		/// Non-Equivalence comparison for Datums.
		/// </summary>
		/// <param name="otherDatum">The Datum we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator!=(const Datum& otherDatum) const;

		/// <summary>
		/// Non-Equivalence comparison for an int. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The int we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator!=(std::int32_t i) const;

		/// <summary>
		/// Non-Equivalence comparison for a float. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The float we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator!=(float f) const;

		/// <summary>
		/// Non-Equivalence comparison for a math vector. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The math vector we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator!=(const glm::vec4& vec) const;

		/// <summary>
		/// Non-Equivalence comparison for a math matrix. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The math matrix we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator!=(const glm::mat4& vec) const;

		/// <summary>
		/// Equivalence comparison for a string. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The string we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator!=(const std::string& s) const;

		/// <summary>
		/// Equivalence comparison for a Run Time Type Information pointer. Compares the first value of the Datum.
		/// </summary>
		/// <param name="otherDatum">The Run Time Type Information pointer we are equating to.</param>
		/// <returns>bool as to whether they are the equivalent.</returns>
		bool operator!=(RTTI* r) const;

		Scope& operator[](size_type index);

		Scope& operator[](size_type index) const ;
		
		/// <summary>
		/// Sets the given int value to the given index of the Datum.
		/// </summary>
		/// <param name="value">The int value</param>
		/// <param name="index">The index.</param>
		void Set(std::int32_t value, size_type index = 0);

		/// <summary>
		/// Sets the given float value to the given index of the Datum.
		/// </summary>
		/// <param name="value">The float value</param>
		/// <param name="index">The index.</param>
		void Set(float value, size_type index = 0);

		/// <summary>
		/// Sets the given math vector value to the given index of the Datum.
		/// </summary>
		/// <param name="value">The math vector value</param>
		/// <param name="index">The index.</param>
		void Set(glm::vec4 value, size_type index = 0);

		/// <summary>
		/// Sets the given math matrix value to the given index of the Datum.
		/// </summary>
		/// <param name="value">The math matrix value</param>
		/// <param name="index">The index.</param>
		void Set(glm::mat4 value, size_type index = 0);

		/// <summary>
		/// Sets the given string value to the given index of the Datum.
		/// </summary>
		/// <param name="value">The string value</param>
		/// <param name="index">The index.</param>
		void Set(std::string value, size_type index = 0);

		/// <summary>
		/// Sets the given Run Time Type Information pointer value to the given index of the Datum.
		/// </summary>
		/// <param name="value">The Run Time Type Information pointer value</param>
		/// <param name="index">The index.</param>
		void Set(RTTI* value, size_type index = 0);

		void Set(Scope* value, size_type index = 0);

		/// <summary>
		/// Templated Get that returns the value at the given index, supports types: int, float, glm::vec4, glm::mat4, string, and Run Time Type Information pointers.
		/// </summary>
		/// <param name="index">Index to get the value at.</param>
		/// <returns>A reference to the returned value, of the appropriate type</returns>
		template <typename T> T& Get(size_type index = 0);
		
		/// <summary>
		/// Templated const version of Get that returns the value at the given index, supports types: int, float, glm::vec4, glm::mat4, string, and Run Time Type Information pointers.
		/// </summary>
		/// <param name="index">Index to get the value at.</param>
		/// <returns>A reference to the returned value, of the appropriate type</returns>
		template <typename T> const T& Get(size_type index = 0) const;
		
		/// <summary>
		/// Converts the given string value to the appropriate type, and sets that value to the given index's value of the Datum.
		/// </summary>
		/// <param name="string">The string to set.</param>
		/// <param name="index">The index to set at.</param>
		void SetFromString(std::string string, size_type index = 0); 

		/// <summary>
		/// Converts the value at the given index (defaults to 0) to a String of appropriate type.
		/// </summary>
		/// <param name="index">The index whose value we are converting to a string.</param>
		/// <returns>The converted string.</returns>
		std::string ToString(size_type index = 0) const;

		/// <summary>
		/// Pushes the int value to the back of the Datum.
		/// </summary>
		/// <param name="value">The int value.</param>
		void PushBack(const std::int32_t value);

		/// <summary>
		/// Pushes the float value to the back of the Datum.
		/// </summary>
		/// <param name="value">The float value.</param>
		void PushBack(const float value);

		/// <summary>
		/// Pushes the math vector value to the back of the Datum.
		/// </summary>
		/// <param name="value">The math vector value.</param>
		void PushBack(const glm::vec4& value);

		/// <summary>
		/// Pushes the math matrix value to the back of the Datum.
		/// </summary>
		/// <param name="value">The math matrix value.</param>
		void PushBack(const glm::mat4& value);

		/// <summary>
		/// Pushes the string value to the back of the Datum.
		/// </summary>
		/// <param name="value">The string value.</param>
		void PushBack(const std::string& value);

		/// <summary>
		/// Pushes the Run Time Type Information pointer value to the back of the Datum.
		/// </summary>
		/// <param name="value">The Run Time Type Information pointer value.</param>
		void PushBack(RTTI* value);

		void PushBackFromString(const std::string& valueString);
		/// <summary>
		/// Removes the last element of the Datum.
		/// </summary>
		void PopBack();

		/// <summary>
		/// Gets the value at the front of the Datum, template supports: int, float, glm::vec4, glm::mat4, string, and Run Time Type Information pointers.
		/// </summary>
		/// <returns>Returns a reverence to the value.</returns>
		template <typename T> T& Front();

		/// <summary>
		/// Gets the value at the front of the Datum, template supports: int, float, glm::vec4, glm::mat4, string, and Run Time Type Information pointers.
		/// </summary>
		/// <returns>Returns a constant reverence to the value.</returns>
		template <typename T> const T& Front() const;

		/// <summary>
		/// Gets the value at the back of the Datum, template supports: int, float, glm::vec4, glm::mat4, string, and Run Time Type Information pointers.
		/// </summary>
		/// <returns>Returns a reverence to the value.</returns>
		template <typename T> T& Back();

		/// <summary>
		/// Gets the value at the back of the Datum, template supports: int, float, glm::vec4, glm::mat4, string, and Run Time Type Information pointers.
		/// </summary>
		/// <returns>Returns a constant reverence to the value.</returns>
		template <typename T> const T& Back() const;
		
		/// <summary>
		/// Removes the given int value from Datum if it exists in the Datum.
		/// </summary>
		/// <param name="value">The int value to remove.</param>
		/// <returns>A Boolean as to whether the int value was removed or not.</returns>
		bool Remove(std::int32_t value);

		/// <summary>
		/// Removes the given float value from Datum if it exists in the Datum.
		/// </summary>
		/// <param name="value">The float value to remove.</param>
		/// <returns>A Boolean as to whether the float value was removed or not.</returns>
		bool Remove(float value);

		/// <summary>
		/// Removes the given math vector value from Datum if it exists in the Datum.
		/// </summary>
		/// <param name="value">The math vector value to remove.</param>
		/// <returns>A Boolean as to whether the math vector value was removed or not.</returns>
		bool Remove(const glm::vec4& value);

		/// <summary>
		/// Removes the given math matrix value from Datum if it exists in the Datum.
		/// </summary>
		/// <param name="value">The math matrix value to remove.</param>
		/// <returns>A Boolean as to whether the math matrix value was removed or not.</returns>
		bool Remove(const glm::mat4& value);

		/// <summary>
		/// Removes the given string value from Datum if it exists in the Datum.
		/// </summary>
		/// <param name="value">The string value to remove.</param>
		/// <returns>A Boolean as to whether the string value was removed or not.</returns>
		bool Remove(const std::string& value);

		/// <summary>
		/// Removes the given Run Time Type Information pointer value from Datum if it exists in the Datum.
		/// </summary>
		/// <param name="value">The Run Time Type Information pointer value to remove.</param>
		/// <returns>A Boolean as to whether the Run Time Type Information pointer value was removed or not.</returns>
		bool Remove(RTTI* value);

		bool Remove(Scope* value);

		/// <summary>
		/// Removes the value at the given index (defaults to 0).
		/// </summary>
		/// <param name="index">The index to remove at.</param>
		void RemoveAt(size_type index = 0);

		/// <summary>
		/// Finds the given int value in the Datum. 
		/// </summary>
		/// <param name="value">The int value.</param>
		/// <returns>A pair type of: boolean as to whether the int value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
		std::pair<bool, size_type> Find(std::int32_t value);

		/// <summary>
		/// Finds the given float value in the Datum. 
		/// </summary>
		/// <param name="value">The float value.</param>
		/// <returns>A pair type of: boolean as to whether the float value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
		std::pair<bool, size_type> Find(float value);

		/// <summary>
		/// Finds the given math vector value in the Datum. 
		/// </summary>
		/// <param name="value">The math vector value.</param>
		/// <returns>A pair type of: boolean as to whether the math vector value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
		std::pair<bool, size_type> Find(const glm::vec4& value);

		/// <summary>
		/// Finds the given math matrix value in the Datum. 
		/// </summary>
		/// <param name="value">The math matrix value.</param>
		/// <returns>A pair type of: boolean as to whether the math matrix value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
		std::pair<bool, size_type> Find(const glm::mat4& value);

		/// <summary>
		/// Finds the given string value in the Datum. 
		/// </summary>
		/// <param name="value">The string value.</param>
		/// <returns>A pair type of: boolean as to whether the string value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
		std::pair<bool, size_type> Find(const std::string& value);

		/// <summary>
		/// Finds the given Run Time Type Information pointer value in the Datum. 
		/// </summary>
		/// <param name="value">The Run Time Type Information pointer value.</param>
		/// <returns>A pair type of: boolean as to whether the Run Time Type Information pointer value was found, and the index it was found at (if found), otherwise the index is the size of the Datum.</returns>
		std::pair<bool, size_type> Find(RTTI* value);

		std::pair<bool, size_type> Find(Scope* value);
		
	private:
		union DatumValues final
		{
			std::int32_t* i; 
			float* f;
			glm::vec4* vec;
			glm::mat4* mat;
			std::string* s;
			RTTI** r;
			Scope** t;
			void* vp{ nullptr };

		};
		friend class Attribute;
		void SetStorage(DatumTypes type, void* data, size_type size);
		void PushBack(Scope& value);
		Datum(Scope& value);
		Datum& operator=(Scope& value);

		DatumValues _data;
		size_type _capacity{ 0 };
		size_type _size{ 0 }; 
		DatumTypes _type{ DatumTypes::Unknown };
		bool _isExternal{ false }; 

		static const size_type DatumTypeSizes[static_cast<size_type>(DatumTypes::End) + 1];


	};
}

#include "Datum.inl"
