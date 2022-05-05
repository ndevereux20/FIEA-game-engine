#pragma once
#include <cstddef>
#include <cstdint>


namespace FieaGameEngine
{
	template <typename T>
	class Vector final
	{
	
	public:
		using value_type = T;
		using size_type = std::size_t;
		using pointer = T*;
		using reference = value_type&;
		using const_reference = const value_type&;

		class Iterator final
		{
			friend Vector;
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
			Iterator(const Iterator & other) = default;

			/// <summary>
			/// Equal equal operator for Iterator, checks to see if two Iterators are equivalent. 
			/// </summary>
			/// <param name="other">The Iterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator==(const Iterator & other) const;

			/// <summary>
			/// Not equal operator for Iterator, checks to see if two Iterators are not equivalent.
			/// </summary>
			/// <param name="other">The Iterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator!=(const Iterator & other) const;

			/// <summary>
			/// Less than operator for Iterator.
			/// </summary>
			/// <param name="other">The other Iterator. </param>
			/// <returns></returns>
			bool operator<(const Iterator& other) const;

			/// <summary>
			/// Greater than operator for Iterator.
			/// </summary>
			/// <param name="other">The other Iterator</param>
			/// <returns></returns>
			bool operator>(const Iterator& other) const;

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
			reference operator*() const;

		
		private:
			Iterator(Vector& owner, size_type index);

			Vector* _owner{ nullptr };
			size_type _index{ 0 };
		};

		class ConstIterator final
		{
			friend Vector;
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
			ConstIterator& operator=(const ConstIterator & other) = default;

			/// <summary>
			/// Default copy constructor for ConstIterator.
			/// </summary>
			/// <param name="other">The ConstIterator you are copying to this one.</param>
			ConstIterator(const ConstIterator & other) = default;

			/// <summary>
			/// Typecast constructor for an Iterator to a ConstIterator. 
			/// </summary>
			/// <param name="other">The Iterator you are casting.</param>
			ConstIterator(const Iterator & other);

			/// <summary>
			/// Equal equal operator for ConstIterator, checks to see if two ConstIterators are equivalent. 
			/// </summary>
			/// <param name="other">The ConstIterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator==(const ConstIterator & other) const;

			/// <summary>
			/// Not equal operator for ConstIterator, checks to see if two ConstIterators are not equivalent.
			/// </summary>
			/// <param name="other">The ConstIterator you are comparing to this one.</param>
			/// <returns>Boolean of equivalence.</returns>
			bool operator!=(const ConstIterator & other) const;

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
			ConstIterator(const Vector& owner, size_type index);

			const Vector* _owner{ nullptr };
			size_type _index{ 0 };
	
		};

		/// <summary>
		/// Default constructor for Vector.
		/// </summary>
		/// 
		explicit Vector(size_type size = 11);

		/// <summary>
		/// Constructor for making a vector with an initializer list.
		/// </summary>
		/// <param name="list">The initializer list.</param>
		Vector(std::initializer_list<T> list);

		/// <summary>
		/// Deconstructor for Vector.
		/// </summary>
		~Vector();

		/// <summary>
		/// Assigns an Instantiated Vector to another Instantiated Vector.
		/// </summary>
		/// <param name="otherList">The Vector we are assigning to this Vector</param>
		/// <returns>The current instance (left-hand side of the assignment).</returns>
		Vector& operator=(const Vector& otherVector);

		/// <summary>
		/// Instantiates a Vector from an existing one
		/// </summary>
		/// <param name="otherList">The rhs of the assignment.</param>
		Vector(const Vector& otherVector);

		/// <summary>
		/// Instantiates a Vector by moving an existing one.
		/// </summary>
		/// <param name="rhs">The Vector we are moving.</param>
		Vector(Vector&& rhs) noexcept;

		/// <summary>
		/// Moves an Instantiated Vector to another Instantiated Vector.
		/// </summary>
		/// <param name="rhs">The Vector we are moving.</param>
		/// <returns>A reference to the new Vector.</returns>
		Vector& operator=(Vector&& rhs) noexcept;

		bool operator==(const Vector& other) const;

		/// <summary>
		/// Index operator for Vector.  
		/// </summary>
		/// <param name="index">The index in the vector we want the data for.</param>
		/// <returns>A reference to the data.</returns>
		reference operator[](const size_type index);

		/// <summary>
		/// Index operator for Vector.  
		/// </summary>
		/// <param name="index">The index in the vector we want the data for.</param>
		/// <returns>A constant reference to the data.</returns>
		const_reference operator[](const size_type index) const;

		/// <summary>
		/// Gets the value at a certain index. 
		/// </summary>
		/// <param name="index">The index in the vector we want the data for.</param>
		/// <returns>A reference to the data.</returns>
		reference At(const size_type index);

		/// <summary>
		/// Gets the value at a certain index. 
		/// </summary>
		/// <param name="index">The index in the vector we want the data for.</param>
		/// <returns>A constant reference to the data.</returns>
		const_reference At(const size_type index) const;

		/// <summary>
		/// Gets the size of the Vector.
		/// </summary>
		/// <returns>A constant reference to the size of the Vector.</returns>
		const size_type& Size() const;

		/// <summary>
		/// Gets the capacity of the Vector.
		/// </summary>
		/// <returns>A constant reference to the size of the Vector.</returns>
		const size_type& Capacity() const;

		/// <summary>
		/// Checks to see if the Vector is empty. 
		/// </summary>
		/// <returns>a boolean to if the Vector is empty or not.</returns>
		bool IsEmpty() const;

		/// <summary>
		/// Gets the data for the first element in the Vector. 
		/// </summary>
		/// <returns>A reference to the data.</returns> 
		reference Front();

		/// <summary>
		/// Gets the data for the first element in the Vector. 
		/// </summary>
		/// <returns>A constant reference to the data.</returns> 
		const_reference Front() const;

		/// <summary>
		/// Gets the data for the last element in the Vector. 
		/// </summary>
		/// <returns>A reference to the data.</returns> 
		reference Back();

		/// <summary>
		/// Gets the data for the last element in the Vector. 
		/// </summary>
		/// <returns>A constant reference to the data.</returns> 
		const_reference Back() const;

		/// <summary>
		/// Removes (pops) the last item in the list. 
		/// </summary>
		void PopBack();

		/// <summary>
		/// Pushes a constant item to the back of the vector. 
		/// </summary>
		/// <param name"item">The item we want to add to the list.</param>
		void PushBack(const_reference item);

		/// <summary>
		/// Increases the max capacity of the Vector. 
		/// </summary>
		/// <param name="newCapacity">The new capacity.</param>
		void Reserve(size_type newCapacity);

		/// <summary>
		/// Removes all elements from the Vector.
		/// </summary>
		void Clear();

		/// <summary>
		/// Tries to find an element in the Vector to remove.
		/// </summary>
		/// <param name="item">The item we want to remove</param>
		/// <param name="equalityFunctor">Functor for comparing too unknown data types.</param>
		/// <returns>Boolean as to whether it removed an element or not.</returns>
		bool Remove(const_reference item, std::function<bool(const_reference, const_reference)> equalityFunctor = std::equal_to<T>());
		
		/// <summary>
		/// Removes the element in the list the Iterator is at. 
		/// </summary>
		/// <param name="it">The Iterator.</param>
		/// <returns>An Iterator pointing to the next element after the remove.</returns>
		Iterator Remove(Iterator it);

		/// <summary>
		/// Removes all elements in the given range. 
		/// </summary>
		/// <param name="rangeStart">The Iterator to the start of the range.</param>
		/// <param name="rangeEnd">The Iterator to the end of the range.</param>
		/// <returns>An Iterator pointing to the next element after the remove.</returns>
		Iterator Remove(Iterator rangeStart, Iterator rangeEnd);

		/// <summary>
		/// Removes unused memory. 
		/// </summary>
		void ShrinkToFit();
		
		/// <summary>
		/// Fills a vector to max capacity, default constructing all indices that dont have an element.
		/// </summary>
		/// <param name="size">The size.</param>
		void Resize(size_type size);

		/// <summary>
		/// Returns an Iterator to the beginning of a Vector(non-const).
		/// </summary>
		/// <returns>The Iterator.</returns>
		Iterator begin();

		/// <summary>
		/// Returns a ConstIterator to the beginning of the Vector. 
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator begin() const;

		/// <summary>
		/// Returns a ConstIterator to the beginning of a Vector(const only).
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator cbegin() const;

		/// <summary>
		/// Returns an Iterator to the end of a Vector(non-const).
		/// </summary>
		/// <returns>The Iterator.</returns>
		Iterator end();

		/// <summary>
		/// Returns a ConstIterator to the end of the Vector. 
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator end() const;

		/// <summary>
		/// Returns a ConstIterator to the end of a Vector(const only).
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator cend() const;

		/// <summary>
		/// Finds the given data item in the Vector. 
		/// </summary>
		/// <param name="value">The value we are trying to find in the Vector.</param>
		/// <param name="equalityFunctor">Functor for comparing too unknown data types.</param>
		/// <returns>An Iterator.</returns>
		Iterator Find(const_reference item, std::function<bool(const_reference, const_reference)> equalityFunctor = std::equal_to<T>());
		
		/// <summary>
		/// Finds the given data item in the Vector. 
		/// </summary>
		/// <param name="value">The value we are trying to find in the Vector.</param>
		/// <param name="equalityFunctor">Functor for comparing too unknown data types.</param>
		/// <returns>A ConstIterator.</returns>
		ConstIterator Find(const_reference item, std::function<bool(const_reference, const_reference)> equalityFunctor = std::equal_to<T>()) const;

	private:
		T* _array{ nullptr }; 
		size_type _capacity{ 11 };
		size_type _size{ 0 };

	};
}
#include "Vector.inl"