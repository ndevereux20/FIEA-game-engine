#pragma once
#include "HashMap.h"
#include "Signature.h"
#include "Attribute.h"
#include <cassert>

namespace FieaGameEngine
{
	/// <summary>
	/// A singleton class that holds a registry of TypeId's to a vector of Signatures.
	/// </summary>
	class Registry
	{
	public:

		/// <summary>
		/// Retrieves the instance of the singleton.
		/// </summary>
		/// <returns></returns>
		static Registry& GetInstance() 
		{
			if (_instance == nullptr)
			{
				_instance = new Registry();
			}
			return *_instance;
		}

		/// <summary>
		/// Templated register function that takes in the class to register and its parents. 
		/// </summary>
		/// <returns>A bool as to whether the class was registered.</returns>
		template<typename TClass, typename TParentClass> 
		bool RegisterType();

		/// <summary>
		/// Clears the Registry.
		/// </summary>
		void ClearRegistry()
		{
			_registry.Clear();
		}

		HashMap<std::size_t, Vector<Signature>> _registry;
	private:
		static Registry* _instance; 
		Registry() = default;
		~Registry() = default;
		Registry(const Registry&) = delete;
		Registry& operator=(const Registry&) = delete;
		Registry(Registry&&) = delete;
		Registry& operator=(Registry&&) = delete;
	};
}
#include "Registry.inl"
