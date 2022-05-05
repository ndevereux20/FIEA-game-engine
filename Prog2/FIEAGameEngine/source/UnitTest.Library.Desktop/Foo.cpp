#include "pch.h"
#include "Foo.h"

namespace UnitTestLibraryDesktop
{
	RTTI_DEFINITIONS(Foo);
	
	Foo::Foo(std::int32_t data) :
		mData(new int32_t(data))
	{
	}

	Foo::Foo(const Foo& other)
		: mData(new int32_t(*other.mData))
	{
	}

	Foo& Foo::operator=(const Foo& other)
	{
		if (this != &other)
		{
			*mData = *other.mData;
		}
		return *this;
	}

	Foo::~Foo()
	{
		delete mData;
	}

	const int32_t& Foo::Data() const
	{
		return *mData;
	}
	int32_t& Foo::Data()
	{
		return *mData;
	}

	bool Foo::operator==(const Foo& rhs) const
	{
		if (mData == rhs.mData) // if(this == &rhs)
		{
			return true; 
		}
		return (*mData == *rhs.mData);
	}

	bool Foo::operator!=(const Foo& rhs) const
	{
		return !operator==(rhs); //!(*this == rhs)
	}

}