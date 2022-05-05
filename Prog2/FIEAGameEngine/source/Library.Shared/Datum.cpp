#include "pch.h"
#include "Datum.h"
//#include <cassert>
//#include <stdexcept>
#pragma warning(push)
#pragma warning(disable:4201)
#pragma warning(disable:4635)
#define GLM_ENABLE_EXPERIMENTAL
#include <glm/fwd.hpp>
#include <glm/glm.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtx/string_cast.hpp>
#pragma warning(pop)

using namespace std;

namespace FieaGameEngine
{
	const typename Datum::size_type Datum::DatumTypeSizes[] = 
	{
		0, //Unknown
		sizeof(int32_t),
		sizeof(float),
		sizeof(glm::vec4),
		sizeof(glm::mat4),
		sizeof(string),
		sizeof(RTTI*),
		sizeof(Scope*)
	};

#pragma region Constructors 

	Datum::Datum()
	{

	}
	Datum::Datum(DatumTypes type, size_type capacity) 
	{
		if (type == DatumTypes::Unknown)
		{
			throw std::exception("Need to set a type");
		}
		_type = type;
		Reserve(capacity);
	}

	Datum::~Datum()
	{
		if (_isExternal == false)
		{
			Clear();
			free(_data.vp);
		}
	}

#pragma endregion

#pragma region Copy Constructor
	Datum::Datum(const Datum& otherDatum) :
		 _type(otherDatum._type), _isExternal(otherDatum._isExternal)
	{
		if (otherDatum._capacity > 0)
		{
			if (otherDatum._isExternal)
			{
				_data.vp = otherDatum._data.vp;
			}
			else
			{
				if (_type == DatumTypes::String)
				{
					for (size_type i = 0; i < otherDatum._size; ++i)
					{
						PushBack(otherDatum._data.s[i]);
					}
				}
				else
				{
					size_type size = DatumTypeSizes[static_cast<size_type>(_type)];
					Reserve(otherDatum._capacity);
					memcpy(_data.vp, otherDatum._data.vp, otherDatum._size * size);
				}
			}
		}
		_size = otherDatum._size;
		_capacity = otherDatum._capacity;
	}
	Datum::Datum(const int32_t& value)
	{
		PushBack(value);
	}

	Datum::Datum(const float& value)
	{
		PushBack(value);
	}

	Datum::Datum(const glm::vec4& value)
	{
		PushBack(value);
	}

	Datum::Datum(const glm::mat4& value)
	{
		PushBack(value);
	}

	Datum::Datum(const string& value)
	{
		PushBack(value);
	}

	Datum::Datum(RTTI* value)
	{
		PushBack(value);
	}

	Datum::Datum(Scope& value)
	{
		PushBack(value);
	}

#pragma endregion 

#pragma region Assignment Operators

	Datum& Datum::operator=(const Datum& otherDatum) 
	{
		if (otherDatum._isExternal == true)
		{
			if (_isExternal == false)
			{
				free(_data.vp);
			}
			_isExternal = true;
			_size = otherDatum._size;
			_capacity = otherDatum._capacity;
			_data = otherDatum._data;
		}
		else
		{
			if (_isExternal == true)
			{
				_data.vp = nullptr;
				_size = 0;
			}
			else
			{
				Clear();
			}
			_isExternal = false;
			size_type size = DatumTypeSizes[static_cast<size_type>(otherDatum._type)];
			void* data = realloc(_data.vp, otherDatum._capacity * size);
			assert(data != nullptr);
			_data.vp = data;
			_capacity = otherDatum._capacity;
			if (otherDatum._type == DatumTypes::String)
			{
				for (size_type i = 0; i < otherDatum._size; ++i)
				{
					PushBack(otherDatum._data.s[i]);
				}
			}
			else
			{
				memcpy(_data.vp, otherDatum._data.vp, otherDatum._size * size);
				_size = otherDatum._size;
			}
		}
		_type = otherDatum._type;

		return *this;
	}

	Datum& Datum::operator=(const std::int32_t value)
	{
		Clear();
		PushBack(value);

		return *this;
	}

	Datum& Datum::operator=(const float value)
	{
		Clear();
		PushBack(value);

		return *this;
	}

	Datum& Datum::operator=(const glm::vec4& value)
	{
		Clear();
		PushBack(value);

		return *this;
	}

	Datum& Datum::operator=(const glm::mat4& value)
	{
		Clear();
		PushBack(value);

		return *this;
	}

	Datum& Datum::operator=(const std::string& value)
	{
		Clear();
		PushBack(value);

		return *this;
	}

	Datum& Datum::operator=(RTTI* value)
	{
		Clear();
		PushBack(value);

		return *this;
	}

	Datum& Datum::operator=(Scope& value)
	{
		Clear();
		PushBack(value);

		return *this;
	}
#pragma endregion

#pragma region Move Semantincs 
	Datum::Datum(Datum&& otherDatum) noexcept:
		_size(otherDatum._size), _capacity(otherDatum._capacity), _type(otherDatum._type), _isExternal(otherDatum._isExternal), _data(otherDatum._data)
	{
		otherDatum._size = 0;
		otherDatum._capacity = 0;
		otherDatum._data.vp = nullptr;
	}

	Datum& Datum::operator=(Datum&& otherDatum) noexcept
	{
		if (this != &otherDatum)
		{
			Clear();
			free(_data.vp);
			_size = otherDatum._size;
			_capacity = otherDatum._capacity;
			_type = otherDatum._type;
			_isExternal = otherDatum._isExternal;
			_data = otherDatum._data;

			otherDatum._size = 0;
			otherDatum._capacity = 0;
			otherDatum._data.vp = nullptr;
		}
		return *this;
	}
#pragma endregion

#pragma region operator==
	bool Datum::operator==(const Datum& otherDatum) const
	{
		int comp = 1;
		if (_size == otherDatum._size && _type == otherDatum._type)
		{
			if (_type == DatumTypes::String)
			{
				comp = 0;
				for (size_type i = 0; i < _size; ++i)
				{
					comp += strcmp(_data.s[i].c_str(), otherDatum._data.s[i].c_str());
					if (comp != 0)
					{
						break;
					}
				}
			}
			else if (_type == DatumTypes::Pointer || _type == DatumTypes::Table)
			{
				for (size_type i = 0; i < _size; ++i)
				{
					if (_data.r[i]->Equals(otherDatum._data.r[i]) == false)
					{
						return false;
					}
					
				}
				return true;
			}

			else if(_type != DatumTypes::String && _type != DatumTypes::Pointer && _type != DatumTypes::Table)
			{
				comp = memcmp(_data.vp, otherDatum._data.vp, _size * DatumTypeSizes[static_cast<size_type>(_type)]);
			}
		}
		return comp == 0;
	}

	bool Datum::operator==(int32_t i) const
	{
		return (_size == 1) && (_type == DatumTypes::Integer) && (_data.i[0] == i);
	}
	bool Datum::operator==(float f) const
	{
		return (_size == 1) && (_type == DatumTypes::Float) && (_data.f[0] == f);
	}
	bool Datum::operator==(const glm::vec4& vec) const
	{
		return (_size == 1) && (_type == DatumTypes::Vector) && (_data.vec[0] == vec);
	}
	bool Datum::operator==(const glm::mat4& mat) const
	{
		return (_size == 1) && (_type == DatumTypes::Matrix) && (_data.mat[0] == mat);
	}
	bool Datum::operator==(const string& s) const
	{
		return (_size == 1) && (_type == DatumTypes::String) && (_data.s[0] == s); 
	}
	bool Datum::operator==(RTTI* r) const {
		return (_size == 1) && (_type == DatumTypes::Pointer) && (_data.r[0]->Equals(r));
	}
#pragma endregion

#pragma region operation!=
	bool Datum::operator!=(const Datum& otherDatum) const
	{
		return !operator==(otherDatum);
	}

	bool Datum::operator!=(int32_t i) const
	{					
		return !operator==(i);
	}					
	bool Datum::operator!=(float f) const
	{					
		return !operator==(f);
	}					
	bool Datum::operator!=(const glm::vec4& vec) const
	{					
		return !operator==(vec);
	}					
	bool Datum::operator!=(const glm::mat4& mat) const
	{					
		return !operator==(mat);
	}					
	bool Datum::operator!=(const string& s) const
	{					
		return !operator==(s);
	}					
	bool Datum::operator!=(RTTI* r) const 
	{
		return !operator==(r);
	}

#pragma endregion

Scope& Datum::operator[](size_type index)
{
	return *Get<Scope*>(index);
}

Scope& Datum::operator[](size_type index) const
{
	return *Get<Scope*>(index);
}
#pragma region Datum::Set
	void Datum::SetType(DatumTypes type)
	{
		if(type == DatumTypes::Unknown)
		{
			throw std::exception("Cannot set type to unknown");
		}
		if (_type == type)
		{
			return;
		}
		if (_type != DatumTypes::Unknown)
		{
			throw std::exception("Cannot change the type if it isnt unknown.");
		}
		_type = type;
	}

	void Datum::Set(int32_t value, size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("index is not in the array.");
		}
		if (_type != DatumTypes::Integer)
		{
			throw std::exception("Types do not match");
		}
		_data.i[index] = value;
	}

	void Datum::Set(float value, size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("index is not in the array.");
		}
		if (_type != DatumTypes::Float)
		{
			throw std::exception("Types do not match");
		}
		_data.f[index] = value;
	}

	void Datum::Set(glm::vec4 value, size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("index is not in the array.");
		}
		if (_type != DatumTypes::Vector)
		{
			throw std::exception("Types do not match");
		}
		_data.vec[index] = value;
	}

	void Datum::Set(glm::mat4 value, size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("index is not in the array.");
		}
		if (_type != DatumTypes::Matrix)
		{
			throw std::exception("Types do not match");
		}
		_data.mat[index] = value;
	}

	void Datum::Set(string value, size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("index is not in the array.");
		}
		if (_type != DatumTypes::String)
		{
			throw std::exception("Types do not match");
		}
		_data.s[index] = value;
	}

	void Datum::Set(RTTI* value, size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("index is not in the array.");
		}
		if (_type != DatumTypes::Pointer)
		{
			throw std::exception("Types do not match");
		}
		_data.r[index] = value;
	}

	void Datum::Set(Scope* value, size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("index is not in the array.");
		}
		if (_type != DatumTypes::Table)
		{
			throw std::exception("Types do not match");
		}
		_data.t[index] = value;
	}
#pragma endregion

#pragma region Datum::PushBack
	void Datum::PushBack(const int32_t value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Push on an external datum.");
		}
		if (_type == DatumTypes::Unknown)
		{
			_type = DatumTypes::Integer;
		}
		if (_type != DatumTypes::Integer)
		{
			throw std::exception("Datum type is not int.");
		}
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_data.i + _size)int32_t(value);
		++_size;
	}

	void Datum::PushBack(const float value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Push on an external datum.");
		}
		if (_type == DatumTypes::Unknown)
		{
			_type = DatumTypes::Float;
		}
		if (_type != DatumTypes::Float)
		{
			throw std::exception("Datum type is not float.");
		}
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_data.f + _size)float(value);
		++_size;
	}

	void Datum::PushBack(const glm::vec4& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Push on an external datum.");
		}
		if (_type == DatumTypes::Unknown)
		{
			_type = DatumTypes::Vector;
		}
		if (_type != DatumTypes::Vector)
		{
			throw std::exception("Datum type is not glm::vec4. ");
		}
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_data.vec + _size)glm::vec4(value);
		++_size;
	}

	void Datum::PushBack(const glm::mat4& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Push on an external datum.");
		}
		if (_type == DatumTypes::Unknown)
		{
			_type = DatumTypes::Matrix;
		}
		if (_type != DatumTypes::Matrix)
		{
			throw std::exception("Datum type is not glm::mat4. ");
		}
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_data.mat + _size)glm::mat4(value);
		++_size;
	}

	void Datum::PushBack(const string& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Push on an external datum.");
		}
		if (_type == DatumTypes::Unknown)
		{
			_type = DatumTypes::String;
		}
		if (_type != DatumTypes::String)
		{
			throw std::exception("Datum type is not string. ");
		}
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_data.s + _size)string(value);
		++_size;
	}

	void Datum::PushBack(RTTI* value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Push on an external datum.");
		}
		if (_type == DatumTypes::Unknown)
		{
			_type = DatumTypes::Pointer;
		}
		if (_type != DatumTypes::Pointer)
		{
			throw std::exception("Datum type is not a pointer. ");
		}
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_data.r + _size)RTTI*(value); // what here
		++_size;
	}

	void Datum::PushBack(Scope& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Push on an external datum.");
		}
		if (_type == DatumTypes::Unknown)
		{
			_type = DatumTypes::Table;
		}
		if (_type != DatumTypes::Table)
		{
			throw std::exception("Datum type is not a table. ");
		}
		if (_size == _capacity)
		{
			Reserve(std::max(_capacity + 1, _capacity * 2));
		}
		new(_data.t + _size)Scope*(&value); // what here
		++_size;
	}

	void Datum::PushBackFromString(const std::string& valueString)
	{
		if (_type == DatumTypes::Unknown || _type == DatumTypes::Pointer)
		{
			throw std::exception("cannot set from an unknown type");
		}
		switch (_type)
		{
		case DatumTypes::Integer:
			PushBack(stoi(valueString));
			break;
		case DatumTypes::Float:
			PushBack(stof(valueString));
			break;
		case DatumTypes::Vector:
			float a, b, c, d;
			sscanf_s(valueString.c_str(), "vec4(%f, %f, %f, %f)", &a, &b, &c, &d);
			PushBack(glm::vec4(a, b, c, d));
			break;
		case DatumTypes::Matrix:
			float matrix[16];
			sscanf_s(valueString.c_str(), "mat4x4((%f, %f, %f, %f), (%f, %f, %f, %f), (%f, %f, %f, %f), (%f, %f, %f, %f))", &matrix[0], &matrix[1], &matrix[2], &matrix[3],
				&matrix[4], &matrix[5], &matrix[6], &matrix[7],
				&matrix[8], &matrix[9], &matrix[10], &matrix[11],
				&matrix[12], &matrix[13], &matrix[14], &matrix[15]);
			PushBack(glm::make_mat4(matrix));
			break;
		case DatumTypes::String:
			PushBack(valueString);
			break;
		}
	}
	
#pragma endregion

#pragma region Datum::SetStorage
	void Datum::SetStorage(int32_t* list, size_type numElements)
	{
		assert(list != nullptr);
		assert(numElements != 0);
		SetStorage(DatumTypes::Integer, list, numElements);
		//if (_type != DatumTypes::Integer && _type != DatumTypes::Unknown)
		//{
		//	throw std::exception("Cannot change the type of the list.");
		//}
		//if (_size > 0)
		//{
		//	throw std::exception("Cannot set storage on an already initialized list");
		//}
		//_type = DatumTypes::Integer;
		//_data.i = list;
		//_size = numElements;
		//_capacity = numElements;
		//_isExternal = true;
	}

	void Datum::SetStorage(float* list, size_type numElements)
	{
		assert(list != nullptr);
		assert(numElements != 0);
		SetStorage(DatumTypes::Float, list, numElements);
		//if (_type != DatumTypes::Float && _type != DatumTypes::Unknown)
		//{
		//	throw std::exception("Cannot change the type of the list.");
		//}
		//if (_size > 0)
		//{
		//	throw std::exception("Cannot set storage on an already initialized list");
		//}
		//_type = DatumTypes::Float;
		//_data.f = list;
		//_size = numElements;
		//_capacity = numElements;
		//_isExternal = true;
	}

	void Datum::SetStorage(glm::vec4* list, size_type numElements)
	{
		assert(list != nullptr);
		assert(numElements != 0);
		SetStorage(DatumTypes::Vector, list, numElements);
		//if (_type != DatumTypes::Vector && _type != DatumTypes::Unknown)
		//{
		//	throw std::exception("Cannot change the type of the list.");
		//}
		//if (_size > 0)
		//{
		//	throw std::exception("Cannot set storage on an already initialized list");
		//}
		//_type = DatumTypes::Vector;
		//_data.vec = list;
		//_size = numElements;
		//_capacity = numElements;
		//_isExternal = true;
	}

	void Datum::SetStorage(glm::mat4* list, size_type numElements)
	{
		assert(list != nullptr);
		assert(numElements != 0);
		SetStorage(DatumTypes::Matrix, list, numElements);
		//if (_type != DatumTypes::Matrix && _type != DatumTypes::Unknown)
		//{
		//	throw std::exception("Cannot change the type of the list.");
		//}
		//if (_size > 0)
		//{
		//	throw std::exception("Cannot set storage on an already initialized list");
		//}
		//_type = DatumTypes::Matrix;
		//_data.mat = list;
		//_size = numElements;
		//_capacity = numElements;
		//_isExternal = true;
	}

	void Datum::SetStorage(string* list, size_type numElements)
	{
		assert(list != nullptr);
		assert(numElements != 0);
		SetStorage(DatumTypes::String, list, numElements);
		//if (_type != DatumTypes::String && _type != DatumTypes::Unknown)
		//{
		//	throw std::exception("Cannot change the type of the list.");
		//}
		//if (_size > 0)
		//{
		//	throw std::exception("Cannot set storage on an already initialized list");
		//}
		//_type = DatumTypes::String;
		//_data.s = list;
		//_size = numElements;
		//_capacity = numElements;
		//_isExternal = true;
	}

	void Datum::SetStorage(RTTI** list, size_type numElements)
	{
		assert(list != nullptr);
		assert(numElements != 0);
		SetStorage(DatumTypes::Pointer, list, numElements);
		
	}

	void Datum::SetStorage(DatumTypes type, void* data,  size_type size)
	{
		if (_type == DatumTypes::Unknown)
		{
			SetType(type);
		}
		else if (_type != type)
		{
			throw runtime_error("Invalid operation");
		}
		//if (_isExternal == false && _capacity > 0)
		//{
		//	throw std::runtime_error("Internal storage already created.");
		//}
		_data.vp = data;
		_size = size;
		_capacity = size;
		_isExternal = true;
	}
#pragma endregion

#pragma region Datum::Find 

	pair<bool, typename Datum::size_type> Datum::Find(int32_t value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Find on an external datum.");
		}
		bool found = false; 
		size_type index = 0;
		for (index; index < _size; ++index)
		{
			if (_data.i[index] == value)
			{
				found = true; 
				break;
			}
		}

		return pair<bool, size_type>(found, index);
	}

	pair<bool, typename Datum::size_type> Datum::Find(float value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Find on an external datum.");
		}
		bool found = false;
		size_type index = 0;
		for (index; index < _size; ++index)
		{
			if (_data.f[index] == value)
			{
				found = true;
				break;
			}
		}

		return pair<bool, size_type>(found, index);
	}

	pair<bool, typename Datum::size_type> Datum::Find(const glm::vec4& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Find on an external datum.");
		}
		bool found = false;
		size_type index = 0;
		for (index; index < _size; ++index)
		{
			if (_data.vec[index] == value)
			{
				found = true;
				break;
			}
		}

		return pair<bool, size_type>(found, index);
	}

	pair<bool, typename Datum::size_type> Datum::Find(const glm::mat4& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Find on an external datum.");
		}
		bool found = false;
		size_type index = 0;
		for (index; index < _size; ++index)
		{
			if (_data.mat[index] == value)
			{
				found = true;
				break;
			}
		}

		return pair<bool, size_type>(found, index);
	}

	pair<bool, typename Datum::size_type> Datum::Find(const string& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Find on an external datum.");
		}
		bool found = false;
		size_type index = 0;
		for (index; index < _size; ++index)
		{
			if (_data.s[index] == value)
			{
				found = true;
				break;
			}
		}

		return pair<bool, size_type>(found, index);
	}

	pair<bool, typename Datum::size_type> Datum::Find(RTTI* value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Find on an external datum.");
		}
		bool found = false;
		size_type index = 0;
		for (index; index < _size; ++index)
		{
			if (_data.r[index]->Equals(value))
			{
				found = true;
				break;
			}
		}

		return pair<bool, size_type>(found, index);
	}

	pair<bool, typename Datum::size_type> Datum::Find(Scope* value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Find on an external datum.");
		}
		bool found = false;
		size_type index = 0;
		for (index; index < _size; ++index)
		{
			if (_data.t[index] == (value))
			{
				found = true;
				break;
			}
		}

		return pair<bool, size_type>(found, index);
	}
#pragma endregion

#pragma region Datum::Remove

	bool Datum::Remove(int32_t value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		pair<bool, size_type> found = Find(value);
		if (found.first)
		{
			RemoveAt(found.second);
		}
		return found.first;
	}

	bool Datum::Remove(float value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		pair<bool, size_type> found = Find(value);
		if (found.first)
		{
			RemoveAt(found.second);
		}
		return found.first;
	}

	bool Datum::Remove(const glm::vec4& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		pair<bool, size_type> found = Find(value);
		if (found.first)
		{
			RemoveAt(found.second);
		}
		return found.first;
	}

	bool Datum::Remove(const glm::mat4& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		pair<bool, size_type> found = Find(value);
		if (found.first)
		{
			RemoveAt(found.second);
		}
		return found.first;
	}

	bool Datum::Remove(const string& value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		pair<bool, size_type> found = Find(value);
		if (found.first)
		{
			RemoveAt(found.second);
		}
		return found.first;
	}

	bool Datum::Remove(RTTI* value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		pair<bool, size_type> found = Find(value);
		if (found.first)
		{
			RemoveAt(found.second);
		}
		return found.first;

	}

	bool Datum::Remove(Scope* value)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		pair<bool, size_type> found = Find(value);
		if (found.first)
		{
			RemoveAt(found.second);
		}
		return found.first;

	}

	void Datum::RemoveAt(size_type index)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Remove on an external datum.");
		}
		if (index >= _size)
		{
			throw std::out_of_range("cant remove from an index greater than the size.");
		}
		if (index != _size - 1)
		{
			if (_type == DatumTypes::String)
			{
				destroy_at(_data.s + index);
			}
			size_type size = DatumTypeSizes[static_cast<size_type>(_type)];
			memmove(reinterpret_cast<uint8_t*>(_data.vp) + index * size, reinterpret_cast<uint8_t*>(_data.vp) + (index * size) + (1 * size), ((_size - 1) * size) - (size * index));
			--_size;
		}
		else if (index == _size - 1)
		{
			PopBack();
		}
	}

	void Datum::PopBack()
	{
		if (_isExternal)
		{
			throw std::exception("Cant Pop on an external datum.");
		}
		if (_size > 0)
		{
			if (_type == DatumTypes::String)
			{
				destroy_at(_data.s + _size - 1);
			}
			--_size;
		}
	}

	void Datum::Clear()
	{
		if (_isExternal)
		{
			throw std::exception("Cant Clear on an external datum.");
		}
		while (_size != 0)
		{
			PopBack();
		}
	}

#pragma endregion

#pragma region Datum String

	void Datum::SetFromString(string string, size_type index)
	{
		if (_type == DatumTypes::Unknown || _type == DatumTypes::Pointer)
		{
			throw std::exception("cannot set from an unknown type");
		}
		if (index >= _size)
		{
			throw std::out_of_range("out of range of datum.");
		}
		switch (_type)
		{
			case DatumTypes::Integer:
				Set(stoi(string), index);
				break;
			case DatumTypes::Float:
				Set(stof(string), index);
				break;
			case DatumTypes::Vector:
				float a, b, c, d; 
				sscanf_s(string.c_str(), "vec4(%f, %f, %f, %f)", &a, &b, &c, &d);
				Set(glm::vec4(a, b, c, d), index);
				break;
			case DatumTypes::Matrix:
				float matrix[16];
				sscanf_s(string.c_str(), "mat4x4((%f, %f, %f, %f), (%f, %f, %f, %f), (%f, %f, %f, %f), (%f, %f, %f, %f))", &matrix[0], &matrix[1], &matrix[2], &matrix[3], 
																						  &matrix[4], &matrix[5], &matrix[6], &matrix[7],
																						  &matrix[8], &matrix[9], &matrix[10], &matrix[11], 
																						  &matrix[12], &matrix[13], &matrix[14], &matrix[15]);
				Set(glm::make_mat4(matrix), index);
				break;
			case DatumTypes::String:
				Set(string, index);
				break;	
		}
	}

	string Datum::ToString(size_type index) const
	{
		if (_type == DatumTypes::Unknown || _type == DatumTypes::Pointer)
		{
			throw std::exception("cannot set from an unknown type.");
		}
		if (index >= _size)
		{
			throw std::out_of_range("out of range of datum.");
		}
		string s;
		switch (_type)
		{
			case DatumTypes::Integer:
				s = to_string(_data.i[index]);
				break;
			case DatumTypes::Float:
				s = to_string(_data.f[index]);
				break;
			case DatumTypes::Vector:
				s = glm::to_string(_data.vec[index]);
				//s = to_string(_data.vec[index].x) + ", " + to_string(_data.vec[index].y) + ", " + to_string(_data.vec[index].z) + ", " + to_string(_data.vec[index].z);
				break;
			case DatumTypes::Matrix:
				s = glm::to_string(_data.mat[index]);
				//for (glm::mat4::length_type i = 0; i < 4; ++i)
				//{
				//	s += to_string(_data.mat[index][i].x) + ", " + to_string(_data.mat[index][i].y) + ", " + to_string(_data.mat[index][i].z) + ", " + to_string(_data.mat[index][i].z);
				//	if (i < 3)
				//	{
				//		s += ", ";
				//	}
				//}
				break;
			case DatumTypes::String:
				s = _data.s[index];
				break;
		}
		return s;
	}



#pragma endregion

#pragma region Resize Functions
	void Datum::Resize(size_type size)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Resize on an external datum.");
		}
		if (DatumTypes::Unknown == _type)
		{
			throw std::exception("Cant Reserve on an unknown datum.");
		}
		if (size < _size)
		{
			for (auto i = _size; i > size; --i)
			{
				PopBack(); 
			}
		}
		if (size > _capacity)
		{
			Reserve(size);
			if (_type == DatumTypes::String)
			{
				for (size_type index = _size; index < size; ++index)
				{
					new(_data.s + index)string("");
				}
			}
			else
			{
				memset(_data.vp, 0, size);
			}
		}
		_capacity = size;
		_size = size;
	}
	void Datum::Reserve(size_type capacity)
	{
		if (_isExternal)
		{
			throw std::exception("Cant Reserve on an external datum.");
		}
		if (DatumTypes::Unknown == _type)
		{
			throw std::exception("Cant Reserve on an unknown datum.");
		}
		if (capacity > _capacity)
		{
			size_type size = DatumTypeSizes[static_cast<size_type>(_type)];
			void* data = realloc(_data.vp, capacity * size);
			assert(data != nullptr);
			_data.vp = data;
			_capacity = capacity;
		}
	}

	void Datum::ShrinkToFit()
	{
		if (_isExternal)
		{
			throw std::exception("Cant ShrinkToFit on an external datum.");
		}
		if (DatumTypes::Unknown == _type)
		{
			throw std::exception("Cant Reserve on an unknown datum.");
		}
		if (_size < _capacity)
		{
			size_type size = DatumTypeSizes[static_cast<size_type>(_type)];
			void* data = realloc(_data.vp, _size * size);
			assert(data != nullptr);
			_data.vp = data;
			_capacity = _size;
		}
	}
#pragma endregion
	
}