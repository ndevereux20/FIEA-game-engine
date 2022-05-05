#include "datum.h"
#include "HashMap.h"
#include "RTTI.h"
#include "Factory.h"


namespace FieaGameEngine
{
#pragma once
	/// <summary>
	/// A Container to hold Key, datum pairs. Think of this as a c++ Struct. 
	/// </summary>
	class Scope: public RTTI
	{
		RTTI_DECLARATIONS(Scope, RTTI);
	public:
		using size_type = std::size_t;
		using key_type = std::string;
		using data_type = Datum;
		using scope_hash_map = HashMap<const key_type, data_type>;
		using vector_type = typename HashMap<const key_type, data_type>::pair_type*;


	public:

		/// <summary>
		/// Constructor for Scope that takes in an optional size to allocate to, default is 11.
		/// </summary>
		/// <param name="size">The size to allocate.</param>
		explicit Scope(size_type size = 11);

		/// <summary>
		/// Initializer list for Scope, takes in a key, and calls Append on the Scope with the appropriate key
		/// </summary>
		/// <param name="list">list of keys.</param>
		Scope(std::initializer_list<key_type> list);

		/// <summary>
		/// Destructor for Scope, destroys any heap allocated memory. 
		/// </summary>
		virtual ~Scope();

		/// <summary>
		/// Copy Constructor for Scope, copy's an already instantiated Scope to this one.
		/// </summary>
		/// <param name="other">The other pre instantated Scope.</param>
		Scope(const Scope& other);

		/// <summary>
		/// Copy Assignment for Scope, copy's an already instantiated Scope to another already instantiated Scope.
		/// </summary>
		/// <param name="other">The other pre instantiated Scope.</param>
		/// <returns>A refrence to the Scope.</returns>
		Scope& operator=(const Scope& other);

		/// <summary>
		/// Move Constructor for Scope, Moves an already instantiated Scope to this one.
		/// </summary>
		/// <param name="other">The other pre instantated Scope.</param>
		Scope(Scope&& other) noexcept;

		/// <summary>
		/// Move Assignment for Scope, Moves an already instantiated Scope to another already instantiated Scope.
		/// </summary>
		/// <param name="other">The other pre instantated Scope.</param>
		/// <returns>A reference to the Scope.</returns>
		Scope& operator=(Scope&& other) noexcept;
		
		/// <summary>
		/// Operator bracket that takes in a string to find in the current Scope, wraps Append. 
		/// </summary>
		/// <param name="string">The key to find in the current Scope.</param>
		/// <returns>A reference to the found (or newly created) Datum.</returns>
		Datum& operator[](const key_type& string);

		/// <summary>
		/// Operator bracket that takes in an index to get a Datum at. Will throw out of bounds error. 
		/// </summary>
		/// <param name="index">The index to find the Datum in the current Scope.</param>
		/// <returns>A reference to the found Datum.</returns>
		Datum& operator[](size_type index);

		/// <summary>
		/// Const version of Operator bracket that takes in an index to get a Datum at. Will throw out of bounds error. 
		/// </summary>
		/// <param name="index">The index to find the Datum in the current Scope.</param>
		/// <returns>A constant reference to the found Datum.</returns>
		const Datum& operator[](size_type index) const;

		/// <summary>
		/// Equality operator for Scope, compares this scope to the passed in Scope. Returns true if they are equivalent Scopes.
		/// </summary>
		/// <param name="other">The Scope we are comparing to this one.</param>
		/// <returns>A boolean as to wheter the two Scopes are equivalent.</returns>
		bool operator==(const Scope& other) const;

		/// <summary>
		/// Not Equal operator for scope, compares this scope to the passed in Scope. Returns true if they are not equivalent Scopes.
		/// </summary>
		/// <param name="other">The Scope we are comparing to this one.</param>
		/// <returns>A boolean as to wheter the two Scopes are not equivalent.</returns>
		bool operator!=(const Scope& other) const;

		/// <summary>
		/// Finds the passed in key (string) in the current Scope.
		/// </summary>
		/// <param name="string">The key (string) we are trying to find in this Scope.</param>
		/// <returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
		Datum* Find(const key_type& string);

		/// <summary>
		/// Const version of Find, Finds the passed in key (string) in the current Scope.
		/// </summary>
		/// <param name="string">The key (string) we are trying to find in this Scope.</param>
		/// <returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
		const Datum* Find(const key_type& string) const;

		/// <summary>
		/// Searches for the given key (string), in this Scope, and recursively up its parents.
		/// </summary>
		/// <param name="string">The key (string) we are trying to search for. </param>
		/// <returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
		Datum* Search(const key_type& string);

		/// <summary>
		/// Search that takes in an key to find and a reference to a Scope pointer. This reference contains the address of the Scope object with the contained key.
		/// </summary>
		/// <param name="string">The key (string) we are trying to search for</param>
		/// <param name="scope">A reference to a Scope*</param>
		/// <returns>Returns the address of the found Datum, nullptr if it wasnt found.</returns>
		Datum* Search(const key_type& string, Scope*& scope);

		/// <summary>
		/// Const version of Search, Searches for the given key (string), in this Scope, and recursively up its parents.
		/// </summary>
		/// <param name="string">The key (string) we are trying to search for. </param>
		/// <returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
		const Datum* Search(const key_type& string) const;

		/// <summary>
		/// Const version of Search that takes in an key to find and a reference to a Scope pointer. This reference contains the address of the Scope object with the contained key.
		/// </summary>
		/// <param name="string">The key (string) we are trying to search for</param>
		/// <param name="scope">A reference to a Scope*</param>
		/// <returns>Returns the address of the found (constant) Datum, nullptr if it wasnt found.</returns>
		const Datum* Search(const key_type& string, const Scope*& scope) const;

		Datum* GlobalSearch(const key_type& datumString);

		Datum* FindDownHeirarchy(const key_type& datumString);

		/// <summary>
		/// Creates a key Datum pair with the given Scope if the key doesnt exist and returns a reference to that Datum, otherwise it returns a reference to the already existing Datum.
		/// The Datum is Default constructed.
		/// </summary>
		/// <param name="string">The key to Append in the Scope.</param>
		/// <returns>A reference to the Appended/existing Datum.</returns>
		Datum& Append(const key_type& string);

		/// <summary>
		/// Appends a Scope to the given key, if the key exists and is of type Table, or Unkown. If the key doesnt exist create a new key Datum pair with the given key. 
		/// </summary>
		/// <param name="string">The key (string) we are trying to Append a Scope to.</param>
		/// <returns>A reference to the Scope with the given key.</returns>
		Scope& AppendScope(const key_type& string);

		/// <summary>
		/// Adopts a Scope from another parent. It cannot be a descendant of the scope you are trying to Adopt to.
		/// </summary>
		/// <param name="string">The key (string) we are creating an enrty of.</param>
		/// <returns>A reference to the child we are trying to Adopt.</returns>
		void Adopt(const key_type& string, Scope& child); 

		/// <summary>
		/// Gets the parent of the current Scope.
		/// </summary>
		/// <returns>Returns the address of the parent.</returns>
		Scope* GetParent() const;

		/// <summary>
		/// Clears all entries stored in this Scope and Deletes any nested Scopes. 
		/// </summary>
		void Clear();

		/// <summary>
		/// Finds a Scope contained in this one. 
		/// </summary>
		/// <param name="scope">The contained Scope we are trying to find.</param>
		/// <returns>A pair of Datum*(the address of the found Datum) and an index at which it was found in that Datum. </returns>
		std::pair<Datum*, size_type> FindContainedScope(Scope* const scope);

		/// <summary>
		/// Checks to see if the passed in Scope is a descendant of this one.
		/// </summary>
		/// <param name="scope">The Scope we are querying.</param>
		/// <returns>A boolean as to whether the passed in Scope is a descendant of this Scope.</returns>
		bool IsAncestorOf(const Scope& scope) const; 

		/// <summary>
		/// Checks to see if the passed in Scope is an ancestor of this one. 
		/// </summary>
		/// <param name="scope">he Scope we are querying.</param>
		/// <returns>A boolean as to whether the passed in Scope is a ancestor of this Scope.</returns>
		bool IsDescendantOf(const Scope& scope) const;

		std::size_t Size() const;

		/// <summary>
		/// Equals override for an RTTI. Will cast if the given RTTI is really a Scope. Calls the Equality operator for Scopes.
		/// </summary>
		/// <param name="rhs">The other RTTI* we are comparing to this one</param>
		/// <returns>a boolean as to whether the passed in RTTI* is equivalent to this Scope.</returns>
		bool Equals(const RTTI* rhs) const override;

		std::string ToString() const override
		{
			return "Scope";
		}
	protected:
		virtual Scope* Clone() const;

		Scope* _parent{ nullptr };
		scope_hash_map _map;
		Vector<vector_type> _orderVector;

	private:
		bool Orphan(Scope& child);
	};
	ConcreteFactory(Scope, Scope);
}
