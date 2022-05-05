#include "pch.h"
#include "Attribute.h"
using namespace std::string_literals;
using namespace std;

namespace FieaGameEngine
{
	RTTI_DEFINITIONS(Attribute);

#pragma region Constructors 

	Attribute::Attribute(RTTI::IdType childID)
	{
		Append("this") = this;
		Populate(childID);
	}

	Attribute::Attribute(const Attribute& other) :
		Scope(other), prescribedSize(other.prescribedSize)
	{
		UpdateExternalStorage(other.TypeIdInstance());
	}

	Attribute& Attribute::operator=(const Attribute& other) 
	{
		Scope::operator=(other);
		prescribedSize = other.prescribedSize;
		UpdateExternalStorage(other.TypeIdInstance());
		return *this;
	}

	Attribute::Attribute(Attribute&& other) noexcept :  
		Scope(std::forward<Scope>(other)), prescribedSize(other.prescribedSize)
	{
		other.prescribedSize = 0;
		UpdateExternalStorage(other.TypeIdInstance());
	}

	Attribute& Attribute::operator=(Attribute&& other) noexcept
	{
		Scope::operator=(std::forward<Scope>(other));
		prescribedSize = other.prescribedSize;
		UpdateExternalStorage(other.TypeIdInstance());

		other.prescribedSize = 0;
		return *this;
	}
#pragma endregion

	void Attribute::Populate(RTTI::IdType childID)
	{
		auto iterator = Registry::GetInstance()._registry.Find(childID);
		auto [key, value] = *iterator;
		auto thisptr = reinterpret_cast<uint8_t*>(this);
		for (const auto signature : value)
		{
			Datum& datum = Append(signature._name);
			datum.SetType(signature._type);
			if (signature._type != DatumTypes::Table)
			{
				datum.SetStorage(signature._type, thisptr + signature._offset , signature._size);
			}
		}
		prescribedSize = _orderVector.Size();

	}

	Datum& Attribute::AppendAuxiliaryAttribute(const std::string& string)
	{
		if (IsPrescribedAttribute(string) == true)
		{
			throw std::exception("Cant append an auxiliary attribute to a prescribed attribute");
		}
		return Append(string);
	}

	bool Attribute::IsAttribute(const string& string) const
	{
		return (Find(string) != nullptr);
	}

	bool Attribute::IsPrescribedAttribute(const string& string) const
	{
		for (size_t i = 0; i < prescribedSize; ++i)
		{
			auto key = (*_orderVector[i]).first;
			if (key == string)
			{
				return true;
			}
		}
		return false;
	}

	bool Attribute::IsAuxiliaryAttribute(const string& string) const
	{
		for (size_t i = prescribedSize; i < _orderVector.Size(); ++i)
		{
			auto key = (*_orderVector[i]).first;
			if (key == string)
			{
				return true;
			}
		}
		return false;
	}

	
	const std::size_t Attribute::PrescibedSize() const
	{
		return prescribedSize;
	}

	void Attribute::UpdateExternalStorage(RTTI::IdType otherID)
	{
		Append("this") = this;
		auto iterator = Registry::GetInstance()._registry.Find(otherID);
		auto [key, value] = *iterator;
		auto thisptr = reinterpret_cast<uint8_t*>(this);
		for (const auto signature : value)
		{
			if (signature._type != DatumTypes::Table)
			{
				Datum* datum = Find(signature._name);
				assert(datum != nullptr);
				datum->SetStorage(signature._type, thisptr + signature._offset, signature._size);
			}
		}
	}

	
}