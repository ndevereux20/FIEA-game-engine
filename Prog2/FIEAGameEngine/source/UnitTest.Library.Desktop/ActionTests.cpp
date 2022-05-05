#include "pch.h"
#include "JsonParseCoordinator.h"
#include "IJsonParseHelper.h"
#include "JsonTableParseHelper.h"
#include "Foo.h"
#include <fstream>
#include "AttributedFoo.h"
#include "Action.h"
#include "ActionIncrement.h"
#include "ActionList.h"
#include "ActionCreateAction.h"
#include "GameState.h"
#include "ActionListIf.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;
using namespace std::string_literals;


namespace UnitTestLibraryDesktop
{
	TEST_CLASS(ActionTests)
	{
	public:

		TEST_METHOD_INITIALIZE(Initialize)
		{
#if defined(_DEBUG)
			_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF);
			_CrtMemCheckpoint(&_startMemState);
#endif
		}

		TEST_METHOD_CLEANUP(Cleanup)
		{
#if defined(_DEBUG)
			_CrtMemState endMemState, diffMemState;
			_CrtMemCheckpoint(&endMemState);
			if (_CrtMemDifference(&diffMemState, &_startMemState, &endMemState))
			{
				_CrtMemDumpStatistics(&diffMemState);
				Assert::Fail(L"Memory Leaks!");
			}
#endif
		}

		TEST_METHOD(RTTITests)
		{
			{
				ActionList a;

				RTTI* rtti = &a;
				Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
				Assert::IsTrue(rtti->Is(ActionList::TypeIdClass()));
				Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
				Assert::AreEqual(ActionList::TypeIdClass(), rtti->TypeIdInstance());

				Foo* b = rtti->As<Foo>();
				Assert::IsNull(b);

				ActionList* f = rtti->As<ActionList>();
				Assert::IsNotNull(f);
				Assert::AreEqual(&a, f);

				Attribute* fAsAttributed = rtti->As<Attribute>();
				Assert::IsNotNull(fAsAttributed);
				Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

				ActionList otherAction;
				Assert::IsTrue(rtti->Equals(&otherAction));

				Foo otherB(10);
				Assert::IsFalse(rtti->Equals(&otherB));

				Assert::AreEqual("ActionList"s, rtti->ToString());
			}

			{
				ActionIncrement a;

				RTTI* rtti = &a;
				Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
				Assert::IsTrue(rtti->Is(ActionIncrement::TypeIdClass()));
				Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
				Assert::AreEqual(ActionIncrement::TypeIdClass(), rtti->TypeIdInstance());

				Foo* b = rtti->As<Foo>();
				Assert::IsNull(b);

				ActionIncrement* f = rtti->As<ActionIncrement>();
				Assert::IsNotNull(f);
				Assert::AreEqual(&a, f);

				Attribute* fAsAttributed = rtti->As<Attribute>();
				Assert::IsNotNull(fAsAttributed);
				Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

				ActionIncrement otherAction;
				Assert::IsTrue(rtti->Equals(&otherAction));

				Foo otherB(10);
				Assert::IsFalse(rtti->Equals(&otherB));

				Assert::AreEqual("ActionIncrement"s, rtti->ToString());
			}

			{
				ActionDestroyAction a;

				RTTI* rtti = &a;
				Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
				Assert::IsTrue(rtti->Is(ActionDestroyAction::TypeIdClass()));
				Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
				Assert::AreEqual(ActionDestroyAction::TypeIdClass(), rtti->TypeIdInstance());

				Foo* b = rtti->As<Foo>();
				Assert::IsNull(b);

				ActionDestroyAction* f = rtti->As<ActionDestroyAction>();
				Assert::IsNotNull(f);
				Assert::AreEqual(&a, f);

				Attribute* fAsAttributed = rtti->As<Attribute>();
				Assert::IsNotNull(fAsAttributed);
				Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

				ActionDestroyAction otherAction;
				Assert::IsTrue(rtti->Equals(&otherAction));

				Foo otherB(10);
				Assert::IsFalse(rtti->Equals(&otherB));

				Assert::AreEqual("ActionDestroyAction"s, rtti->ToString());
			}

			{
				ActionCreateAction a;

				RTTI* rtti = &a;
				Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
				Assert::IsTrue(rtti->Is(ActionCreateAction::TypeIdClass()));
				Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
				Assert::AreEqual(ActionCreateAction::TypeIdClass(), rtti->TypeIdInstance());

				Foo* b = rtti->As<Foo>();
				Assert::IsNull(b);

				ActionCreateAction* f = rtti->As<ActionCreateAction>();
				Assert::IsNotNull(f);
				Assert::AreEqual(&a, f);

				Attribute* fAsAttributed = rtti->As<Attribute>();
				Assert::IsNotNull(fAsAttributed);
				Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

				ActionCreateAction otherAction;
				Assert::IsTrue(rtti->Equals(&otherAction));

				Foo otherB(10);
				Assert::IsFalse(rtti->Equals(&otherB));

				Assert::AreEqual("ActionCreateAction"s, rtti->ToString());
			}

			{
				ActionListIf a;

				RTTI* rtti = &a;
				Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
				Assert::IsTrue(rtti->Is(ActionListIf::TypeIdClass()));
				Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
				Assert::AreEqual(ActionListIf::TypeIdClass(), rtti->TypeIdInstance());

				Foo* b = rtti->As<Foo>();
				Assert::IsNull(b);

				ActionListIf* f = rtti->As<ActionListIf>();
				Assert::IsNotNull(f);
				Assert::AreEqual(&a, f);

				Attribute* fAsAttributed = rtti->As<Attribute>();
				Assert::IsNotNull(fAsAttributed);
				Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

				ActionListIf otherAction;
				Assert::IsTrue(rtti->Equals(&otherAction));

				Foo otherB(10);
				Assert::IsFalse(rtti->Equals(&otherB));

				Assert::AreEqual("ActionListIf"s, rtti->ToString());
			}
		}
		TEST_METHOD(AttributesTest)
		{
			{
				ActionList action;

				Assert::IsTrue(action.As<ActionList>()->IsPrescribedAttribute("this"));
				Assert::IsTrue(action.As<ActionList>()->IsPrescribedAttribute("Name"));
				Assert::IsTrue(action.As<ActionList>()->IsPrescribedAttribute("Actions"));
				Assert::AreEqual(3_z, action.PrescibedSize());

				Assert::AreEqual(&action, action["this"].Get<RTTI*>()->As<ActionList>());
			}

			{
				ActionListIf action;

				Assert::IsTrue(action.As<ActionListIf>()->IsPrescribedAttribute("this"));
				Assert::IsTrue(action.As<ActionListIf>()->IsPrescribedAttribute("Name"));
				Assert::IsTrue(action.As<ActionListIf>()->IsPrescribedAttribute("Actions"));
				Assert::IsTrue(action.As<ActionListIf>()->IsPrescribedAttribute("Condition"));
				Assert::AreEqual(4_z, action.PrescibedSize());

				Assert::AreEqual(&action, action["this"].Get<RTTI*>()->As<ActionListIf>());
			}

			{
				ActionIncrement action;

				Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("this"));
				Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("Name"));
				Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("Target"));
				Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("Step"));
				Assert::AreEqual(4_z, action.PrescibedSize());

				Assert::AreEqual(&action, action["this"].Get<RTTI*>()->As<ActionIncrement>());
			}

			{
				ActionDestroyAction action;

				Assert::IsTrue(action.As<ActionDestroyAction>()->IsPrescribedAttribute("this"));
				Assert::IsTrue(action.As<ActionDestroyAction>()->IsPrescribedAttribute("Name"));
				Assert::IsTrue(action.As<ActionDestroyAction>()->IsPrescribedAttribute("ActionToDestroy"));
				Assert::AreEqual(3_z, action.PrescibedSize());

				Assert::AreEqual(&action, action["this"].Get<RTTI*>()->As<ActionDestroyAction>());
			}

			{
				ActionCreateAction action;

				Assert::IsTrue(action.As<ActionCreateAction>()->IsPrescribedAttribute("this"));
				Assert::IsTrue(action.As<ActionCreateAction>()->IsPrescribedAttribute("Name"));
				Assert::IsTrue(action.As<ActionCreateAction>()->IsPrescribedAttribute("Prototype"));
				Assert::AreEqual(3_z, action.PrescibedSize());

				Assert::AreEqual(&action, action["this"].Get<RTTI*>()->As<ActionCreateAction>());
			}
		}
		TEST_METHOD(Update)
		{
			ActionIncrementFactory actionIncrementFactory;
			ActionList action;

			const string aKey = "A"s;
			Datum& aDatum = action.AppendAuxiliaryAttribute(aKey) = 0;

			auto nestedAction = action.CreateAction(ActionIncrement::TypeName() , "Increment Action"s );
			Assert::IsNotNull(nestedAction);
			auto actionIncrement = nestedAction->As<ActionIncrement>();
			Assert::IsNotNull(actionIncrement);

			actionIncrement->SetTarget(aKey);
			Assert::AreEqual(aKey, actionIncrement->GetTarget());
			Assert::AreEqual(1.0f, actionIncrement->Step);
			Assert::AreEqual(0, aDatum.Get<int32_t>());

			GameTime gameTime;
			action.Update(gameTime);
			Assert::AreEqual(1, aDatum.Get<int32_t>());
			action.Update(gameTime);
			Assert::AreEqual(2, aDatum.Get<int32_t>());
			action.Update(gameTime);
			Assert::AreEqual(3, aDatum.Get<int32_t>());

			actionIncrement->SetTarget("B"s);
			Assert::ExpectException<exception>( [actionIncrement, &gameTime] {actionIncrement->Update(gameTime); });

			Datum& b = actionIncrement->AppendAuxiliaryAttribute("B"s);
			b = "This cannot be incremented"s;
			Assert::ExpectException<exception>([actionIncrement, &gameTime] {actionIncrement->Update(gameTime); });
		}

		TEST_METHOD(CloneAndEquals)
		{
			{
				ActionList action;
				ActionIncrement actionIncrement;
				action.Name = "Test Action";

				auto clone = action.Clone();
				Assert::AreNotSame(action, *clone);
				Assert::AreEqual(action, *clone);

				Assert::IsFalse(action.Equals(&actionIncrement));

				delete clone;
			}

			{
				ActionListIf action;
				ActionCreateAction actionCreateAction;
				action.Name = "Test Action";

				auto clone = action.Clone();
				Assert::AreNotSame(action, *clone);
				Assert::AreEqual(action, *clone);

				
				Assert::IsFalse(action.Equals(&actionCreateAction));

				delete clone;
			}

			{
				ActionCreateAction action;
				ActionDestroyAction actionDestroyAction;
				action.Name = "Test Action";

				auto clone = action.Clone();
				Assert::AreNotSame(action, *clone);
				Assert::AreEqual(action, *clone);

				
				Assert::IsFalse(action.Equals(&actionDestroyAction));

				delete clone;
			}

			{
				ActionDestroyAction action;
				ActionIncrement actionIncrement;
				action.Name = "Test Action";

				auto clone = action.Clone();
				Assert::AreNotSame(action, *clone);
				Assert::AreEqual(action, *clone);

				
				Assert::IsFalse(action.Equals(&actionIncrement));

				delete clone;
			}

			{
				ActionIncrement action;
				ActionList actionList;
				action.Name = "Test Action";

				auto clone = action.Clone();
				Assert::AreNotSame(action, *clone);
				Assert::AreEqual(action, *clone);

				
				Assert::IsFalse(action.Equals(&actionList));

				delete clone;
			}
		}

		TEST_METHOD(ActionDestroyActionTests)
		{
			GameObject gameObject;

			Datum& health = gameObject.Append("Health");
			health = 10;
			GameState gameState;
			GameTime gameTime;
			ActionDestroyActionFactory actionDestroActionFactory;
			ActionIncrementFactory actionIncrementFactory;
			ActionListFactory actionListFactory;

			auto nestedActionList = gameObject.CreateAction(ActionList::TypeName(), "Action List"s);
			Assert::IsNotNull(nestedActionList);
			ActionList* actionList = nestedActionList->As<ActionList>();
			Assert::IsNotNull(actionList);

			auto nestedScope = actionList->CreateAction(ActionDestroyAction::TypeName(), "Action Destroy Action"s);
			Assert::IsNotNull(nestedScope);
			ActionDestroyAction* actionDestroy = nestedScope->As<ActionDestroyAction>();
			Assert::IsNotNull(actionDestroy);

			actionDestroy->ActionToDestroy = "Increment Action";
			Assert::AreEqual("Increment Action"s, actionDestroy->ActionToDestroy);

			auto nestedAction = actionList->CreateAction(ActionIncrement::TypeName(), "Increment Action"s);
			Assert::IsNotNull(nestedAction);
			auto actionIncrement = nestedAction->As<ActionIncrement>();
			Assert::IsNotNull(actionIncrement);


			auto nestedAction2 = actionList->CreateAction(ActionIncrement::TypeName(), "Increment Action 2"s);
			Assert::IsNotNull(nestedAction2);
			auto actionIncrement2 = nestedAction2->As<ActionIncrement>();
			Assert::IsNotNull(actionIncrement2);

			Datum* actionDatum = actionList->Find("Actions");
			ActionIncrement* actionIncrement1 = actionDatum->operator[](1).As<ActionIncrement>();
			actionIncrement1->SetTarget("Health");

			ActionIncrement* actionIncrement3 = actionDatum->operator[](2).As<ActionIncrement>();
			actionIncrement3->SetTarget("Health");

			Assert::IsNotNull(actionDatum);
			Assert::AreEqual(3_z, actionDatum->Size());
			gameState.DestroyPending();
			Assert::AreEqual(3_z, actionDatum->Size());

			actionList->Update(gameTime);
			Assert::AreEqual(3_z, actionDatum->Size());

			gameState.DestroyPending();
			Assert::AreEqual(2_z, actionDatum->Size());

			actionDestroy->ActionToDestroy = "Increment Action 2";

			actionList->Update(gameTime);
			Assert::AreEqual(2_z, actionDatum->Size());

			gameState.DestroyPending();
			Assert::AreEqual(1_z, actionDatum->Size());

		}

		TEST_METHOD(ActionCreateActionTests)
		{
			GameState gameState;
			GameTime gameTime;
			ActionIncrementFactory actionIncrementFactory;
			ActionCreateActionFactory actionCreateActionFactory;
			ActionList actionList;

			auto nestedAction = actionList.CreateAction(ActionCreateAction::TypeName(), "Action Create Action"s);
			Assert::IsNotNull(nestedAction);
			ActionCreateAction* actionCreate = nestedAction->As<ActionCreateAction>();
			Assert::IsNotNull(actionCreate);

			actionCreate->Prototype = ActionIncrement::TypeName();
			Assert::AreEqual("ActionIncrement"s, actionCreate->Prototype);
			actionCreate->Name = "Action Increment";
			Assert::AreEqual("Action Increment"s, actionCreate->Name);

			Datum* actionDatum = actionList.Find("Actions");
			Assert::IsNotNull(actionDatum);
			Assert::AreEqual(1_z, actionDatum->Size());
			gameState.AddPending();
			Assert::AreEqual(1_z, actionDatum->Size());

			actionList.Update(gameTime);
			Assert::AreEqual(1_z, actionDatum->Size());

			gameState.AddPending();
			Assert::AreEqual(2_z, actionDatum->Size());
			ActionIncrement* actionIncrement = actionDatum->operator[](1).As<ActionIncrement>();
			Assert::IsNotNull(actionIncrement);
			Assert::AreEqual("Action Increment"s, actionIncrement->Name);

			gameState.AddPending();
			Assert::AreEqual(2_z, actionDatum->Size());
		}

		TEST_METHOD(JsonDeserialization)
		{
			ActionList actionList;
			{
				ActionListFactory actionListFactory;
				ActionIncrementFactory actionIncrementFactory;
				ActionListIfFactory actionListIfFactory;
				

				//change file path
				const string filename = "..\\..\\..\\..\\..\\source\\UnitTest.Library.Desktop\\TestActionJson.json";

				JsonTableParseHelper::SharedData sharedData(actionList);

				JsonTableParseHelper tableParseHelper;
				JsonParseCoordinator parseCoordinator(sharedData);
				parseCoordinator.AddHelper(tableParseHelper);

				parseCoordinator.Initialize();
				Assert::AreEqual(0_z, sharedData.Depth());
				parseCoordinator.ParseFromFile(filename);
				Assert::AreEqual(0_z, sharedData.Depth());

				

			}

			Assert::AreEqual("Test Action"s, actionList.Name);

			auto& actionsDatum = *actionList.Find("Actions"s);
			Assert::AreEqual(3_z, actionsDatum.Size());
			for (size_t i = 0; i < actionsDatum.Size(); ++i)
			{
				Action* action = actionsDatum[i].As<Action>();
				Assert::IsNotNull(action);
				stringstream name;
				name << "Nested Action " << (i + 1);
				Assert::AreEqual(name.str(), action->Name);
			}

			ActionList& nestedActionList = *(actionsDatum[1].As<ActionList>());
			auto& nestedActionListActionsDatum = *nestedActionList.Find("Actions"s);
			Assert::AreEqual(3_z, nestedActionListActionsDatum.Size());
			for (size_t i = 0; i < nestedActionListActionsDatum.Size(); ++i)
			{
				Action* action = nestedActionListActionsDatum[i].As<Action>();
				Assert::IsNotNull(action);
				stringstream name;
				name << "Nested Nested Action " << (i + 1);
				Assert::AreEqual(name.str(), action->Name);
			}

			{
				auto action = nestedActionListActionsDatum[2].As<ActionListIf>();
				Assert::IsNotNull(action);
				ActionListIf& actionListIf = *action;
				Assert::AreEqual(1, actionListIf.GetCondition());
			}

		}
		TEST_METHOD(TestActionListIf)
		{
			GameTime gameTime;
			//GameState gameState;
			ActionListIf actionListIf;
			Datum& a = actionListIf.AppendAuxiliaryAttribute("A"s);
			a = 0;
			Datum& b = actionListIf.AppendAuxiliaryAttribute("B"s);
			b = 0.0f;

			ActionIncrementFactory actionIncrementFactory;
			Scope* trueClause = actionListIf.CreateAction(ActionIncrement::TypeName(), "True Clause"s);
			Assert::IsNotNull(trueClause);
			ActionIncrement* aIncrement = trueClause->As<ActionIncrement>();
			Assert::IsNotNull(aIncrement);
			aIncrement->SetTarget("A"s);

			Scope* falseClause = actionListIf.CreateAction(ActionIncrement::TypeName(), "False Clause"s);
			Assert::IsNotNull(trueClause);
			ActionIncrement* bIncrement = falseClause->As<ActionIncrement>();
			Assert::IsNotNull(bIncrement);
			bIncrement->SetTarget("B"s);

			{
				//True clause 
				actionListIf.SetCondition(true);
				actionListIf.Update(gameTime);
				Assert::AreEqual(1, a.Get<int>());
				Assert::AreEqual(0.f, b.Get<float>());

				actionListIf.Update(gameTime);
				Assert::AreEqual(2, a.Get<int>());
				Assert::AreEqual(0.f, b.Get<float>());

				actionListIf.Update(gameTime);
				Assert::AreEqual(3, a.Get<int>());
				Assert::AreEqual(0.f, b.Get<float>());
			}

			{
				//False clause 
				actionListIf.SetCondition(false);
				actionListIf.Update(gameTime);
				Assert::AreEqual(1.f, b.Get<float>());
				Assert::AreEqual(3, a.Get<int>());

				actionListIf.Update(gameTime);
				Assert::AreEqual(2.f, b.Get<float>());
				Assert::AreEqual(3, a.Get<int>());

				actionListIf.Update(gameTime);
				Assert::AreEqual(3.f, b.Get<float>());
				Assert::AreEqual(3, a.Get<int>());
			}

			bIncrement->SetTarget("C"s);
			Assert::ExpectException<exception>([&actionListIf, &gameTime] { actionListIf.Update(gameTime); });

			auto clonedScope = actionListIf.Clone();
			Assert::IsNotNull(clonedScope);
			auto clone = clonedScope->As<ActionListIf>();
			Assert::IsNotNull(clone);
			Assert::AreEqual(actionListIf, *clone);
			delete clone;

		}

		TEST_METHOD(GameObjectActions)
		{
			GameObject gameObject;

			Datum& health = gameObject.Append("Health");
			health = 10;
			//GameState gameState;
			GameTime gameTime;
			ActionListFactory actionListFactory;

			auto nestedActionList = gameObject.CreateAction(ActionList::TypeName(), "Action List"s);
			Assert::IsNotNull(nestedActionList);
			ActionList* actionList = nestedActionList->As<ActionList>();
			Assert::IsNotNull(actionList);

			const Datum* gameObjectActions = gameObject.Actions();
			Assert::IsNotNull(gameObjectActions);
			Assert::AreEqual(DatumTypes::Table, gameObjectActions->Type());
			Assert::AreEqual(size_t(1), gameObjectActions->Size());

			ActionList& action = static_cast<ActionList&>(gameObjectActions->operator[](0));
			Assert::AreEqual(3_z, action.Size());
			Assert::AreEqual(&gameObject, static_cast<GameObject*>(action.GetParent()));

			Assert::IsTrue(action.As<ActionList>()->IsPrescribedAttribute("this"));
			Assert::IsTrue(action.As<ActionList>()->IsPrescribedAttribute("Name"));
			Assert::IsTrue(action.As<ActionList>()->IsPrescribedAttribute("Actions"));
			
		}

	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState ActionTests::_startMemState;
}