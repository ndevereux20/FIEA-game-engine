#pragma once
#include <string.h>
#include "Datum.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Signature class for setting up datums in attribute. 
	/// </summary>
	struct Signature
	{
		Signature(std::string name, DatumTypes type, std::size_t size, std::size_t offset) :
			_name(name), _type(type), _size(size), _offset(offset)
		{
		}

		//bool operator==(const Signature& other)
		//{
		//	other;
		//	return true;
		//}
		~Signature() = default;
		Signature(const Signature& other) = default;
		Signature& operator=(const Signature& other) = default;
		Signature(Signature&& other) = default;
		Signature& operator=(Signature&& other) = default;

		std::string _name;
		DatumTypes _type;
		std::size_t _size;
		std::size_t _offset;

	};

}
