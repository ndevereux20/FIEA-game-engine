#pragma once
#include <cstddef>
#include <cstdint>

namespace FieaGameEngine
{
	/// <summary>
	/// A templated class for a singly-linked list.
	/// </summary>
	/// <typeparam name="T">The type of element stored in your list</typeparam>
	template <typename T>
	class Slist final 
	{
	private: 
		struct Node final 
		{
			T Data;
			Node* Next;

			template <typename... Args>
			Node(Node* next = nullptr, Args&&... args) :
				Data(std::forward<Args>(args)...), Next(next)
			{
			}
		};
	public:
		/// <summary>
		/// An Iterator class for an Slist.
		/// </summary>
		class Iterator final
		{
			friend Slist;
			friend class ConstIterator;
		public:
			/// <summary>
			/// Default constructor for Iterator.
			/// </summary>
			Iterator() = default;

			/// <summary>
			/// Default constructor for Iterator.
			/// </summary>
			~Iterator() = default;

			/// <summary>
			/// Default Assignment constructor for Iterator. 
			/// </summary>
			/// <param name="other">The Iterator you are assigning to this one.</param>
			/// <returns>This Iterator (left-hand-side)</returns>
			Iterator& operator=(const Iterator& other) = default;

			/// <summary>
			/// Default copy constructor for Iterator.
			/// </summary>
			/// <param name="other">The Iterator you are copying to this one.</param>
			Iterator(const Iterator& other) = default;

			/// <summary>
			/// Equal equal operator for Iterator, checks to see if two Iterators are equivalent. 
			/// </summary>
			/// <param name="other">The Iterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator==(const Iterator& other) const;

			/// <summary>
			/// Not equal operator for Iterator, checks to see if two Iterators are not equivalent.
			/// </summary>
			/// <param name="other">The Iterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator!=(const Iterator& other) const;

			/// <summary>
			/// Prefix increment operator for Iterator. 
			/// </summary>
			/// <returns>A reference to the Iterator you are incrementing.</returns>
			Iterator& operator++();

			/// <summary>
			/// Postfix increment operator for Iterator.
			/// </summary>
			/// <returns>The Iterator you are incrementing.</returns>
			Iterator operator++(int);

			/// <summary>
			/// The dereference operator for an Iterator.
			/// </summary>
			/// <returns>A reference to the T item's data.</returns>
			T& operator*() const;

		private:
			Iterator(const Slist& owner, Node* node = nullptr);

			const Slist* _owner{ nullptr };
			Node* _node{ nullptr };

		};

		/// <summary>
		/// A ConstItearator class for Slist.
		/// </summary>
		class ConstIterator final
		{
			friend class Slist;
		public:
			/// <summary>
			/// default constructor for ConstIterator.
			/// </summary>
			ConstIterator() = default;

			/// <summary>
			/// Default constructor for ConstIterator.
			/// </summary>
			~ConstIterator() = default;

			/// <summary>
			/// Default Assignment constructor for ConstIterator. 
			/// </summary>
			/// <param name="other">The ConstIterator you are assigning to this one.</param>
			/// <returns>This ConstIterator (left-hand-side)</returns>
			ConstIterator& operator=(const ConstIterator& other) = default;

			/// <summary>
			/// Default copy constructor for ConstIterator.
			/// </summary>
			/// <param name="other">The ConstIterator you are copying to this one.</param>
			ConstIterator(const ConstIterator& other) = default;

			/// <summary>
			/// Typecast constructor for an Iterator to a ConstIterator. 
			/// </summary>
			/// <param name="other">The Iterator you are casting.</param>
			ConstIterator(const Iterator& other);

			/// <summary>
			/// Equal equal operator for ConstIterator, checks to see if two ConstIterators are equivalent. 
			/// </summary>
			/// <param name="other">The ConstIterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator==(const ConstIterator& other) const;

			/// <summary>
			/// Not equal operator for ConstIterator, checks to see if two ConstIterators are not equivalent.
			/// </summary>
			/// <param name="other">The ConstIterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator!=(const ConstIterator& other) const;

			/// <summary>
			/// Prefix increment operator for ConstIterator. 
			/// </summary>
			/// <returns>A reference to the ConstIterator you are incrementing.</returns>
			ConstIterator& operator++();

			/// <summary>
			/// Postfix increment operator for ConstIterator.
			/// </summary>
			/// <returns>The Iterator you are incrementing.</returns>
			ConstIterator operator++(int);

			/// <summary>
			/// The dereference operator for an Iterator.
			/// </summary>
			/// <returns>A reference to the T item's data.</returns>
			const T& operator*() const;
		private:
			ConstIterator(const Slist& owner, Node* node = nullptr);

			const Slist* _owner{ nullptr };
			Node* _node{ nullptr };

		};

		/// <summary>
		/// Inserts the given item after the given Iterator. 
		/// </summary>
		/// <param name="item">A reference to the item we are inserting into the list.</param>
		/// <param name="it">A reference to the Iterator.</param>
		void InsertAfter(const T& item, const Iterator& it);

		/// <summary>
		/// Removes the given item from the list (if it exists). 
		/// </summary>
		/// <param name="item">A reference to the item we are trying to remove from the list.</param>
		/// <param name="it">A reference to the Iterator.</param>
		/// <param name="equalityFunctor">Functor for comparing too unknown data types.</param>
		void Remove(const T& item, const Iterator& it, std::function<bool(const T&, const T&)> equalityFunctor = std::equal_to<T>());

		/// <summary>
		/// Remove an item from the list at the given Iterator position.
		/// </summary>
		/// <param name="it">The Iterator.</param>
		void Remove(Iterator it);

		/// <summary>
		/// Finds the given data item in the list. 
		/// </summary>
		/// <param name="value">The value we are trying to find in the list.</param>
		/// <param name="equalityFunctor">Functor for comparing too unknown data types.</param>
		/// <returns>An Iterator.</returns>
		Iterator Find(const T& value, std::function<bool(const T&, const T&)> equalityFunctor = std::equal_to<T>());

		/// <summary>
		/// Finds the given data item in the list. 
		/// </summary>
		/// <param name="value">The value we are trying to find in the list.</param>
		/// <param name="equalityFunctor">Functor for comparing too unknown data types.</param>
		/// <returns>A ConstIterator.</returns>
		ConstIterator Find(const T& value, std::function<bool(const T&, const T&)> equalityFunctor = std::equal_to<T>()) const;

		/// <summary>
		/// Returns a ConstIterator to the beginning of a list(const only).
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator cbegin() const; 

		/// <summary>
		/// Returns an Iterator to the beginning of a list(non-const).
		/// </summary>
		/// <returns>The Iterator.</returns>
		Iterator begin();

		/// <summary>
		/// Returns a ConstIterator to the beginning of the list. 
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator begin() const; 

		/// <summary>
		/// Returns a ConstIterator to the end of a list(const only).
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator cend() const;

		/// <summary>
		/// Returns an Iterator to the end of a list(non-const).
		/// </summary>
		/// <returns>The Iterator.</returns>
		Iterator end();

		/// <summary>
		/// Returns a ConstIterator to the end of the list. 
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator end() const;

		/// <summary>
		/// Default constructor for Slist.
		/// </summary>
		Slist() = default;

		/// <summary>
		/// Constructor for making a list with an initializer list.
		/// </summary>
		/// <param name="list">The initializer list.</param>
		Slist(std::initializer_list<T> list);

		/// <summary>
		/// Deconstructor for Slist.
		/// </summary>
		~Slist();

		/// <summary>
		/// Assigns an Instantiated list to another Instantiated list.
		/// </summary>
		/// <param name="otherList">The list we are assigning to this list</param>
		/// <returns>The current instance (left-hand side of the assignment).</returns>
		Slist& operator=(const Slist& otherList);

		/// <summary>
		/// Instantiates an Slist from an existing one
		/// </summary>
		/// <param name="otherList">The rhs of the assignment.</param>
		Slist(const Slist& otherList);
		
		/// <summary>
		/// Gets the data at the front of the list. 
		/// </summary>
		/// <returns>A reference to the data.</returns> 
		T& Front();

		/// <summary>
		/// Gets the data at the front of the list
		/// </summary>
		/// <returns>A constant reference to the data.</returns> 
		const T& Front() const; 

		/// <summary>
		/// Gets the data at the back of the list
		/// </summary>
		/// <returns>A reference to the data.</returns> 
		T& Back();

		/// <summary>
		/// Gets the data at the front of the list
		/// </summary>
		/// <returns>A constant reference to the data.</returns> 
		const T& Back() const;

		/// <summary>
		/// Pushes a constant item to the front of the list. 
		/// </summary>
		/// <param name="item">The item that we want to add to the list.</param> 
		void PushFront(const T& item);

		template <typename... Args>
		void EmplaceFront(Args&&... args);

		/// <summary>
		/// Pushes a constant item to the back of the list. 
		/// </summary>
		/// <param name"item">The item we want to add to the list.</param>
		void PushBack(const T& item);

		template <typename... Args>
		void EmplaceBack(Args&&... args);

		/// <summary>
		/// Removes (pops) the item at the front of the list.
		/// </summary>
		void PopFront();

		/// <summary>
		/// Removes (pops) the item at the back of the list. 
		/// </summary>
		void PopBack();

		/// <summary>
		/// Checks to see if the list is empty. 
		/// </summary>
		/// <returns>a boolean to if the list is empty or not.</returns>
		bool IsEmpty();

		const bool IsEmpty() const;

		/// <summary>
		/// Gets the size of the list 
		/// </summary>
		/// <returns>A constant reference to the size of the list.</returns>
		const std::size_t& Size() const;

		/// <summary>
		/// Clears all elements from the list.
		/// </summary>
		void Clear();

	private:
		std::size_t _size{ 0 };
		Node* _front{ nullptr };
		Node* _back{ nullptr };

	};

}
#include "Slist.inl"