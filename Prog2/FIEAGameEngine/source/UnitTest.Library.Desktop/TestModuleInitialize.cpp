#include "pch.h"
#include "AttributedFoo.h"
#include "AttributedBar.h"
#include "GameObject.h"
#include "Avatar.h"
#include "ActionList.h"
#include "ActionIncrement.h"
#include "ActionCreateAction.h"
#include "ActionDestroyAction.h"
#include "ActionListIf.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;

namespace UnitTestLibraryDesktop
{
	TEST_MODULE_INITIALIZE(TestModuleInitialize)
	{
		Registry::GetInstance().RegisterType<AttributedFoo, Attribute>();
		Registry::GetInstance().RegisterType<AttributedBar, AttributedFoo>();
		Registry::GetInstance().RegisterType<GameObject, Attribute>();
		Registry::GetInstance().RegisterType<Avatar, GameObject>();
		Registry::GetInstance().RegisterType<Action, Attribute>();
		Registry::GetInstance().RegisterType<ActionList, Action>();
		Registry::GetInstance().RegisterType<ActionIncrement, Action>();
		Registry::GetInstance().RegisterType<ActionDestroyAction, Action>();
		Registry::GetInstance().RegisterType<ActionCreateAction, Action>();
		Registry::GetInstance().RegisterType<ActionListIf, ActionList>();
	}

	TEST_MODULE_CLEANUP(TestModulueCleanup)
	{
		Registry::GetInstance().ClearRegistry();
	}
}
