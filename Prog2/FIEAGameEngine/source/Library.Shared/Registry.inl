#include "Registry.h"
#include "Attribute.h"

namespace FieaGameEngine
{
	template<typename TClass, typename TParentClass>
	bool Registry::RegisterType()
	{
		auto parentIterator = _registry.Find(TParentClass::TypeIdClass());
		if (TParentClass::TypeIdClass() != Attribute::TypeIdClass())
		{
			if (parentIterator == _registry.end())
			{
				throw std::runtime_error("The parent does not exist in the Registry.");
			}
		}
		if (_registry.Find(TClass::TypeIdClass()) == _registry.end())
		{			
			if (TParentClass::TypeIdClass() != Attribute::TypeIdClass())
			{
				auto vector = (*parentIterator).second;
				for (auto const sig : TClass::Signatures())
				{
					vector.PushBack(sig);
				}
				_registry.Insert(std::make_pair(TClass::TypeIdClass(), vector));
			}
			else
			{
				_registry.Insert(std::make_pair(TClass::TypeIdClass(), TClass::Signatures()));
			}

			return true;
		}
		return false;
	}

}