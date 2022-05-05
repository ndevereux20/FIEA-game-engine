#include "Datum.h"
#include <cstdint>
#include <string.h> 
#include <stdexcept>
#include "RTTI.h"

#pragma warning(push)
#pragma warning(disable:4201)
#pragma warning(disable:4635)
#include "glm\glm.hpp"
#pragma warning(pop)

namespace FieaGameEngine
{

	inline const typename Datum::size_type Datum::Size() const
	{
		return _size;
	}

	inline const typename Datum::size_type Datum::Capacity() const
	{
		return _capacity;
	}

	inline const DatumTypes Datum::Type() const
	{
		return _type;
	}
	inline bool Datum::IsEmpty() const
	{
		return _size == 0;
	}
	inline bool Datum::IsExternal() const
	{
		return _isExternal == true;
	}

#pragma region Datum::Get
	template<>
	inline int32_t& Datum::Get<int32_t>(size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Integer)
		{
			throw std::exception("Types do not match");
		}
		return _data.i[index];
	}
	template<>
	inline const int32_t& Datum::Get<int32_t>(size_type index) const
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Integer)
		{
			throw std::exception("Types do not match");
		}
		return _data.i[index];
	}

	template<>
	inline float& Datum::Get<float>(size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Float)
		{
			throw std::exception("Types do not match");
		}
		return _data.f[index];
	}

	template<>
	inline const float& Datum::Get<float>(size_type index) const
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Float)
		{
			throw std::exception("Types do not match");
		}
		return _data.f[index];
	}

	template<>
	inline glm::vec4& Datum::Get<glm::vec4>(size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Vector)
		{
			throw std::exception("Types do not match");
		}
		return _data.vec[index];
	}

	template<>
	inline const glm::vec4& Datum::Get<glm::vec4>(size_type index) const
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Vector)
		{
			throw std::exception("Types do not match");
		}
		return _data.vec[index];
	}

	template<>
	inline glm::mat4& Datum::Get<glm::mat4>(size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Matrix)
		{
			throw std::exception("Types do not match");
		}
		return _data.mat[index];
	}

	template<>
	inline const glm::mat4& Datum::Get<glm::mat4>(size_type index) const
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Matrix)
		{
			throw std::exception("Types do not match");
		}
		return _data.mat[index];
	}

	template<>
	inline std::string& Datum::Get<std::string>(size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::String)
		{
			throw std::exception("Types do not match");
		}
		return _data.s[index];
	}

	template<>
	inline const std::string& Datum::Get<std::string>(size_type index) const
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::String)
		{
			throw std::exception("Types do not match");
		}
		return _data.s[index];
	}

	template<>
	inline RTTI*& Datum::Get<RTTI*>(size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Pointer)
		{
			throw std::exception("Types do not match");
		}
		return _data.r[index];
	}
	
	template<>
	inline RTTI* const& Datum::Get<RTTI*>(size_type index) const
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Pointer)
		{
			throw std::exception("Types do not match");
		}
		return _data.r[index];
	}

	template<>
	inline Scope*& Datum::Get<Scope*>(size_type index)
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Table)
		{
			throw std::exception("Types do not match");
		}
		return _data.t[index];
	}

	template<>
	inline Scope* const& Datum::Get<Scope*>(size_type index) const
	{
		if (index >= _size)
		{
			throw std::out_of_range("Accessing an element not in the array.");
		}
		if (_type != DatumTypes::Table)
		{
			throw std::exception("Types do not match");
		}
		return _data.t[index];
	}
#pragma endregion

#pragma region Datum::Front

template<>
inline int32_t& Datum::Front<int32_t>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Integer)
	{
		throw std::exception("Types do not match");
	}
	return _data.i[0];
}

template<>
inline const int32_t& Datum::Front<int32_t>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Integer)
	{
		throw std::exception("Types do not match");
	}
	return _data.i[0];
}

template<>
inline float& Datum::Front<float>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Float)
	{
		throw std::exception("Types do not match");
	}
	return _data.f[0];
}

template<>
inline const float& Datum::Front<float>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Float)
	{
		throw std::exception("Types do not match");
	}
	return _data.f[0];
}

template<>
inline glm::vec4& Datum::Front<glm::vec4>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Vector)
	{
		throw std::exception("Types do not match");
	}
	return _data.vec[0];
}

template<>
inline const glm::vec4& Datum::Front<glm::vec4>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Vector)
	{
		throw std::exception("Types do not match");
	}
	return _data.vec[0];
}

template<>
inline glm::mat4& Datum::Front<glm::mat4>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Matrix)
	{
		throw std::exception("Types do not match");
	}
	return _data.mat[0];
}

template<>
inline const glm::mat4& Datum::Front<glm::mat4>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Matrix)
	{
		throw std::exception("Types do not match");
	}
	return _data.mat[0];
}

template<>
inline std::string& Datum::Front<std::string>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::String)
	{
		throw std::exception("Types do not match");
	}
	return _data.s[0];
}

template<>
inline const std::string& Datum::Front<std::string>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::String)
	{
		throw std::exception("Types do not match");
	}
	return _data.s[0];
}

template<>
inline RTTI*& Datum::Front<RTTI*>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Pointer)
	{
		throw std::exception("Types do not match");
	}
	return _data.r[0];
}

template<>
inline RTTI* const& Datum::Front<RTTI*>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Pointer)
	{
		throw std::exception("Types do not match");
	}
	return _data.r[0];
}
#pragma endregion

#pragma region Datum::Back

template<>
inline int32_t& Datum::Back<int32_t>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Integer)
	{
		throw std::exception("Types do not match");
	}
	return _data.i[_size - 1];
}

template<>
inline const int32_t& Datum::Back<int32_t>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Integer)
	{
		throw std::exception("Types do not match");
	}
	return _data.i[_size - 1];
}

template<>
inline float& Datum::Back<float>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Float)
	{
		throw std::exception("Types do not match");
	}
	return _data.f[_size - 1];
}

template<>
inline const float& Datum::Back<float>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Float)
	{
		throw std::exception("Types do not match");
	}
	return _data.f[_size - 1];
}

template<>
inline glm::vec4& Datum::Back<glm::vec4>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Vector)
	{
		throw std::exception("Types do not match");
	}
	return _data.vec[_size - 1];
}

template<>
inline const glm::vec4& Datum::Back<glm::vec4>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Vector)
	{
		throw std::exception("Types do not match");
	}
	return _data.vec[_size - 1];
}

template<>
inline glm::mat4& Datum::Back<glm::mat4>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Matrix)
	{
		throw std::exception("Types do not match");
	}
	return _data.mat[_size - 1];
}

template<>
inline const glm::mat4& Datum::Back<glm::mat4>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Matrix)
	{
		throw std::exception("Types do not match");
	}
	return _data.mat[_size - 1];
}

template<>
inline std::string& Datum::Back<std::string>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::String)
	{
		throw std::exception("Types do not match");
	}
	return _data.s[_size - 1];
}

template<>
inline const std::string& Datum::Back<std::string>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::String)
	{
		throw std::exception("Types do not match");
	}
	return _data.s[_size - 1];
}

template<>
inline RTTI*& Datum::Back<RTTI*>()
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Pointer)
	{
		throw std::exception("Types do not match");
	}
	return _data.r[_size - 1];
}

template<>
inline RTTI* const& Datum::Back<RTTI*>() const
{
	if (_size == 0)
	{
		throw std::out_of_range("Accessing an empty array.");
	}
	if (_type != DatumTypes::Pointer)
	{
		throw std::exception("Types do not match");
	}
	return _data.r[_size - 1];
}
#pragma endregion
}