#include "pch.h"
#include "Foo.h"
#include "RTTI.h"
#include "Scope.h"
#include "Datum.h"
#include "Attribute.h"
#include "AttributedFoo.h"
//#include "AttributedBar.h"


using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;


namespace UnitTestLibraryDesktop
{
	TEST_CLASS(AttributeTests)
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
			AttributedFoo a; 

			RTTI* rtti = &a;
			Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(AttributedFoo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(Attribute::TypeIdClass()));
			Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
			Assert::AreEqual(AttributedFoo::TypeIdClass(), rtti->TypeIdInstance());

			Foo* b = rtti->As<Foo>();
			Assert::IsNull(b);

			AttributedFoo* f = rtti->As<AttributedFoo>();
			Assert::IsNotNull(f);
			Assert::AreEqual(&a, f);

			Attribute* fAsAttributed = rtti->As<Attribute>();
			Assert::IsNotNull(fAsAttributed);
			Assert::AreEqual(static_cast<Attribute*>(&a), fAsAttributed);

			AttributedFoo otherFoo;
			Assert::IsTrue(rtti->Equals(&otherFoo));

			Foo otherB(10);
			Assert::IsFalse(rtti->Equals(&otherB));

			Assert::AreEqual("AttributedFoo"s, rtti->ToString());

		}

		TEST_METHOD(Attributes)
		{
			AttributedFoo foo; 

			Assert::IsTrue(foo.IsAttribute("this"));
			Assert::IsTrue(foo.IsAttribute("ExternalInteger"));
			Assert::IsTrue(foo.IsAttribute("ExternalFloat"));
			Assert::IsTrue(foo.IsAttribute("ExternalString"));
			Assert::IsTrue(foo.IsAttribute("ExternalVector"));
			Assert::IsTrue(foo.IsAttribute("ExternalMatrix"));
			Assert::IsTrue(foo.IsAttribute("ExternalIntegerArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalFloatArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalStringArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalVectorArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalMatrixArray"));
			Assert::IsTrue(foo.IsAttribute("NestedScope"));
			Assert::IsTrue(foo.IsAttribute("NestedScopeArray"));
			Assert::IsFalse(foo.IsAttribute("ExternalBarInt"));

			Assert::IsTrue(foo.IsPrescribedAttribute("this"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalInteger"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalFloat"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalString"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalVector"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalMatrix"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalIntegerArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalFloatArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalStringArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalVectorArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalMatrixArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("NestedScope"));
			Assert::IsTrue(foo.IsPrescribedAttribute("NestedScopeArray"));

			Assert::IsFalse(foo.IsAuxiliaryAttribute("this"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalInteger"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalFloat"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalString"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalVector"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalMatrix"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalIntegerArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalFloatArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalStringArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalVectorArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalMatrixArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("NestedScope"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("NestedScopeArray"));

			Assert::AreEqual(&foo, foo["this"].Get<RTTI*>()->As<AttributedFoo>());
		}

		TEST_METHOD(InheritFromAttributedFooTests)
		{
			AttributedBar foo;

			Assert::IsTrue(foo.IsAttribute("this"));
			Assert::IsTrue(foo.IsAttribute("ExternalInteger"));
			Assert::IsTrue(foo.IsAttribute("ExternalFloat"));
			Assert::IsTrue(foo.IsAttribute("ExternalString"));
			Assert::IsTrue(foo.IsAttribute("ExternalVector"));
			Assert::IsTrue(foo.IsAttribute("ExternalMatrix"));
			Assert::IsTrue(foo.IsAttribute("ExternalIntegerArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalFloatArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalStringArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalVectorArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalMatrixArray"));
			Assert::IsTrue(foo.IsAttribute("NestedScope"));
			Assert::IsTrue(foo.IsAttribute("NestedScopeArray"));
			Assert::IsTrue(foo.IsAttribute("ExternalBarInt"));

			Assert::IsTrue(foo.IsPrescribedAttribute("this"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalInteger"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalFloat"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalString"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalVector"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalMatrix"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalIntegerArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalFloatArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalStringArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalVectorArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalMatrixArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("NestedScope"));
			Assert::IsTrue(foo.IsPrescribedAttribute("NestedScopeArray"));
			Assert::IsTrue(foo.IsPrescribedAttribute("ExternalBarInt"));

			Assert::IsFalse(foo.IsAuxiliaryAttribute("this"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalInteger"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalFloat"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalString"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalVector"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalMatrix"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalIntegerArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalFloatArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalStringArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalVectorArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalMatrixArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("NestedScope"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("NestedScopeArray"));
			Assert::IsFalse(foo.IsAuxiliaryAttribute("ExternalBarInt"));

			Assert::AreEqual(&foo, foo["this"].Get<RTTI*>()->As<AttributedBar>());
		}

		TEST_METHOD(AuxiliaryAttributes)
		{
			AttributedFoo foo;
			foo.AppendAuxiliaryAttribute("AuxiliaryInteger");
			Assert::IsTrue(foo.IsAttribute("AuxiliaryInteger"));
			Assert::IsTrue(foo.IsAuxiliaryAttribute("AuxiliaryInteger"));
			Assert::IsFalse(foo.IsPrescribedAttribute("AuxiliaryInteger"));

			Assert::ExpectException<exception>([&foo] { foo.AppendAuxiliaryAttribute("ExternalInteger"); });
		}

		TEST_METHOD(ExternalAssignment)
		{
			AttributedFoo foo;

			Datum* datum = foo.Find("ExternalInteger");
			Assert::AreEqual(1_z, datum->Size());
			Assert::AreSame(datum->Get<int>(), foo.ExternalInteger);

			int a = 5;
			datum->Set(a);
			Assert::AreEqual(a, datum->Get<int>());
			Assert::AreEqual(a, foo.ExternalInteger);

		}

		TEST_METHOD(CopyConstructor)
		{
			AttributedFoo foo; 
			AttributedFoo anotherAttributedFoo = foo;

			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("this"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalInteger"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalFloat"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalString"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalVector"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalMatrix"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalIntegerArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalFloatArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalStringArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalVectorArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalMatrixArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("NestedScope"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("NestedScopeArray"));

			Assert::AreEqual(&anotherAttributedFoo, anotherAttributedFoo["this"].Get<RTTI*>()->As<AttributedFoo>());

			int& fooData = foo["ExternalInteger"].Get<int>();
			int& anotherFooData = anotherAttributedFoo["ExternalInteger"].Get<int>();
			Assert::AreNotSame(fooData, anotherFooData);
		}

		TEST_METHOD(CopyAssignment)
		{
			AttributedFoo foo;
			AttributedFoo anotherAttributedFoo;
			anotherAttributedFoo = foo;

			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("this"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalInteger"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalFloat"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalString"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalVector"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalMatrix"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalIntegerArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalFloatArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalStringArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalVectorArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("ExternalMatrixArray"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("NestedScope"));
			Assert::IsTrue(anotherAttributedFoo.IsPrescribedAttribute("NestedScopeArray"));

			Assert::AreEqual(&anotherAttributedFoo, anotherAttributedFoo["this"].Get<RTTI*>()->As<AttributedFoo>());

			int& fooData = foo["ExternalInteger"].Get<int>();
			int& anotherFooData = anotherAttributedFoo["ExternalInteger"].Get<int>();
			Assert::AreNotSame(fooData, anotherFooData);
		}

		TEST_METHOD(MoveConstructor)
		{
			AttributedFoo foo;

			size_t originalSize = foo.Size();
			Assert::AreNotEqual(0_z, originalSize);
			Assert::AreNotEqual(1_z, originalSize);

			foo.ExternalInteger = 1;
			foo.ExternalFloat = 2.0f;
			foo.ExternalString = "Hello"s;
			foo.ExternalVector = vec4(1, 2, 3, 4);
			foo.ExternalMatrix = mat4(-1);

			char helloWorld[14];
			strcpy_s(helloWorld, foo.ExternalString.c_str());
			string helloWorldString = helloWorld;
			Assert::AreEqual(helloWorldString, foo.ExternalString);

			int integerArray[] = {1, 2, 3, 4, 5};
			std::copy(std::begin(integerArray), std::end(integerArray), foo.ExternalIntegerArray);

			AttributedFoo anotherFoo = std::move(foo);
			Assert::AreEqual(originalSize, anotherFoo.Size());
			Assert::AreEqual(0_z, foo.Size());
			Assert::AreEqual(1, anotherFoo.ExternalInteger);
			Assert::AreEqual(2.0f, anotherFoo.ExternalFloat);
			Assert::AreEqual(helloWorldString, anotherFoo.ExternalString);
			Assert::AreNotSame(helloWorldString, anotherFoo.ExternalString);
			Assert::IsTrue(foo.ExternalString.empty());
			Assert::AreEqual(anotherFoo.ExternalVector, vec4(1, 2, 3, 4));
			Assert::AreEqual(anotherFoo.ExternalMatrix, mat4(-1));
			Assert::IsTrue(std::equal(std::begin(anotherFoo.ExternalIntegerArray), std::end(anotherFoo.ExternalIntegerArray), std::begin(integerArray)));
			Assert::AreEqual(&anotherFoo, anotherFoo["this"].Get<RTTI*>()->As<AttributedFoo>());
		}

		TEST_METHOD(MoveAssignment)
		{
			AttributedFoo foo;
			AttributedFoo anotherFoo;

			size_t originalSize = foo.Size();
			Assert::AreNotEqual(0_z, originalSize);
			Assert::AreNotEqual(1_z, originalSize);

			foo.ExternalInteger = 1;
			foo.ExternalFloat = 2.0f;
			foo.ExternalString = "Hello"s;
			foo.ExternalVector = vec4(1, 2, 3, 4);
			foo.ExternalMatrix = mat4(-1);

			char helloWorld[14];
			strcpy_s(helloWorld, foo.ExternalString.c_str());
			string helloWorldString = helloWorld;
			Assert::AreEqual(helloWorldString, foo.ExternalString);

			int integerArray[] = { 1, 2, 3, 4, 5 };
			std::copy(std::begin(integerArray), std::end(integerArray), foo.ExternalIntegerArray);

			anotherFoo = std::move(foo);
			Assert::AreEqual(originalSize, anotherFoo.Size());
			Assert::AreEqual(0_z, foo.Size());
			Assert::AreEqual(1, anotherFoo.ExternalInteger);
			Assert::AreEqual(2.0f, anotherFoo.ExternalFloat);
			Assert::AreEqual(helloWorldString, anotherFoo.ExternalString);
			Assert::AreNotSame(helloWorldString, anotherFoo.ExternalString);
			Assert::IsTrue(foo.ExternalString.empty());
			Assert::AreEqual(anotherFoo.ExternalVector, vec4(1, 2, 3, 4));
			Assert::AreEqual(anotherFoo.ExternalMatrix, mat4(-1));
			Assert::IsTrue(std::equal(std::begin(anotherFoo.ExternalIntegerArray), std::end(anotherFoo.ExternalIntegerArray), std::begin(integerArray)));
			Assert::AreEqual(&anotherFoo, anotherFoo["this"].Get<RTTI*>()->As<AttributedFoo>());
		}


	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState AttributeTests::_startMemState;
}