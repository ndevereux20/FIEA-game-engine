#include "pch.h"
#include "Foo.h"
#include "RTTI.h"
#include "Scope.h"
#include "Datum.h"
#include "Attribute.h"
#include "Avatar.h"
#include "GameObject.h"
//#include "AttributedBar.h"
#include "ActionIncrement.h"


using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;


namespace UnitTestLibraryDesktop
{
	TEST_CLASS(GameObjectTests)
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

		TEST_METHOD(GameObjectRTTITests)
		{
			GameObject a;

			RTTI* rtti = &a;
			Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(GameObject::TypeIdClass()));
			Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
			Assert::AreEqual(GameObject::TypeIdClass(), rtti->TypeIdInstance());

			Foo* b = rtti->As<Foo>();
			Assert::IsNull(b);

			GameObject* f = rtti->As<GameObject>();
			Assert::IsNotNull(f);
			Assert::AreEqual(&a, f);

			Attribute* fAsAttributed = rtti->As<Attribute>();
			Assert::IsNotNull(fAsAttributed);
			Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

			GameObject otherGameObject;
			Assert::IsTrue(rtti->Equals(&otherGameObject));

			Foo otherB(10);
			Assert::IsFalse(rtti->Equals(&otherB));

			Assert::AreEqual("GameObject"s, rtti->ToString());
		}

		TEST_METHOD(AvatarRTTITests)
		{
			Avatar a;

			RTTI* rtti = &a;
			Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(Avatar::TypeIdClass()));
			Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
			Assert::AreEqual(Avatar::TypeIdClass(), rtti->TypeIdInstance());

			Foo* b = rtti->As<Foo>();
			Assert::IsNull(b);

			Avatar* f = rtti->As<Avatar>();
			Assert::IsNotNull(f);
			Assert::AreEqual(&a, f);

			Attribute* fAsAttributed = rtti->As<Attribute>();
			Assert::IsNotNull(fAsAttributed);
			Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

			Avatar otherAvatar;
			Assert::IsTrue(rtti->Equals(&otherAvatar));

			Foo otherB(10);
			Assert::IsFalse(rtti->Equals(&otherB));
		}

		TEST_METHOD(GameObjectAttributes)
		{
			GameObject gameObject;

			Assert::IsTrue(gameObject.IsAttribute("this"));
			Assert::IsTrue(gameObject.IsAttribute("Name"));
			Assert::IsTrue(gameObject.IsAttribute("Position"));
			Assert::IsTrue(gameObject.IsAttribute("Rotation"));
			Assert::IsTrue(gameObject.IsAttribute("Scale"));
			Assert::IsTrue(gameObject.IsAttribute("Children"));
			Assert::IsFalse(gameObject.IsAttribute("HitPoints"));

			Assert::IsTrue(gameObject.IsPrescribedAttribute("this"));
			Assert::IsTrue(gameObject.IsPrescribedAttribute("Name"));
			Assert::IsTrue(gameObject.IsPrescribedAttribute("Position"));
			Assert::IsTrue(gameObject.IsPrescribedAttribute("Rotation"));
			Assert::IsTrue(gameObject.IsPrescribedAttribute("Scale"));
			Assert::IsTrue(gameObject.IsPrescribedAttribute("Children"));
			Assert::IsFalse(gameObject.IsPrescribedAttribute("HitPoints"));

			Assert::IsFalse(gameObject.IsAuxiliaryAttribute("this"));
			Assert::IsFalse(gameObject.IsAuxiliaryAttribute("Name"));
			Assert::IsFalse(gameObject.IsAuxiliaryAttribute("Position"));
			Assert::IsFalse(gameObject.IsAuxiliaryAttribute("Rotation"));
			Assert::IsFalse(gameObject.IsAuxiliaryAttribute("Scale"));
			Assert::IsFalse(gameObject.IsAuxiliaryAttribute("Children"));
			Assert::IsFalse(gameObject.IsAuxiliaryAttribute("HitPoints"));

			Assert::AreEqual(&gameObject, gameObject["this"].Get<RTTI*>()->As<GameObject>());
		}

		TEST_METHOD(AvatarAttributes)
		{
			Avatar avatar;

			Assert::IsTrue(avatar.IsAttribute("this"));
			Assert::IsTrue(avatar.IsAttribute("Name"));
			Assert::IsTrue(avatar.IsAttribute("Position"));
			Assert::IsTrue(avatar.IsAttribute("Rotation"));
			Assert::IsTrue(avatar.IsAttribute("Scale"));
			Assert::IsTrue(avatar.IsAttribute("Children"));
			Assert::IsTrue(avatar.IsAttribute("HitPoints"));

			Assert::IsTrue(avatar.IsPrescribedAttribute("this"));
			Assert::IsTrue(avatar.IsPrescribedAttribute("Name"));
			Assert::IsTrue(avatar.IsPrescribedAttribute("Position"));
			Assert::IsTrue(avatar.IsPrescribedAttribute("Rotation"));
			Assert::IsTrue(avatar.IsPrescribedAttribute("Scale"));
			Assert::IsTrue(avatar.IsPrescribedAttribute("Children"));
			Assert::IsTrue(avatar.IsPrescribedAttribute("HitPoints"));

			Assert::IsFalse(avatar.IsAuxiliaryAttribute("this"));
			Assert::IsFalse(avatar.IsAuxiliaryAttribute("Name"));
			Assert::IsFalse(avatar.IsAuxiliaryAttribute("Position"));
			Assert::IsFalse(avatar.IsAuxiliaryAttribute("Rotation"));
			Assert::IsFalse(avatar.IsAuxiliaryAttribute("Scale"));
			Assert::IsFalse(avatar.IsAuxiliaryAttribute("Children"));
			Assert::IsFalse(avatar.IsAuxiliaryAttribute("HitPoints"));

			Assert::AreEqual(&avatar, avatar["this"].Get<RTTI*>()->As<Avatar>());
		}

		TEST_METHOD(AvatarTests)
		{
			AvatarFactory avatarFactory;
			ActionIncrementFactory actionIncrementFactory;
			GameTime gameTime;

			size_t avatarSize = 7;
			const string filename = "..\\..\\..\\..\\..\\source\\UnitTest.Library.Desktop\\TestGameObject.json";

			GameObject gameObject;
			JsonTableParseHelper::SharedData sharedData(gameObject);

			JsonTableParseHelper tableParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(tableParseHelper);

			parseCoordinator.Initialize();
			Assert::AreEqual(0_z, sharedData.Depth());
			parseCoordinator.ParseFromFile(filename);
			Assert::AreEqual(0_z, sharedData.Depth());

			Assert::IsTrue(gameObject.As<GameObject>()->IsPrescribedAttribute("this"));
			Assert::IsTrue(gameObject.As<GameObject>()->IsPrescribedAttribute("Name"));
			Assert::IsTrue(gameObject.As<GameObject>()->IsPrescribedAttribute("Position"));
			Assert::IsTrue(gameObject.As<GameObject>()->IsPrescribedAttribute("Rotation"));
			Assert::IsTrue(gameObject.As<GameObject>()->IsPrescribedAttribute("Scale"));
			Assert::IsTrue(gameObject.As<GameObject>()->IsPrescribedAttribute("Children"));
			Assert::IsFalse(gameObject.As<GameObject>()->IsPrescribedAttribute("HitPoints"));
			
			Datum* gameObjectDatum = gameObject.Find("Name");
			Assert::IsNotNull(gameObjectDatum);
			Assert::AreEqual(DatumTypes::String, gameObjectDatum->Type());
			Assert::AreEqual(size_t(1), gameObjectDatum->Size());
			Assert::AreEqual("Test GameObject"s, gameObjectDatum->Get<string>());
			
			gameObjectDatum = gameObject.Find("Position");
			Assert::IsNotNull(gameObjectDatum);
			Assert::AreEqual(DatumTypes::Vector, gameObjectDatum->Type());
			Assert::AreEqual(size_t(1), gameObjectDatum->Size());
			Assert::AreEqual(glm::vec4(1,0,0,0), gameObjectDatum->Get<vec4>());
			
			gameObjectDatum = gameObject.Find("Rotation");
			Assert::IsNotNull(gameObjectDatum);
			Assert::AreEqual(DatumTypes::Vector, gameObjectDatum->Type());
			Assert::AreEqual(size_t(1), gameObjectDatum->Size());
			Assert::AreEqual(glm::vec4(0, 1, 0, 0), gameObjectDatum->Get<vec4>());
			
			gameObjectDatum = gameObject.Find("Scale");
			Assert::IsNotNull(gameObjectDatum);
			Assert::AreEqual(DatumTypes::Vector, gameObjectDatum->Type());
			Assert::AreEqual(size_t(1), gameObjectDatum->Size());
			Assert::AreEqual(glm::vec4(1, 1, 1, 0), gameObjectDatum->Get<vec4>());

			gameObjectDatum = gameObject.Find("Children");
			Assert::IsNotNull(gameObjectDatum);
			Assert::AreEqual(DatumTypes::Table, gameObjectDatum->Type());
			Assert::AreEqual(size_t(1), gameObjectDatum->Size());
			
			Avatar& children = static_cast<Avatar&>(gameObjectDatum->operator[](0));
			Assert::AreEqual(size_t(1) + avatarSize, children.Size());
			Assert::AreEqual(&gameObject, static_cast<GameObject*>(children.GetParent()));

			Assert::IsTrue(children.As<Avatar>()->IsPrescribedAttribute("this"));
			Assert::IsTrue(children.As<Avatar>()->IsPrescribedAttribute("Name"));
			Assert::IsTrue(children.As<Avatar>()->IsPrescribedAttribute("Position"));
			Assert::IsTrue(children.As<Avatar>()->IsPrescribedAttribute("Rotation"));
			Assert::IsTrue(children.As<Avatar>()->IsPrescribedAttribute("Scale"));
			Assert::IsTrue(children.As<Avatar>()->IsPrescribedAttribute("Children"));
			Assert::IsTrue(children.As<Avatar>()->IsPrescribedAttribute("HitPoints"));

			Datum* nameDatum = children.Find("Name");
			Assert::IsNotNull(nameDatum);
			Assert::AreEqual(DatumTypes::String, nameDatum->Type());
			Assert::AreEqual("Cool Name"s, nameDatum->Get<string>());

			Datum* hitPointsDatum = children.Find("HitPoints");
			Assert::IsNotNull(hitPointsDatum);
			Assert::AreEqual(DatumTypes::Integer, hitPointsDatum->Type());
			Assert::AreEqual(100, hitPointsDatum->Get<int32_t>());

			Datum* positionDatum = children.Find("Position");
			Assert::IsNotNull(positionDatum);
			Assert::AreEqual(DatumTypes::Vector, positionDatum->Type());
			Assert::AreEqual(glm::vec4(0,0,0,0), positionDatum->Get<vec4>());

			Datum* rotationDatum = children.Find("Rotation");
			Assert::IsNotNull(rotationDatum);
			Assert::AreEqual(DatumTypes::Vector, rotationDatum->Type());
			Assert::AreEqual(glm::vec4(0, 0, 0, 0), rotationDatum->Get<vec4>());

			Datum* scaleDatum = children.Find("Scale");
			Assert::IsNotNull(scaleDatum);
			Assert::AreEqual(DatumTypes::Vector, scaleDatum->Type());
			Assert::AreEqual(glm::vec4(0, 0, 0, 0), scaleDatum->Get<vec4>());

			gameObjectDatum = children.Find("Children");
			Assert::IsNotNull(gameObjectDatum);
			Assert::AreEqual(DatumTypes::Table, gameObjectDatum->Type());
			Assert::AreEqual(size_t(0), gameObjectDatum->Size());

			//Actions 
			gameObjectDatum = gameObject.Find("Actions");
			Assert::IsNotNull(gameObjectDatum);
			Assert::AreEqual(DatumTypes::Table, gameObjectDatum->Type());
			Assert::AreEqual(size_t(1), gameObjectDatum->Size());

			ActionIncrement& action = static_cast<ActionIncrement&>(gameObjectDatum->operator[](0));
			Assert::AreEqual(size_t(1) + 3, action.Size());
			Assert::AreEqual(&gameObject, static_cast<GameObject*>(action.GetParent()));

			Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("this"));
			Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("Name"));
			Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("Target"));
			Assert::IsTrue(action.As<ActionIncrement>()->IsPrescribedAttribute("Step"));

			nameDatum = action.Find("Name");
			Assert::IsNotNull(nameDatum);
			Assert::AreEqual(DatumTypes::String, nameDatum->Type());
			Assert::AreEqual("Increment HitPoints"s, nameDatum->Get<string>());

			Datum* targetDatum = action.Find("Target");
			Assert::IsNotNull(targetDatum);
			Assert::AreEqual(DatumTypes::String, targetDatum->Type());
			Assert::AreEqual("Children.HitPoints"s, targetDatum->Get<string>());

			Datum* stepDatum = action.Find("Step");
			Assert::IsNotNull(stepDatum);
			Assert::AreEqual(DatumTypes::Float, stepDatum->Type());
			Assert::AreEqual(5.0f, stepDatum->Get<float>());

			action.Update(gameTime);
			Assert::AreEqual(105, hitPointsDatum->Get<int32_t>());
			action.Update(gameTime);
			Assert::AreEqual(110, hitPointsDatum->Get<int32_t>());
		}

		TEST_METHOD(UpdateAvatar)
		{
			// testing children's update 
			{
				AvatarFactory avatarFactory;
				ActionIncrementFactory actionIncrementFactory;
				const string filename = "..\\..\\..\\..\\..\\source\\UnitTest.Library.Desktop\\TestGameObject.json";

				GameTime gameTime;
				GameObject gameObject;
				JsonTableParseHelper::SharedData sharedData(gameObject);

				JsonTableParseHelper tableParseHelper;
				JsonParseCoordinator parseCoordinator(sharedData);
				parseCoordinator.AddHelper(tableParseHelper);

				parseCoordinator.Initialize();
				Assert::AreEqual(0_z, sharedData.Depth());
				parseCoordinator.ParseFromFile(filename);
				Assert::AreEqual(0_z, sharedData.Depth());

				Datum* gameObjectDatum = gameObject.Find("Children");
				Avatar& children = static_cast<Avatar&>(gameObjectDatum->operator[](0));
				children.Update(gameTime);
				Assert::AreEqual(99, children.HitPoints);
				children.Update(gameTime);
				Assert::AreEqual(98, children.HitPoints);
				children.Update(gameTime);
				Assert::AreEqual(97, children.HitPoints);
			}

			// checking that game object calls update on all of its children
			{
				AvatarFactory avatarFactory;
				ActionIncrementFactory actionIncrementFactory;
				const string filename = "..\\..\\..\\..\\..\\source\\UnitTest.Library.Desktop\\TestGameObject.json";

				GameTime gameTime;
				GameObject gameObject;
				JsonTableParseHelper::SharedData sharedData(gameObject);

				JsonTableParseHelper tableParseHelper;
				JsonParseCoordinator parseCoordinator(sharedData);
				parseCoordinator.AddHelper(tableParseHelper);

				parseCoordinator.Initialize();
				Assert::AreEqual(0_z, sharedData.Depth());
				parseCoordinator.ParseFromFile(filename);
				Assert::AreEqual(0_z, sharedData.Depth());

				Datum* gameObjectDatum = gameObject.Find("Children");
				Avatar& children = static_cast<Avatar&>(gameObjectDatum->operator[](0));
				gameObject.Update(gameTime);
				// - 1 from Avatars update, + 5 from action increment Update start 100
				Assert::AreEqual(104, children.HitPoints);
				gameObject.Update(gameTime);
				Assert::AreEqual(108, children.HitPoints);
				gameObject.Update(gameTime);
				Assert::AreEqual(112, children.HitPoints);
			}
		}

		TEST_METHOD(Clone)
		{
			{
				AvatarFactory avatarFactory;
				ActionIncrementFactory actionIncrementFactory;
				const string filename = "..\\..\\..\\..\\..\\source\\UnitTest.Library.Desktop\\TestGameObject.json";

				GameTime gameTime;
				GameObject gameObject;
				JsonTableParseHelper::SharedData sharedData(gameObject);

				JsonTableParseHelper tableParseHelper;
				JsonParseCoordinator parseCoordinator(sharedData);
				parseCoordinator.AddHelper(tableParseHelper);

				parseCoordinator.Initialize();
				Assert::AreEqual(0_z, sharedData.Depth());
				parseCoordinator.ParseFromFile(filename);
				Assert::AreEqual(0_z, sharedData.Depth());

				GameObject* clonedGameObject = gameObject.Clone();
				Assert::IsTrue(clonedGameObject->Equals(&gameObject));
				clonedGameObject->Name = "Cloned Name";
				Assert::IsFalse(clonedGameObject->Equals(&gameObject));
				delete clonedGameObject;

			}

			{
				AvatarFactory avatarFactory;
				ActionIncrementFactory actionIncrementFactory;
				const string filename = "..\\..\\..\\..\\..\\source\\UnitTest.Library.Desktop\\TestGameObject.json";

				GameTime gameTime;
				GameObject gameObject;
				JsonTableParseHelper::SharedData sharedData(gameObject);

				JsonTableParseHelper tableParseHelper;
				JsonParseCoordinator parseCoordinator(sharedData);
				parseCoordinator.AddHelper(tableParseHelper);

				parseCoordinator.Initialize();
				Assert::AreEqual(0_z, sharedData.Depth());
				parseCoordinator.ParseFromFile(filename);
				Assert::AreEqual(0_z, sharedData.Depth());

				Datum* gameObjectDatum = gameObject.Find("Children");
				Avatar& children = static_cast<Avatar&>(gameObjectDatum->operator[](0));

				Avatar* clonedAvatar = children.Clone();
				Assert::IsTrue(clonedAvatar->Equals(&children));

				clonedAvatar->Update(gameTime);
				Assert::IsFalse(clonedAvatar->Equals(&children));
				delete clonedAvatar;


			}
		}

		TEST_METHOD(TransformOperatorEqual)
		{
			Transform t1;
			Transform t2;
			Assert::IsTrue(t1 == t2);
			Assert::IsFalse(t1 != t2);
			t1.Position = glm::vec4(1,1,1,1);
			Assert::IsFalse(t1 == t2);
			Assert::IsTrue(t1 != t2);

		}

		TEST_METHOD(GameObjectOperatorEqual)
		{
			GameObject g1;
			GameObject g2; 
			Assert::IsTrue(g1 == g2);
			Assert::IsFalse(g1 != g2);
			g1.Transform.Position = glm::vec4(1, 1, 1, 1);
			Assert::IsFalse(g1 == g2);
			Assert::IsTrue(g1 != g2);
		}
		private:
			static _CrtMemState _startMemState;
	};
	_CrtMemState GameObjectTests::_startMemState;
}