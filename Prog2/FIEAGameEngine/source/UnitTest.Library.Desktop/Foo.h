#pragma once

#include "pch.h"
#include "RTTI.h"
#include "Factory.h"

namespace UnitTestLibraryDesktop
{
	/// <summary>
	/// A Foo class, used for testing 
	/// </summary>
	class Foo : public FieaGameEngine::RTTI
	{
		RTTI_DECLARATIONS(Foo, FieaGameEngine::RTTI);

	public:
		/// <summary>
		/// Default constructor for Foo.
		/// </summary>
		Foo() = default;

		/// <summary>
		/// Constructor to set all data members.
		/// </summary>
		/// <param name="data">The data we want to set mData to.</param>
		Foo(std::int32_t data);

		/// <summary>
		/// Instantiates a Foo from an existing one 
		/// </summary>
		/// <param name="other"></param>
		Foo(const Foo& other);

		/// <summary>
		/// Assigns an already already Instantiated Foo to another 
		/// </summary>
		/// <param name="other">The rhs of the assignment (Foo we want to assign to this class).</param>
		/// <returns></returns>
		Foo& operator=(const Foo& other);
		virtual ~Foo();

		/// <summary>
		/// Gets the private member mData.
		/// </summary>
		/// <returns>Returns a reference to this classes mData.</returns>
		int& Data();

		/// <summary>
		/// Gets the private member mData.
		/// </summary>
		/// <returns>Returns a constant reference to this classes mData.</returns>
		const int& Data() const;

		/// <summary>
		/// Compares one Foo to another to check if they are the same (data members are the same). 
		/// </summary>
		/// <param name="rhs">The Foo we are comparing with this Foo.</param>
		/// <returns>Boolean to whether the Foos are equivalent.</returns>
		bool operator==(const Foo& rhs) const;

		/// <summary>
		/// Compares one Foo to another to check if they are NOT the same (data members arent the same).
		/// </summary>
		/// <param name="rhs">The Foo we are comparing with this Foo.</param>
		/// <returns>Boolean to whether the Foos are equivalent.</returns>
		bool operator!=(const Foo& rhs) const;

	private:
		std::int32_t* mData{ nullptr }; 
	};

	ConcreteFactory(Foo, FieaGameEngine::RTTI);
}