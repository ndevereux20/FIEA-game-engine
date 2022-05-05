#include "pch.h"
#include "Factory.h"
#include "Scope.h"
#include <sstream>

namespace FieaGameEngine
{
	RTTI_DEFINITIONS(Scope);

#pragma region Scope
	Scope::Scope(size_type size) :
		_map(size > 0 ? size : 11), _orderVector(size > 0 ? size :11)
	{
	}

	Scope::Scope(std::initializer_list<key_type> list) : 
		Scope()
	{
		for (const auto& value : list)
		{
			Append(value);
		}
	}
	Scope::~Scope()
	{
		_parent->Orphan(*this);
		Clear();
	}
	

	Scope::Scope(const Scope& other) : 
		_map(other._map.BucketSize()), _orderVector(other._orderVector.Capacity())
	{
		for (const auto value : other._orderVector)
		{
			auto [key, existingDatum] = *value;
			Datum& newDatum = Append(key);
			if (existingDatum.Type() == DatumTypes::Table)
			{
				newDatum.SetType(DatumTypes::Table);
				newDatum.Reserve(existingDatum.Size());
				for (size_type index = 0; index < existingDatum.Size(); ++index)
				{
					Scope& nestedScope = existingDatum[index];
					Scope* childCopy = nestedScope.Clone();
					childCopy->_parent = this;
					newDatum.PushBack(*childCopy);

				}
			}
			else
			{
				newDatum = value->second;
			}
			
		}
	}

	Scope& Scope::operator=(const Scope& other) 
	{
		if (other != *this)
		{
			Clear();
			_map.Resize(other._map.BucketSize());
			_orderVector.Reserve(other._orderVector.Capacity());
			for (const auto value : other._orderVector)
			{
				auto [key, existingDatum] = *value;
				Datum& newDatum = Append(key);
				if (existingDatum.Type() == DatumTypes::Table)
				{
					newDatum.SetType(DatumTypes::Table);
					newDatum.Reserve(existingDatum.Size());
					for (size_type index = 0; index < existingDatum.Size(); ++index)
					{
						Scope& nestedScope = existingDatum[index];
						Scope* childCopy = nestedScope.Clone();
						childCopy->_parent = this;
						newDatum.PushBack(*childCopy);

					}
				}
				else
				{
					newDatum = value->second;
				}
			}
		}
		return *this;
	}

	Scope::Scope(Scope&& other) noexcept : 
		_map(std::move(other._map)), _orderVector(std::move(other._orderVector)), _parent(other._parent)
	{
		if (this != &other)
		{
			if (other._parent != nullptr)
			{
				auto [otherDatum, index] = other._parent->FindContainedScope(&other);
				otherDatum->Set(this, index);
				other._parent = nullptr;
			}
			for (const auto value : _orderVector)
			{
				if (value->second.Type() == DatumTypes::Table)
				{
					auto size = value->second.Size();
					for (size_type index = 0; index < size; ++index)
					{
						if(value->second[index]._parent == &other)
						{
							value->second[index]._parent = this;
						}
					}
				}
			}
		}
	}

	Scope& Scope::operator=(Scope&& other) noexcept
	{
		if (this != &other)
		{
			_parent->Orphan(*this);
			Clear();
			_map = std::move(other._map);
			_orderVector = std::move(other._orderVector); 
			_parent = other._parent;
			if (other._parent != nullptr)
			{
				auto [otherDatum, index] = other._parent->FindContainedScope(&other);
				otherDatum->Set(this, index);
				other._parent = nullptr;
			}
			for (const auto value : _orderVector)
			{
				if (value->second.Type() == DatumTypes::Table)
				{
					auto size = value->second.Size();
					for (size_type index = 0; index < size; ++index)
					{
						if (value->second[index]._parent == &other)
						{
							value->second[index]._parent = this;
						}
					}
				}
			}
		}

		return *this;
	}

	Datum& Scope::operator[](const key_type& string) 
	{
		return Append(string);
	}

	Datum& Scope::operator[](size_type index)
	{
		if (index >= _orderVector.Size())
		{
			throw std::out_of_range("index is out of range.");
		}
		auto data = _orderVector[index];
		return data->second;
	}

	const Datum& Scope::operator[](size_type index) const
	{
		if (index >= _orderVector.Size())
		{
			throw std::out_of_range("index is out of range.");
		}
		auto data = _orderVector[index];
		return data->second;
	}

	bool Scope::operator==(const Scope& other) const
	{
		if(this == &other)
		{
			return true;
		}
		if (_orderVector.Size() == other._orderVector.Size())
		{

			for (size_type index = 0; index < _orderVector.Size(); ++index)
			{
				auto [thisKey, thisDatum] = *_orderVector[index];
				auto iterator = other._map.Find(thisKey);
				if (iterator == other._map.cend())
				{
					return false;
				}
				auto [otherKey, otherDatum] = *iterator;
				if (thisDatum != otherDatum)
				{
					return false;
				}
			}

			return true;
		}
		return false;
	}

	bool Scope::operator!=(const Scope& other) const
	{
		return !operator==(other);
	}

	Datum* Scope::Find(const key_type& string) 
	{
		auto iterator = _map.Find(string);
		if (iterator == _map.end())
		{
			return nullptr;
		}
		return &(iterator->second);
	}

	const Datum* Scope::Find(const key_type& string) const
	{
		auto iterator = _map.Find(string);
		if (iterator == _map.cend())
		{
			return nullptr;
		}
		return &(iterator->second);
	}

	Datum* Scope::Search(const key_type& string)
	{
		Datum* datum = Find(string);
		if (datum == nullptr && _parent != nullptr)
		{
			return _parent->Search(string);
		}
		return datum;
	}

	const Datum* Scope::Search(const key_type& string) const
	{
		const Datum* datum = Find(string);
		if (datum == nullptr && _parent != nullptr)
		{
			return _parent->Search(string);
		}
		return datum;
	}

	Datum* Scope::Search(const key_type& string, Scope*& scope)
	{
		scope = this;
		Datum* datum = Find(string);
		if (datum == nullptr && _parent != nullptr)
		{
			return _parent->Search(string, scope);
		}
		return datum;
	}

	const Datum* Scope::Search(const key_type& string, const Scope*& scope) const
	{
		scope = this;
		const Datum* datum = Find(string);
		if (datum == nullptr && _parent != nullptr)
		{
			return _parent->Search(string, scope);
		}
		return datum;
	}

	Datum* Scope::GlobalSearch(const key_type& datumString)
	{
		std::stringstream datumStringStream(datumString);
		std::string token;
		bool firstToken = true;
		Datum* foundDatum = nullptr;
		Scope* foundScope = nullptr;
		while (std::getline(datumStringStream, token, '.'))
		{
			if (!token.empty())
			{
				if (firstToken)
				{
					foundDatum = Search(token, foundScope);
				}
				else
				{
					assert(foundScope != nullptr);
					if (foundDatum->Type() == DatumTypes::Table)
					{
						for (size_type i = 0; i < foundDatum->Size(); ++i)
						{
							auto nestedScope = foundDatum->Get<Scope*>(i);
							if (nestedScope->Find(token) != nullptr)
							{
								foundScope = nestedScope;
							}
						}				
					}
					foundDatum = foundScope->Find(token);
				}
				firstToken = false;
			}
		}

		return foundDatum;
	}

	Datum& Scope::Append(const key_type& string)
	{
		if (string.empty())
		{
			throw std::invalid_argument("Key can not be empty.");
		}

		HashMap<key_type, data_type>::pair_type pair = std::make_pair(string, Datum());
		auto [it, inserted] = _map.Insert(pair);
		if (inserted)
		{
			_orderVector.PushBack(&*it);
		}
		return (*it).second;
	}

	Scope& Scope::AppendScope(const key_type& string)
	{
		if (string.empty())
		{
			throw std::invalid_argument("Key can not be empty.");
		}

		Datum* findDatum; 
		findDatum = Find(string);
		if (findDatum == nullptr)
		{
			Scope* newScope = new Scope; 
			newScope->_parent = this;
			Datum newDatum = *newScope;
			HashMap<key_type, data_type>::pair_type pair = std::make_pair(string, newDatum);
			auto [it, inserted] = _map.Insert(pair);
			if (inserted)
			{
				_orderVector.PushBack(&*it);
			}

			return *newScope;
		}
		else
		{
			if (findDatum->Type() != DatumTypes::Unknown && findDatum->Type() != DatumTypes::Table)
			{
				throw std::runtime_error("Found datum type is not a table.");
			}
			else
			{
				Scope* newScope = new Scope;
				newScope->_parent = this;
				findDatum->PushBack(*newScope);
				return *newScope;
			}
		}
	}

	void Scope::Adopt(const key_type& string, Scope& child)
	{
		if (string.empty())
		{
			throw std::invalid_argument("Key can not be empty.");
		}

		if (&child == &*this)
		{
			throw std::runtime_error("Cant adopt yourself");
		}
		if(child.IsDescendantOf(*this) == false)
		{
			Datum* findName;
			findName = Find(string);
			if (findName == nullptr)
			{
				Scope* parent = child._parent;
				parent->Orphan(child);
				child._parent = this;
				Datum newDatum = child;
				HashMap<key_type, data_type>::pair_type pair = std::make_pair(string, newDatum);
				auto [it, inserted] = _map.Insert(pair);
				_orderVector.PushBack(&*it);
			}
			else
			{
				if (findName->Type() != DatumTypes::Unknown && findName->Type() != DatumTypes::Table)
				{
					throw std::runtime_error("Found datum type is not a table.");
				}
				Scope* parent = child._parent;
				parent->Orphan(child);
				child._parent = this;
				findName->PushBack(child);
			}
		}
	}

	Scope* Scope::GetParent() const
	{
		return _parent;
	}

	void Scope::Clear()
	{
		if (_parent != nullptr)
		{
			Orphan(*this);
		}
		for (auto iterator : _orderVector)
		{
			if (iterator->second.Type() == DatumTypes::Table)
			{
				auto size = iterator->second.Size();
				for (size_type index = 0; index < size; ++index)
				{
					auto value = iterator->second.Get<Scope*>(index);
					value->_parent = nullptr;
					delete value;
				}
			}
		}
		_map.Clear();
		_orderVector.Clear();
	}

	bool Scope::Orphan(Scope& child)
	{
		bool orphaned = false;
		if (child.GetParent() != nullptr && child.GetParent() == this)
		{
			auto [datumPtr, index] = FindContainedScope(&child);
			if (datumPtr != nullptr)
			{
				datumPtr->RemoveAt(index);
				child._parent = nullptr;
				orphaned = true;
			}
		}
		return orphaned;
	}

	std::pair<Datum*, typename Scope::size_type> Scope::FindContainedScope(Scope* const scope)
	{
		Datum* data;
		for (size_type i = 0; i < _orderVector.Size(); ++i)
		{
			data = &((*_orderVector[i]).second);
			
			if (data->Size() > 0  && data->Type() == DatumTypes::Table)
			{
				auto [found, index] = data->Find(scope);
				if (found == true)
				{
					return std::make_pair(data, index);
				}
			}
		}
		return std::make_pair(nullptr, 0);
	}

	

	inline bool Scope::IsAncestorOf(const Scope& scope) const
	{
		bool result = false;
		Scope* parent = scope._parent;
		while (parent != nullptr)
		{
			if (parent == this)
			{
				result = true;
				break;
			}
			parent = parent->GetParent();
		}
		return result;
	}

	inline bool Scope::IsDescendantOf(const Scope& scope) const
	{
		return scope.IsAncestorOf(*this);
	}

	size_t Scope::Size() const
	{
		return _orderVector.Size();
	}

	bool Scope::Equals(const RTTI* rhs) const 
	{
		if (rhs->Is(Scope::TypeIdClass()))
		{
			const Scope* other = reinterpret_cast<const Scope*>(rhs);
			return *this == *other;
		}
		return false;
	}

	Scope* Scope::Clone() const
	{
		return new Scope(*this);
	}

#pragma endregion
}