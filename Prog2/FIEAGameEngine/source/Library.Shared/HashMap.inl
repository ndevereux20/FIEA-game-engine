#include "HashMap.h"

namespace FieaGameEngine
{
#pragma region Iterator 

	template <typename TKey, typename TData>
	HashMap<TKey, TData>::Iterator::Iterator(HashMap& owner, size_type index, chain_iterator chainIterator) :
		_owner(&owner), _index(index), _chainIterator(chainIterator)
	{

	}

	template <typename TKey, typename TData>
	bool HashMap<TKey, TData>::Iterator::operator!=(const Iterator& other) const
	{
		if (_owner == other._owner)
		{
			return (_index != other._index && _chainIterator != other._chainIterator);
		}
		return true;
	}

	template <typename TKey, typename TData>
	bool HashMap<TKey, TData>::Iterator::operator==(const Iterator& other) const
	{
		return !operator!=(other);
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::Iterator& HashMap<TKey, TData>::Iterator::operator++()
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		++_chainIterator;
		if (_chainIterator == _owner->_buckets[_index].end())
		{
			++_index;
			while (_index < _owner->_buckets.Size())
			{
				if (_owner->_buckets[_index].IsEmpty() == false)
				{
					_chainIterator = _owner->_buckets[_index].begin();
					break;
				}
				++_index;
			}
			
		}
		
		return *this;
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::Iterator HashMap<TKey, TData>::Iterator::operator++(int)
	{
		Iterator cur = *this;
		++(*this);
		return cur;
	}


	template <typename TKey, typename TData>
	std::pair<const TKey, TData>& HashMap<TKey, TData>::Iterator::operator*() const
	{
		if (_owner == nullptr || _index >= _owner->_buckets.Size())
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		return *_chainIterator;
	}

	template <typename TKey, typename TData>
	std::pair<const TKey, TData>* HashMap<TKey, TData>::Iterator::operator->() const
	{
		if (_owner == nullptr || _index >= _owner->_buckets.Size())
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
	
		return &(*_chainIterator);
	}


#pragma endregion

#pragma region ConstIterator 

	template <typename TKey, typename TData>
	HashMap<TKey, TData>::ConstIterator::ConstIterator(const HashMap& owner, size_type index, const_chain_iterator chainIterator) :
		_owner(&owner), _index(index), _chainIterator(chainIterator)
	{

	}

	template <typename TKey, typename TData>
	HashMap<TKey, TData>::ConstIterator::ConstIterator(const Iterator& other) :
		_owner(other._owner), _index(other._index), _chainIterator(other._chainIterator)
	{

	}

	template <typename TKey, typename TData>
	bool HashMap<TKey, TData>::ConstIterator::operator!=(const ConstIterator& other) const
	{
		if (_owner == other._owner)
		{
			return (_index != other._index && _chainIterator != other._chainIterator);
		}
		return true;
	}

	template <typename TKey, typename TData>
	bool HashMap<TKey, TData>::ConstIterator::operator==(const ConstIterator& other) const
	{
		return !operator!=(other);
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::ConstIterator& HashMap<TKey, TData>::ConstIterator::operator++()
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		++_chainIterator;
		if (_chainIterator == _owner->_buckets[_index].end())
		{
			++_index;
			while (_index < _owner->_buckets.Size())
			{
				if (_owner->_buckets[_index].IsEmpty() == false)
				{
					_chainIterator = _owner->_buckets[_index].begin();
					break;
				}
				++_index;
			}
		}

		return *this;
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::ConstIterator HashMap<TKey, TData>::ConstIterator::operator++(int)
	{
		Iterator cur = *this;
		++(*this);
		return cur;
	}

	template <typename TKey, typename TData>
	const std::pair<const TKey, TData>& HashMap<TKey, TData>::ConstIterator::operator*() const
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		return *_chainIterator;
	}

	template <typename TKey, typename TData>
	const std::pair<const TKey, TData>* HashMap<TKey, TData>::ConstIterator::operator->() const
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}

		return &*_chainIterator;
	}
#pragma endregion

#pragma region HashMap 


	template<typename TKey, typename TData>
	HashMap<TKey, TData>::HashMap(size_type size, hash_functor hashFunction, equality_functor equalityFunction) :
		_size(0), _hashFunction(hashFunction),_equalityFunction(equalityFunction)
	{
		if (size == 0)
		{
			throw std::runtime_error("Cant resize to a size of 0");
		}
		_buckets.Resize(size);
	}


	template<typename TKey, typename TData>
	HashMap<TKey, TData>::HashMap(std::initializer_list<pair_type> list) :
		HashMap()
	{
		for (const auto& value : list)
		{
			Insert(value);
		}
	}
	
	template<typename TKey, typename TData>
	HashMap<TKey, TData>& HashMap<TKey, TData>::operator=(const HashMap<TKey, TData>& otherMap)
	{
		if (this != &otherMap)
		{
			Clear();
			_buckets.Resize(otherMap._buckets.Size());
			for (const auto& value : otherMap)
			{
				Insert(value);
			}
			
		}
		return *this;
	}
	
	template<typename TKey, typename TData>
	HashMap<TKey, TData>::HashMap(const HashMap& otherMap)
	{
		_buckets.Resize(otherMap._buckets.Size());
		for (const auto& value : otherMap)
		{
			Insert(value);
		}
	}


	template<typename TKey, typename TData>
	TData& HashMap<TKey, TData>::operator[](const key_type& key)
	{
		pair_type pair(key, TData());
		return Insert(pair).first->second;
	}

	template<typename TKey, typename TData>
	TData& HashMap<TKey, TData>::At(const key_type& key)
	{
		Iterator found = Find(key);
		if (found == end())
		{
			throw std::out_of_range("The key is not in the map.");
		}
		return found->second;
	}

	template<typename TKey, typename TData>
	const TData& HashMap<TKey, TData>::At(const key_type& key) const
	{
		Iterator found = Find(key);
		if (found == end())
		{
			throw std::out_of_range("The key is not in the map.");
		}
		return found->second;
	}

	template<typename TKey, typename TData>
	typename HashMap<TKey, TData>::Iterator HashMap<TKey, TData>::Find(const key_type& key)
	{
		size_type location = _hashFunction(key) % _buckets.Size();
		chain_iterator it;
		for (it = _buckets[location].begin(); it != _buckets[location].end(); ++it)
		{
			if (_equalityFunction((*it).first, key))
			{
				return Iterator{ *this, location, it };
			}
		}
		return end();
		
	}

	template<typename TKey, typename TData>
	typename HashMap<TKey, TData>::ConstIterator HashMap<TKey, TData>::Find(const key_type& key) const
	{
		size_type location = _hashFunction(key) % _buckets.Size();
		const_chain_iterator it;
		for (it = _buckets[location].begin(); it != _buckets[location].end(); ++it)
		{
			if (_equalityFunction((*it).first, key))
			{
				return ConstIterator{ *this, location, it };
			}
		}
		return end();
	}

	template<typename TKey, typename TData>
	std::pair<typename HashMap<TKey, TData>::Iterator, bool> HashMap<TKey, TData>::Insert(const pair_type& pair)
	{
		Iterator found = Find(pair.first);
		
		if (found == end())
		{
			size_t location = _hashFunction(pair.first) % _buckets.Size();
			_buckets[location].PushBack(pair);
			++_size; 

			return std::pair<Iterator, bool>({ *this, location, _buckets[location].Find(pair) }, true);
		}
	
		return std::pair<Iterator, bool>(found, false);
	}

	template<typename TKey, typename TData>
	void  HashMap<TKey, TData>::Remove(const key_type& key)
	{
		Iterator found = Find(key);
		if (found != end())
		{
			_buckets[found._index].Remove(found._chainIterator);
			--_size;
		}

	}


	template<typename TKey, typename TData>
	const std::size_t& HashMap<TKey, TData>::Size() const
	{
		return _size;
	}

	template<typename TKey, typename TData>
	std::size_t HashMap<TKey, TData>::BucketSize() const
	{
		return _buckets.Size();
	}

	template<typename TKey, typename TData>
	bool HashMap<TKey, TData>::ContainsKey(const key_type& key) const
	{
		return (Find(key) != end());
	}

	template<typename TKey, typename TData>
	float HashMap<TKey, TData>::GetLoadFactor()
	{
		return (static_cast<float>(_size) / static_cast<float>(_buckets.Size()));
	}

	template<typename TKey, typename TData>
	void HashMap<TKey, TData>::Clear()
	{
		if (begin() != end())
		{
			for (size_type i = 0; i < _buckets.Size(); ++i)
			{
				_buckets[i].Clear();
			}
		}
		_buckets.Clear();
		_size = 0;
	}

	template<typename TKey, typename TData>
	void HashMap<TKey, TData>::Resize(size_type size)
	{
		if (size == 0)
		{
			throw std::exception("Cannot resize to a size of 0.");
		}
		Vector<pair_type> items; 
		Iterator it; 
		for (it = begin(); it != end(); ++it)
		{
			items.PushBack(*it);
		}
		for (size_type i = 0; i < _buckets.Size(); ++i)
		{
			_buckets[i].Clear();
		}
		_size = 0;
		_buckets.Resize(size);
		for (size_type i = 0; i < items.Size(); ++i)
		{
			Insert(items[i]);
		}
		
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::Iterator HashMap<TKey, TData>::begin()
	{
		for (size_type i = 0; i < _buckets.Size(); ++i)
		{
			if (_buckets[i].begin() != _buckets[i].end())
			{
				return Iterator{ *this, i, _buckets[i].begin() };
			}
		}

		return end();
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::ConstIterator HashMap<TKey, TData>::begin() const
	{
		for (size_type i = 0; i < _buckets.Size(); ++i)
		{
			if (_buckets[i].begin() != _buckets[i].end())
			{
				return ConstIterator{ *this, i, _buckets[i].begin() };
			}
		}

		return end();
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::ConstIterator HashMap<TKey, TData>::cbegin() const
	{
		for (size_type i = 0; i < _buckets.Size(); ++i)
		{
			if (_buckets[i].begin() != _buckets[i].end())
			{
				return ConstIterator{ *this, i, _buckets[i].begin() };
			}
		}

		return end();
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::Iterator HashMap<TKey, TData>::end()
	{
		return Iterator{ *this, _buckets.Size(), chain_iterator() };
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::ConstIterator HashMap<TKey, TData>::end() const
	{
		return ConstIterator{ *this, _buckets.Size(), chain_iterator() };
	}

	template <typename TKey, typename TData>
	typename HashMap<TKey, TData>::ConstIterator HashMap<TKey, TData>::cend() const
	{
		return ConstIterator{ *this, _buckets.Size(), chain_iterator() };
	}


#pragma endregion 
}
