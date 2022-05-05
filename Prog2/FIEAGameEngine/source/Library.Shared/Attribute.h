#pragma once
#include "Scope.h"
#include "Signature.h"
#include "Registry.h"
#include <gsl/pointers>


namespace FieaGameEngine
{
	class Attribute : public Scope
	{
		RTTI_DECLARATIONS(Attribute, Scope);
		friend class Datum;
	public:

		virtual ~Attribute() = default;

		/// <summary>
		/// Copy constructor for Attribute.
		/// </summary>
		/// <param name="other">The otherAttribute</param>
		Attribute(const Attribute& other);

		/// <summary>
		/// Copy assignment operator for Attribute.
		/// </summary>
		/// <param name="other">the other Attribute</param>
		/// <returns>A reference to this Attribute</returns>
		Attribute& operator=(const Attribute& other);

		/// <summary>
		/// Move constructor for Attribute.
		/// </summary>
		/// <param name="other">The otherAttribute</param>
		Attribute(Attribute&& other) noexcept;

		/// <summary>
		/// Move assignment operator for Attribute.
		/// </summary>
		/// <param name="other">the other Attribute</param>
		/// <returns>A reference to this Attribute</returns>
		Attribute& operator=(Attribute&& other) noexcept;

		/// <summary>
		/// Appends an auxiliary Attribute to the Scope.
		/// </summary>
		/// <param name="string">The "key" string we want to append.</param>
		/// <returns>A reference to the newly appended Datum.</returns>
		Datum& AppendAuxiliaryAttribute(const std::string& string);

		/// <summary>
		/// A bool as to whether the passed in "key" string is an Attribute.
		/// </summary>
		/// <param name="string">The "key" string we want to append.</param>
		/// <returns>bool as to whether it is an Attribute or not.</returns>
		bool IsAttribute(const std::string& string) const;

		/// <summary>
		/// A bool as to whether the passed in "key" string is a prescribed Attribute (an attribute instantiated at initialization).
		/// </summary>
		/// <param name="string">The "key" string we want to append.</param>
		/// <returns>bool as to whether it is a prescribed Attribute or not.</returns>
		bool IsPrescribedAttribute(const std::string& string) const;

		/// <summary>
		/// A bool as to whether the passed in "key" string is an auxiliary Attribute (an attribute added at runtime).
		/// </summary>
		/// <param name="string">The "key" string we want to append.</param>
		/// <returns>bool as to whether it is an Attribute or not.</returns>
		bool IsAuxiliaryAttribute(const std::string& string) const;

		//const Vector<>& Attributes() const;
		//const Vector<>& PrescribedAttributes() const;
		//const Vector<>& AuxiliaryAttributes() const;

		const std::size_t PrescibedSize() const;

		/// <summary>
		/// To string override for for Attribute.
		/// </summary>
		/// <returns>A string.</returns>
		std::string ToString() const override
		{
			return "Attribute";
		}

		bool Equals(const RTTI* rhs) const override = 0;
		gsl::owner<Attribute*> Clone() const override = 0;

	protected:

		/// <summary>
		/// Constructor that takes in a typeID from the child class.
		/// </summary>
		/// <param name="childID">the childs typeID</param>
		explicit Attribute(RTTI::IdType childID);

	private:
		void Populate(RTTI::IdType childID);
		void UpdateExternalStorage(RTTI::IdType otherID);
		std::size_t prescribedSize;


	};
}

