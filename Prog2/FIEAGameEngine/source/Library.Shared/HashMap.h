#pragma once
#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <functional>
#include <cassert>
#include "Slist.h"
#include "Vector.h"


namespace FieaGameEngine
{
	template <typename TKey, typename TData> 

	/// <summary>
	/// A HashMap made up of a Vector of SLists. 
	/// </summary>
	class HashMap final
	{
	public:
		using key_type = TKey; 
		using mapped_type = TData;
		using pair_type = std::pair<const key_type, mapped_type>;
		using chain_type = Slist<pair_type>;
		using bucket_type = Vector<chain_type>; 
		using size_type = std::size_t;
		using hash_functor = std::function<size_type(const TKey&)>;
		using equality_functor = std::function<bool(const TKey&, const TKey&)>;
		using chain_iterator =  typename chain_type::Iterator;
		using const_chain_iterator = typename chain_type::ConstIterator;

		/// <summary>
		/// Iterator for HashMap.
		/// </summary>
		class Iterator final
		{
			friend HashMap;
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
			/// <returns>A reference to the pair.</returns>
			pair_type& operator*() const;

			/// <summary>
			/// The dereference operator for an Iterator.
			/// </summary>
			/// <returns>A pointer to the pair.</returns>
			pair_type* operator->() const;
		private:
			Iterator(HashMap& owner, size_type _index, chain_iterator chainIterator);

			HashMap* _owner{ nullptr };
			size_type _index{ 0 }; 
			chain_iterator _chainIterator;
		};

		/// <summary>
		/// ConstIterator for HashMap.
		/// </summary>
		class ConstIterator final
		{
			friend HashMap;
		public: 

			/// <summary>
			/// default constructor for ConstIterator.
			/// </summary>
			ConstIterator() = default;

			/// <summary>
			/// Typecast constructor for an Iterator to a ConstIterator. 
			/// </summary>
			/// <param name="other">The Iterator you are casting.</param>
			ConstIterator(const Iterator& other);

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
			/// <returns>A reference to the pair.</returns>
			const pair_type& operator*() const;

			/// <summary>
			/// The dereference operator for an Iterator.
			/// </summary>
			/// <returns>A pointer to the pair.</returns>
			const pair_type* operator->() const;
		private:
			ConstIterator(const HashMap& owner, size_type index, const_chain_iterator chainIterator);

			const HashMap* _owner{ nullptr };
			size_type _index{ 0 };
			const_chain_iterator _chainIterator;
		};

		/// <summary>
		/// Constructor for HashMap, can take in up to 3 parameters, a size, a hash function, and an equality function.
		/// </summary>
		explicit HashMap(size_type size = 11, hash_functor hashFunction = DefaultHash<TKey>(), equality_functor equalityFunction = std::equal_to<TKey>());

		/// <summary>
		/// Constructor for making a HashMap with an initializer list.
		/// </summary>
		/// <param name="list">The initializer list.</param>
		HashMap(std::initializer_list<pair_type> list);

		/// <summary>
		/// Deconstructor for a HashMap
		/// </summary>
		~HashMap() = default;

		/// <summary>
		/// Assigns an Instantiated HashMap to another Instantiated HashMap.
		/// </summary>
		/// <param name="otherList">The Vector we are assigning to this Vector</param>
		/// <returns>The current instance (left-hand side of the assignment).</returns>
		HashMap& operator=(const HashMap& otherMap);

		/// <summary>
		/// Instantiates a HashMap from an existing one
		/// </summary>
		/// <param name="otherList">The rhs of the assignment.</param>
		HashMap(const HashMap& otherMap);

		/// <summary>
		/// Instantiates a HashMap by moving an existing one.
		/// </summary>
		/// <param name="rhs">The HashMap we are moving.</param>
		HashMap(HashMap&& rhs) noexcept = default;

		/// <summary>
		/// Moves an Instantiated HashMap to another Instantiated HashMap.
		/// </summary>
		/// <param name="rhs">The HashMap we are moving.</param>
		/// <returns>A reference to the new HashMap.</returns>
		HashMap& operator=(HashMap&& rhs) noexcept = default;

		/// <summary>
		/// Looks for the given key in the HashMap, returns an Iterator to the element if its in the map.
		/// </summary>
		///  <param name="key">The key we are trying to find.</param>
		/// <returns>An Iterator.</returns>
		Iterator Find(const key_type& key);

		/// <summary>
		/// Looks for the given key in the HashMap, returns a ConstIterator to the element if its in the map.
		/// </summary>
		/// <param name="key">The key we are trying to find.</param>
		/// <returns>A ConstIterator.</returns>
		ConstIterator Find(const key_type& key) const;

		/// <summary>
		/// Inserts the given pair into the HashMap. 
		/// </summary>
		/// <param name="pair">The pair we are trying to insert.</param>
		/// <returns>A pair of Iterator, and bool as to whether the pair was inserted or not.</returns>
		std::pair<Iterator, bool> Insert(const pair_type& pair);

		/// <summary>
		/// Gets the data associated with a key. If the key isnt in the list then insert a new pair with that key. 
		/// </summary>
		/// <param name="key">The key we are trying to find.</param>
		/// <returns>A reference to the data.</returns>
		mapped_type& operator[](const key_type& key);

		/// <summary>
		/// Gets the data associated with a key, with bounds checking.
		/// </summary>
		/// <param name="key">The key we are trying to find.</param>
		/// <returns>A reference to the data.</returns>
		mapped_type& At(const key_type& key);

		/// <summary>
		/// Gets the data associated with a key, with bounds checking.
		/// </summary>
		/// <param name="key">The key we are trying to find.</param>
		/// <returns>A constant reference to the data.</returns>
		const mapped_type& At(const key_type& key) const;

		/// <summary>
		/// Removes a pair from the HashMap with the given key. 
		/// </summary>
		/// <param name="key">The key we are trying to remove.</param>
		void Remove(const key_type& key);

		/// <summary>
		/// Clears the HashMap of all elements
		/// </summary>
		void Clear();

		/// <summary>
		/// Gets the size of the HashMap
		/// </summary>
		/// <returns>A constant reference to the size.</returns>
		const size_type& Size() const; 

		size_type BucketSize() const;

		/// <summary>
		/// Checks to see if the key exists in the HashMap.
		/// </summary>
		/// <param name="key">The key we are trying to find.</param>
		/// <returns>A boolean as to whether the key is in the HashMap or not.</returns>
		bool ContainsKey(const key_type& key) const;

		/// <summary>
		/// Gets the load factor of the hash map (the number of elements in the list, to the size of the map).
		/// </summary>
		/// <returns>The load factor, a value of 1 means the size of the map is equal to the number of pairs in the map.</returns>
		float GetLoadFactor();

		/// <summary>
		/// Resizes the hash map, causing a rehash of all items in the map.
		/// </summary>
		/// <param name="size">The size to resize the HashMap to.</param>
		void Resize(size_type size);

		/// <summary>
		/// Returns an Iterator to the beginning of a HashMap(non-const).
		/// </summary>
		/// <returns>The Iterator.</returns>
		Iterator begin();

		/// <summary>
		/// Returns a ConstIterator to the beginning of the HashMap. 
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator begin() const;

		/// <summary>
		/// Returns a ConstIterator to the beginning of a HashMap(const only).
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator cbegin() const;

		/// <summary>
		/// Returns an Iterator to the end of a HashMap(non-const).
		/// </summary>
		/// <returns>The Iterator.</returns>
		Iterator end();

		/// <summary>
		/// Returns a ConstIterator to the end of the HashMap. 
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator end() const;

		/// <summary>
		/// Returns a ConstIterator to the end of a HashMap(const only).
		/// </summary>
		/// <returns>The ConstIterator.</returns>
		ConstIterator cend() const;

	private:
		size_type _size{ 0 };
		hash_functor _hashFunction{ DefaultHash<TKey>()};
		equality_functor _equalityFunction{ std::equal_to<TKey>() };
		bucket_type _buckets;
		
	};


}
#include "HashMap.inl"


inline std::size_t AdditiveHash(const std::uint8_t* data, std::size_t size)
{
	std::size_t hash = 31;

	for (std::size_t i = 0; i < size; ++i)
	{
		hash += data[i];
	}

	return hash;
}


template <typename T>
struct DefaultHash
{
	std::size_t operator()(const T& value)
	{
		return AdditiveHash(reinterpret_cast<const std::uint8_t*>(&value), sizeof(T));
	}
};

template <>
struct DefaultHash<std::string>
{

	std::size_t operator()(const std::string& value)
	{
		value;
		return AdditiveHash(reinterpret_cast<const std::uint8_t*>(value.c_str()), value.size());
	}
};

template <>
struct DefaultHash<const std::string>
{

	std::size_t operator()(const std::string& value)
	{
		value;
		return AdditiveHash(reinterpret_cast<const std::uint8_t*>(value.c_str()), value.size());
	}
};

template <> 
struct DefaultHash<char*>
{
	std::size_t operator()(const char* value)
	{
		std::size_t hash = 31; 
		size_t size = 0;
		for (auto i = value; *i != '\0'; ++i)
		{
			hash += value[size];
			++size;
		}
		return hash; 
	}
};



