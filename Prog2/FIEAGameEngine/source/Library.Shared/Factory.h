#pragma once
#include "HashMap.h"
#include "gsl/pointers"
namespace FieaGameEngine
{
	/// <summary>
	/// Abstract base class for registering and creating objects
	/// </summary>
	template <typename AbstractProductT>
	class Factory
	{
	public:
		/// <summary>
		/// Pure virtual GetClassName function, returns the name of the class associated with this Factory.
		/// </summary>
		/// <returns>The Class name.</returns>
		virtual const std::string& GetClassName() const = 0;

		/// <summary>
		/// Pure virtual Create, returns a pointer to the concrete product associated with the abstract Factory.
		/// </summary>
		/// <returns></returns>
		virtual gsl::owner<AbstractProductT*> Create() const = 0;

		/// <summary>
		/// Finds an associated concrete factory with the given name. Returns nullptr if none exists 
		/// </summary>
		/// <param name="factoryName">The name of the Factory we are finding.</param>
		/// <returns>A pointer to the Factory associated with the name.</returns>
		static const Factory<AbstractProductT>* const Find(const std::string & factoryName);
		
		/// <summary>
		/// Creates a new abstract product given a name. 
		/// </summary>
		/// <param name="factoryName">The name of the Factory we are creating.</param>
		/// <returns>A pointer to the new object.</returns>
		static AbstractProductT* Create(const std::string& factoryName);
	
		/// <summary>
		/// Gets the size of the Factory registry.
		/// </summary>
		/// <returns>The size of the registry.</returns>
		static std::size_t Size();

		/// <summary>
		/// Add the given Factory to the registry. 
		/// </summary>
		/// <param name="newFactory">The Factory we are adding.</param>
		static void Add(Factory<AbstractProductT>& newFactory);

		/// <summary>
		/// Removes the given Factory from the registry. 
		/// </summary>
		/// <param name="removedFactory">The Factory we are removing.</param>
		static void Remove(Factory<AbstractProductT>& removedFactory);
	private: 
		inline static HashMap<const std::string, const Factory<AbstractProductT>* const> _factoryTable;
	};
																								

}
#include "Factory.inl"

#define ConcreteFactory(ConcreteProductType, AbstractProductType)									\
	class ConcreteProductType ## Factory : public FieaGameEngine::Factory<AbstractProductType>		\
	{																								\
		public:																						\
			ConcreteProductType ## Factory() :_className(#ConcreteProductType){ Add(*this);	}		\
			~ConcreteProductType ## Factory() { Remove(*this); }									\
			const std::string& GetClassName() const override { return _className; }					\
			gsl::owner<AbstractProductType*> Create() const override { return new ConcreteProductType; } \
		protected:																					\
			std::string _className;																\
	};