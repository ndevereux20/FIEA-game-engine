#include "pch.h"
#include "Factory.h"

namespace FieaGameEngine
{
	template<typename AbstractProductT> 
	const Factory<AbstractProductT>* const Factory<AbstractProductT>::Find(const std::string& factoryName)
	{
		const auto it = _factoryTable.Find(factoryName);
		if (it == _factoryTable.end())
		{
			return nullptr;
		}
		return it->second;
	}

	template<typename AbstractProductT>
	AbstractProductT* Factory<AbstractProductT>::Create(const std::string& factoryName)
	{
		const Factory<AbstractProductT>* const foundFactory = Find(factoryName);
		AbstractProductT* foundProduct = nullptr;
		if (foundFactory != nullptr)
		{
			foundProduct = foundFactory->Create();
		}
		return foundProduct;  
	}

	template<typename AbstractProductT>
	void Factory<AbstractProductT>::Add(Factory<AbstractProductT>& newFactory)
	{
		const auto className = newFactory.GetClassName();
		_factoryTable.Insert(std::make_pair(className, &newFactory));
	}

	template<typename AbstractProductT>
	void Factory<AbstractProductT>::Remove(Factory<AbstractProductT>& removedFactory)
	{
		const auto className = removedFactory.GetClassName();
		_factoryTable.Remove(className);
	}

	template<typename AbstractProductT>
	std::size_t Factory<AbstractProductT>::Size()
	{
		return _factoryTable.Size();
	}

}
