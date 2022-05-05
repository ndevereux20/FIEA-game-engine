#pragma once

#include "pch.h"
#include "Slist.h"
#include "Foo.h"
#include "Vector.h"
#include "HashMap.h"
#include "Datum.h"
#pragma warning(push)
#pragma warning(disable:4201)
#pragma warning(disable:4635)
#include "glm\glm.hpp"
#pragma warning(pop)
#include "RTTI.h"
#include "AttributedFoo.h"
#include "AttributedBar.h"
#include "JsonTestParseHelper.h"
#include "JsonParseCoordinator.h"
#include "JsonTableParseHelper.h"
#include "GameObject.h"
#include "Avatar.h"
#include "ActionList.h"
#include "ActionListIf.h"
#include "ActionCreateAction.h"
#include "ActionDestroyAction.h"
#include "ActionIncrement.h"
#include "Event.h"
#include "EventSubscribers.h"

using namespace UnitTestLibraryDesktop;
using namespace FieaGameEngine;
using namespace std;
using namespace std::string_literals;
using namespace glm;

namespace Microsoft::VisualStudio::CppUnitTestFramework
{


	template<>
	inline std::wstring ToString<std::pair<const Foo, int>>(const std::pair<const Foo, int>& t)
	{
		try
		{
			std::wstring string_value = std::to_wstring(t.first.Data()) + std::to_wstring(t.second);
			RETURN_WIDE_STRING(string_value);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}
	}

	template<>
	inline std::wstring ToString<std::pair<const Foo, Foo>>(const std::pair<const Foo, Foo>& t)
	{
		try
		{
			std::wstring string_value = std::to_wstring(t.first.Data()) + std::to_wstring(t.second.Data());
			RETURN_WIDE_STRING(string_value);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}
	}

	template<>
	inline std::wstring ToString<Foo>(const Foo& t)
	{
		RETURN_WIDE_STRING(t.Data());
	}
	template<>
	inline std::wstring ToString<Foo>(const Foo* t)
	{
		RETURN_WIDE_STRING(t);
	}
	template<>
	inline std::wstring ToString<Foo>(Foo* t)
	{
		RETURN_WIDE_STRING(t);
	}

	template<>
	inline std::wstring ToString<Slist<Foo>::Iterator>(const Slist<Foo>::Iterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}

	}


	template<>
	inline std::wstring ToString<Slist<Foo>::ConstIterator>(const Slist<Foo>::ConstIterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}

	}

	template<>
	inline std::wstring ToString<Vector<Foo>::Iterator>(const Vector<Foo>::Iterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}

	}


	template<>
	inline std::wstring ToString<Vector<Foo>::ConstIterator>(const Vector<Foo>::ConstIterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}

	}

	template<>
	inline std::wstring ToString<HashMap<Foo, Foo>::Iterator>(const HashMap<Foo, Foo>::Iterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}
	}
	
	template<>
	inline std::wstring ToString<HashMap<Foo, Foo>::ConstIterator>(const HashMap<Foo, Foo>::ConstIterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}
	}

	template<>
	inline std::wstring ToString<HashMap<Foo, int>::Iterator>(const HashMap<Foo, int>::Iterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}
	}

	template<>
	inline std::wstring ToString<HashMap<Foo, int>::ConstIterator>(const HashMap<Foo, int>::ConstIterator& t)
	{
		try
		{
			return ToString(*t);
		}
		catch (const std::runtime_error&)
		{
			return L"end()"s;
		}
	}

	template<>
	inline std::wstring ToString<DatumTypes>(const DatumTypes& t)
	{
		t;
		return L"end()"s;
	}

	template<>
	inline std::wstring ToString<vec4>(const vec4& t)
	{
		
		std::wstring string_value = ToString(t.x) + L" "s + ToString(t.y) + L" "s + ToString(t.z) + L" "s + ToString(t.w);
		RETURN_WIDE_STRING(string_value);
	}

	template<>
	inline std::wstring ToString<mat4>(const mat4& t)
	{
		
		std::wstring string_value = ToString(t[0]) + L" "s + ToString(t[1]) + L" "s + ToString(t[2]) + L" "s + ToString(t[3]);
		RETURN_WIDE_STRING(string_value);
	}
	template<> 
	inline std::wstring ToString<RTTI>(RTTI* t)
	{
		t;
		return L"end()"s;
	}

	template<>
	inline std::wstring ToString<Datum>(const Datum& t)
	{
		t; 
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Datum>(Datum* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Datum>(const Datum* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Scope>(Scope* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Scope>(const Scope* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<AttributedFoo>(AttributedFoo* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Attribute>(Attribute* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<AttributedBar>(AttributedBar* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<JsonTestParseHelper>(JsonTestParseHelper* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<JsonTestParseHelper::SharedData>(JsonTestParseHelper::SharedData* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<JsonTestParseHelper::SharedData>(const JsonTestParseHelper::SharedData* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<JsonParseCoordinator>(JsonParseCoordinator* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<JsonParseCoordinator>(const JsonParseCoordinator* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<JsonParseCoordinator::SharedData>(JsonParseCoordinator::SharedData* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<JsonTableParseHelper::SharedData>(JsonTableParseHelper::SharedData* t)
	{
		t;
		return L"trash"s;
	}
	template<>
	inline std::wstring ToString<JsonTableParseHelper>(JsonTableParseHelper* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<FooFactory>(FooFactory* t)
	{
		t;
		return L"trash"s;
	}
	template<>
	inline std::wstring ToString<FooFactory>(const FooFactory* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<GameObject>(GameObject* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Avatar>(Avatar* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<ActionList>(const ActionList& t)
	{
		t;
		return L"trash"s;
	}
	template<>
	inline std::wstring ToString<ActionList>(ActionList* t)
	{
		t;
		return L"trash"s;
	}


	template<>
	inline std::wstring ToString<ActionListIf>(const ActionListIf& t)
	{
		t;
		return L"trash"s;
	}
	template<>
	inline std::wstring ToString<ActionListIf>(ActionListIf* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<ActionCreateAction>(const ActionCreateAction& t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<ActionCreateAction>(ActionCreateAction* t)
	{
		t;
		return L"trash"s;
	}
	template<>
	inline std::wstring ToString<ActionDestroyAction>(const ActionDestroyAction& t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<ActionDestroyAction>(ActionDestroyAction* t)
	{
		t;
		return L"trash"s;
	}
	template<>
	inline std::wstring ToString<ActionIncrement>(const ActionIncrement& t)
	{
		t;
		return L"trash"s;
	}
	template<>
	inline std::wstring ToString<ActionIncrement>(ActionIncrement* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Event<Foo>>(Event<Foo>* t)
	{
		t;
		return L"trash"s;
	}

	template<>
	inline std::wstring ToString<Event<EventEnqueFoo>>(Event<EventEnqueFoo>* t)
	{
		t;
		return L"trash"s;
	}

}

