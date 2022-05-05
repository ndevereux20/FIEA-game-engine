#include "Slist.h"

namespace FieaGameEngine
{

#pragma region Iterator
	template <typename T> 
	Vector<T>::Iterator::Iterator(Vector& owner, size_type index) :
		_owner(&owner), _index(index)
	{
	}

	template <typename T>
	bool Vector<T>::Iterator::operator!=(const Iterator& other) const
	{
		if (_owner == other._owner)
		{
			return _index != other._index;
		}	
		return true;
	}

	template <typename T>
	bool Vector<T>::Iterator::operator==(const Iterator& other) const
	{
		return !operator!=(other);
	}

	template <typename T>
	bool Vector<T>::Iterator::operator<(const Iterator& other) const
	{
		if (_owner == other._owner)
		{
			return _index < other._index;
		}
		return false;
	}
	template <typename T>
	bool Vector<T>::Iterator::operator>(const Iterator& other) const
	{
		if (_owner == other._owner)
		{
			return _index > other._index;
		}
		return false;
	}

	template <typename T>
	typename Vector<T>::Iterator& Vector<T>::Iterator::operator++()
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		if (_index < _owner->Size())
		{
			++_index; 
		}
		return *this;
	}

	template <typename T>
	inline typename Vector<T>::Iterator Vector<T>::Iterator::operator++(int)
	{
		Iterator cur = *this;
		++(*this);
		return cur;
	}

	template <typename T>
	T& Vector<T>::Iterator::operator*() const
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		
		return _owner->operator[](_index);
	}

	template <typename T>
	typename Vector<T>::Iterator Vector<T>::begin()
	{
		return Iterator{ *this, 0 };
	}

	template <typename T>
	typename Vector<T>::Iterator Vector<T>::end()
	{
		return Iterator{ *this, _size };
	}

#pragma endregion Iterator

#pragma region ConstIterator
	template <typename T>
	Vector<T>::ConstIterator::ConstIterator(const Vector& owner, size_type index) :
		_owner(&owner), _index(index)
	{
	}

	template <typename T>
	Vector<T>::ConstIterator::ConstIterator(const Iterator& other) :
		_owner(other._owner), _index(other._index)
	{
	}

	template <typename T>
	bool Vector<T>::ConstIterator::operator!=(const ConstIterator& other) const
	{
		if (_owner == other._owner)
		{
			return _index != other._index;
		}
		return true;
	}

	template <typename T>
	bool Vector<T>::ConstIterator::operator==(const ConstIterator& other) const
	{
		return !operator!=(other);
	}

	template <typename T>
	typename Vector<T>::ConstIterator& Vector<T>::ConstIterator::operator++()
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		if (_index < _owner->Size())
		{
			++_index;
		}
		return *this;
	}

	template <typename T>
	inline typename Vector<T>::ConstIterator Vector<T>::ConstIterator::operator++(int)
	{
		Iterator cur = *this;
		++(*this);
		return cur;
	}

	template <typename T>
	const T& Vector<T>::ConstIterator::operator*() const
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}

		return _owner->operator[](_index);
	}

	template <typename T>
	typename Vector<T>::ConstIterator Vector<T>::begin() const
	{
		return ConstIterator( *this, 0 );
	}

	template <typename T>
	typename Vector<T>::ConstIterator Vector<T>::end() const
	{
		return ConstIterator( *this, _size );
	}

	template <typename T>
	typename Vector<T>::ConstIterator Vector<T>::cbegin() const
	{
		return ConstIterator( *this, 0 );
	}

	template <typename T>
	typename Vector<T>::ConstIterator Vector<T>::cend() const
	{
		return ConstIterator( *this, _size);
	}
#pragma endregion ConstIterator

#pragma region Vector

	template <typename T>
	Vector<T>::Vector(size_type size) : 
		_capacity(size), _array (size > 0 ? reinterpret_cast<T*>(malloc(size * sizeof(T))) : nullptr)
	{
	}

	template <typename T>
	Vector<T>::Vector(std::initializer_list<T> list)
	{
		_array = reinterpret_cast<T*>(malloc(_capacity * sizeof(T)));
		for (const auto& value : list)
		{
			PushBack(value);
		}
	}

	template <typename T>
	Vector<T>::~Vector()
	{
		Clear();
		free(_array);
	}

	template <typename T>
	Vector<T>& Vector<T>::operator=(const Vector<T>& otherVector)
	{
		if (this != &otherVector)
		{
			Clear();
			Reserve(otherVector._capacity);
			for (const auto& value : otherVector)
			{
				PushBack(value);
			}
		}
		return *this;
	}

	template <typename T>
	Vector<T>::Vector(const Vector& otherVector) 
	{
		T* data = reinterpret_cast<T*>(realloc(_array, otherVector._capacity * sizeof(T)));
		assert(data != nullptr);
		_array = data;
		for (const auto& value : otherVector)
		{
			PushBack(value);
		}
	}

	template <typename T>
	Vector<T>::Vector(Vector&& rhs) noexcept:
		_size(rhs._size), _capacity(rhs._capacity), _array(rhs._array)
	{
		rhs._size = 0;
		rhs._capacity = 0;
		rhs._array = nullptr;
	}

	template <typename T>
	Vector<T>& Vector<T>::operator=(Vector&& rhs) noexcept
	{
		if (this != &rhs)
		{
			Clear();
			free(_array);
			_size = rhs._size;
			_capacity = rhs._capacity;
			_array = rhs._array;

			rhs._size = 0;
			rhs._capacity = 0;
			rhs._array = nullptr;
		}
		return *this;
	}

	template <typename T>
	bool Vector<T>::operator==(const Vector& other) const
	{
		other;
		return true;
	}

	template <typename T>
	T& Vector<T>::Front()
	{
		if (_size == 0)
		{
			throw std::runtime_error("List is empty.");
		}
		return _array[0];
	}

	template <typename T>
	const T& Vector<T>::Front() const
	{
		if (_size == 0)
		{
			throw std::runtime_error("List is empty.");
		}
		return _array[0];
	}

	template <typename T>
	T& Vector<T>::Back()
	{
		if (_size == 0)
		{
			throw std::runtime_error("List is empty.");
		}
		return _array[_size - 1];
	}

	template <typename T>
	const T& Vector<T>::Back() const
	{
		if (_size == 0)
		{
			throw std::runtime_error("List is empty.");
		}
		return _array[_size - 1];
	}

	template <typename T>
	T& Vector<T>::operator[](const size_type index)
	{
		if (index >= _size)
		{
			throw std::runtime_error("The index is out of range");
		}
		return _array[index];
	}

	template <typename T>
	const T& Vector<T>::operator[](const size_type index) const
	{
		if (index >= _size)
		{
			throw std::runtime_error("The index is out of range");
		}
		return _array[index];
	}

	template <typename T>
	T& Vector<T>::At(const size_type index) 
	{
		if (index >= _size)
		{
			throw std::runtime_error("The index is out of range");
		}
		return _array[index];
	}

	template <typename T>
	const T& Vector<T>::At(const size_type index) const
	{
		if (index >= _size)
		{
			throw std::runtime_error("The index is out of range");
		}
		return _array[index];
	}

	template <typename T>
	const size_t& Vector<T>::Size() const
	{
		return _size;
	}

	template <typename T>
	const size_t& Vector<T>::Capacity() const
	{
		return _capacity;
	}

	template <typename T>
	bool Vector<T>::IsEmpty() const
	{
		return (_size == 0);
	}

	template <typename T>
	void Vector<T>::PushBack(const_reference item)
	{
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_array + _size)T(item);
		++_size; 

		return;
	}

	template <typename T>
	void Vector<T>::PopBack()
	{
		if (_size != 0)
		{
			(_array + --_size )->~T();
		}
		return;
	}

	template <typename T> 
	void Vector<T>::Reserve(size_type newCapacity)
	{
		if (newCapacity > _capacity)
		{
			T* data = reinterpret_cast<T*>(realloc(_array, newCapacity * sizeof(T)));
			assert(data != nullptr);
			_array = data;
			_capacity = newCapacity;
		}
	}

	template <typename T>
	void Vector<T>::Clear()
	{
		while (_size != 0)
		{
			PopBack();
		}
	}

	template <typename T>
	typename Vector<T>::Iterator Vector<T>::Find(const_reference item, std::function<bool(const_reference, const_reference)> equalityFunctor)
	{
		Iterator it; 
		for (it = begin(); it != end(); ++it)
		{
			if (equalityFunctor(*it, item))
			{
				break;
			}
		}
		return it;
	}

	template <typename T>
	typename Vector<T>::ConstIterator Vector<T>::Find(const_reference item, std::function<bool(const_reference, const_reference)> equalityFunctor) const
	{
		ConstIterator it;
		for (it = begin(); it != end(); ++it)
		{
			if (equalityFunctor(*it, item))
			{
				break;
			}
		}
		return it;
	}

	template <typename T> 
	bool Vector<T>::Remove(const_reference item, std::function<bool(const_reference, const_reference)> equalityFunctor)
	{
		bool found = false;
		Iterator f = Find(item, equalityFunctor);
		if (f != end())
		{
			found = true;
			Remove(f);
		}

		return found;
	}

	template <typename T>
	typename Vector<T>::Iterator Vector<T>::Remove(Iterator it)
	{
		if (this != it._owner)
		{
			throw std::runtime_error("Iterator is not associated with this container.");
		}
		auto newIndex = it._index;
		if (it != end() && it._index != _size - 1)
		{
			(_array + it._index)->~T();
			memmove(_array + it._index, _array + it._index + 1, sizeof(T) * (_size - it._index));
			--_size;
			
		}
		else if (it._index == _size - 1)
		{
			PopBack();
		}

		return Iterator{ *this, newIndex };
	}

	template <typename T>
	typename Vector<T>::Iterator Vector<T>::Remove(Iterator rangeStart, Iterator rangeEnd)
	{
		if (this != rangeStart._owner || this != rangeEnd._owner)
		{
			throw std::runtime_error("Iterator is not associated with this container.");
		}
		if (rangeEnd < rangeStart)
		{
			throw std::runtime_error("the End iterator is less than the Start iterator .");
		}

		auto newIndex = rangeStart._index;
		auto itemsToRemove = rangeEnd._index - rangeStart._index;
		
		if (rangeStart != end() && rangeStart._index != _size - 1)
		{
			for (size_t i = 0; i < itemsToRemove; ++i)
			{
				(_array + i)->~T();
			}
			memmove(_array + rangeStart._index, _array + rangeEnd._index, sizeof(T) * (_size - rangeEnd._index));
			_size -= itemsToRemove;
		}
		
		return Iterator{ *this , newIndex };
	}

	template <typename T>
	void Vector<T>::ShrinkToFit()
	{
		if (_size < _capacity)
		{
			T* data = reinterpret_cast<T*>(realloc(_array, _size * sizeof(T)));
			assert(data != nullptr);
			_array = data;
			_capacity = _size;
		}
	}

	template <typename T>
	void Vector<T>::Resize(size_type size)
	{
		//if (size == 0)
		//{
		//	throw std::runtime_error("Cant resize to a size of 0");
		//}
		if ((_size < _capacity) || (size > _capacity && size > _size))
		{
			T* data = reinterpret_cast<T*>(realloc(_array, size * sizeof(T)));
			assert(data != nullptr);
			_array = data;
			for (auto i = _size; i < size; ++i)
			{
				new(_array + i)T();
			}
		}
		if (size < _size && size > 0 )
		{
			for (auto i = _size; i > size; --i)
			{
				PopBack();
			}
		}
		_capacity = size;
		_size = size;
		return;
	}

#pragma endregion Vector
}