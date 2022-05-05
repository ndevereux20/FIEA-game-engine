#include "Slist.h"

namespace FieaGameEngine
{
#pragma region Iterator
	template <typename T>
	Slist<T>::Iterator::Iterator(const Slist& owner, Node* node) :
		_owner(&owner), _node(node)
	{
	}

	template <typename T>
	bool Slist<T>::Iterator::operator!=(const Iterator& other) const 
	{
		if (_owner == other._owner)
		{
			return _node != other._node;
		}
		return true;
	}

	template <typename T>
	bool Slist<T>::Iterator::operator==(const Iterator& other) const
	{
		return !operator!=(other);
	}

	template <typename T>
	typename Slist<T>::Iterator& Slist<T>::Iterator::operator++()
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		if (_node != nullptr)
		{
			_node = _node->Next;
		}
		return *this;
	}

	template <typename T>
	inline typename Slist<T>::Iterator Slist<T>::Iterator::operator++(int)
	{
		Iterator cur = *this;
		++(*this);
		return cur;
	}

	template <typename T> 
	T& Slist<T>::Iterator::operator*() const
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		if (_node == nullptr)
		{
			throw std::runtime_error("Can't dereference from an empty list.");
		}
		return _node->Data;
	}

	template <typename T>
	void Slist<T>::InsertAfter(const T& item, const Iterator& it)
	{
		
		if (this != it._owner)
		{
			throw std::runtime_error("Iterator is not associated with this container.");
		}
		if (it == end() || it._node == _back)
		{
			PushBack(item);
		}
		else
		{
			Node* addedNode = new Node(it._node->Next, item);
			it._node->Next = addedNode;
			++_size;
		}

		return;
	}

	template <typename T>
	void Slist<T>::Remove(const T& item, const Iterator& it, std::function<bool(const T&, const T&)> equalityFunctor)
	{
		if (this != it._owner)
		{
			throw std::runtime_error("Iterator is not associated with this container.");
		}
		Iterator found = Find(item, equalityFunctor);
		if (found != end() && found != begin() && found._node != _back)
		{
			Node* prev = _front;
			Iterator findPrev;
			for (findPrev = begin(); findPrev != found; ++findPrev)
			{
				prev = findPrev._node;
			}
			prev->Next = found._node->Next;
			delete found._node;
			--_size;
		}
		if (found == begin())
		{
			PopFront();
		}
		if (found._node == _back)
		{
			PopBack();
		}
		return; 
	}

	template <typename T>
	void Slist<T>::Remove(Iterator it)
	{
		if (this != it._owner)
		{
			throw std::runtime_error("Iterator is not associated with this container.");
		}
		if (it != end() && it != begin() && it._node != _back)
		{
			Node* prev = _front;
			Iterator findPrev; 
			for (findPrev = begin(); findPrev != it; ++findPrev)
			{
				prev = findPrev._node;
			}
			prev->Next = it._node->Next; 
			delete it._node; 
			--_size;
		}
		if (it == begin())
		{
			PopFront();
		}
		if (it._node == _back)
		{
			PopBack();
		}
	}
	
	template <typename T>
	typename Slist<T>::Iterator Slist<T>::Find(const T& value, std::function<bool(const T&, const T&)> equalityFunctor)
	{
		Iterator it; 
		for (it = begin(); it != end(); ++it)
		{
			if (equalityFunctor(*it, value))
			{
				break;
			}
		}
		return it;
	}

	template <typename T>
	typename Slist<T>::Iterator Slist<T>::begin()
	{
		return Iterator{ *this, _front };
	}
	
	template <typename T>
	typename Slist<T>::Iterator Slist<T>::end()
	{
		return Iterator{ *this };
	}

#pragma endregion

#pragma region ConstIterator
	template <typename T>
	Slist<T>::ConstIterator::ConstIterator(const Slist& owner, Node* node) :
		_owner(&owner), _node(node)
	{
	}
	template <typename T>
	Slist<T>::ConstIterator::ConstIterator(const Iterator& other) :
		_owner(other._owner), _node(other._node)
	{
	}

	template <typename T>
	bool Slist<T>::ConstIterator::operator!=(const ConstIterator& other) const
	{
		if (_owner == other._owner)
		{
			return _node != other._node;
		}
		return true;
	}

	template <typename T>
	bool Slist<T>::ConstIterator::operator==(const ConstIterator& other) const
	{
		return !operator!=(other);
	}

	template <typename T>
	typename Slist<T>::ConstIterator& Slist<T>::ConstIterator::operator++()
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		if (_node != nullptr)
		{
			_node = _node->Next;
		}
		return *this;
	}

	template <typename T>
	inline typename Slist<T>::ConstIterator Slist<T>::ConstIterator::operator++(int)
	{
		Iterator cur = *this;
		++(*this);
		return cur;
	}

	template <typename T>
	const T& Slist<T>::ConstIterator::operator*() const
	{
		if (_owner == nullptr)
		{
			throw std::runtime_error("Iterator is not associated with a container.");
		}
		if (_node == nullptr)
		{
			throw std::runtime_error("Cannot dereference from an empty node.");
		}
		return _node->Data;
	}
	
	template <typename T>
	typename Slist<T>::ConstIterator Slist<T>::Find(const T& value, std::function<bool(const T&, const T&)> equalityFunctor) const
	{
		ConstIterator it;
		for (it = begin(); it != end(); ++it)
		{
			if (equalityFunctor(*it, value))
			{
				break;
			}
		}
		return it;
	}

	template <typename T>
	typename Slist<T>::ConstIterator Slist<T>::begin() const
	{
		return ConstIterator{ *this, _front };
	}

	template <typename T>
	typename Slist<T>::ConstIterator Slist<T>::end() const
	{
		return ConstIterator{ *this };
	}

	template <typename T>
	typename Slist<T>::ConstIterator Slist<T>::cbegin() const
	{
		return ConstIterator{ *this, _front };
	}

	template <typename T>
	typename Slist<T>::ConstIterator Slist<T>::cend() const
	{
		return ConstIterator{ *this };
	}
#pragma endregion

#pragma region Slist
	template <typename T>
	Slist<T>::Slist(std::initializer_list<T> list)
	{
		for (const auto& value : list)
		{
			PushBack(value);
		}
	}

	template<typename T>
	Slist<T>::~Slist()
	{
		Clear();
	}

	template<typename T>
	Slist<T>& Slist<T>::operator=(const Slist<T>& otherList)
	{
		if (this != &otherList)
		{
			Clear();
			Node* newListNode = otherList._front;
			while (newListNode != nullptr)
			{
				PushBack(newListNode->Data);
				newListNode = newListNode->Next;
			}
		}
		return *this;
	}

	template<typename T>
	Slist<T>::Slist(const Slist& otherList) :
		_size(otherList._size)
	{
		Node* newListNode = otherList._front;
		while (newListNode != nullptr)
		{
			this->PushBack(newListNode->Data);
			newListNode = newListNode->Next; 
		}
	}

	template <typename T>
	T& Slist<T>::Front()
	{
		if (_size == 0)
		{
			throw std::runtime_error("Cannot access an empty list.");
		}

		return _front->Data;
	}
	
	template <typename T>
	const T& Slist<T>::Front() const
	{
		if (_size == 0)
		{
			throw std::runtime_error("Cannot access an empty list.");
		}

		return _front->Data;
	}

	template<typename T>
	T& Slist<T>::Back()
	{
		if (_size == 0)
		{
			throw std::runtime_error("Cannot access an empty list.");
		}

		return _back->Data;
	}

	template<typename T>
	const T& Slist<T>::Back() const
	{
		if (_size == 0)
		{ 
			throw std::runtime_error("Cannot access an empty list.");
		}
		return _back->Data;
	}

	template<typename T>
	void Slist<T>::PushFront(const T& item)
	{
		Node* newFront = new Node(_front, item);
		if (_size == 0)
		{
			_back = newFront;
		}
		_front = newFront;
		++_size;
	}

	template<typename T>
	template <typename... Args>
	void Slist<T>::EmplaceFront(Args&&... args)
	{
		Node* newFront = new Node(_front, std::forward<Args>(args)...);
		if (_size == 0)
		{
			_back = newFront;
		}
		_front = newFront;
		++_size; 
	}

	template<typename T>
	void Slist<T>::PushBack(const T& item)
	{
		Node* newBack = new Node(nullptr, item);
		if (_size == 0)
		{
			_front = newBack;
		}
		else
		{
			_back->Next = newBack;
		}
		_back = newBack;
		_size++;

	}

	template<typename T>
	template <typename... Args>
	void Slist<T>::EmplaceBack(Args&&... args)
	{
		Node* newBack = new Node(nullptr, std::forward<Args>(args)...);
		if (_size == 0)
		{
			_front = newBack;
		}
		else
		{
			_back->Next = newBack;
		}
		_back = newBack;
		_size++;
	}

	template<typename T>
	void Slist<T>::PopFront()
	{
		if (_size > 0)
		{
			Node* temp = _front;

			_front = _front->Next;
			delete temp;
			--_size;
			if (_size == 0)
			{
				_back = nullptr;
			}
			
		}
		return;
	}

	template<typename T>
	void Slist<T>::PopBack()
	{
		Node* temp = _back;
		if (_size == 1)
		{
			_front = nullptr;
			_back = nullptr;
		}
		else if (_size > 1)
		{
			Node* nextToLast = _front;
			while (nextToLast->Next->Next != nullptr)
			{
				nextToLast = nextToLast->Next;
			}
			nextToLast->Next = nullptr;
			_back = nextToLast;
		}

		delete temp;
		--_size;

		return;
	}

	template<typename T>
	bool Slist<T>::IsEmpty()
	{
		return (_size == 0);
	}

	template<typename T>
	const bool Slist<T>::IsEmpty() const
	{
		return (_size == 0);
	}

	template<typename T>
	const std::size_t& Slist<T>::Size() const
	{
		return _size;
	}

	template<typename T>
    void Slist<T>::Clear()
	{
		if (_size > 0)
		{
			Node* temp = _front;
			while (_front != nullptr)
			{
				temp = temp->Next;
				delete _front;
				_front = temp;

			}
			_back = nullptr;
			_size = 0;
		}
		return; 
	}
#pragma endregion 
}