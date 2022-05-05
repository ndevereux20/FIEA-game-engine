#pragma once
#include "pch.h"
#include "Foo.h"
#include "RTTI.h"


using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;


namespace UnitTestLibraryDesktop
{
	TEST_CLASS(FacoryTests)
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

		TEST_METHOD(Constructor)
		{
			Assert::AreEqual(0_z, Factory<RTTI>::Size());

		}

		TEST_METHOD(AddAndRemoveType)
		{
			const Factory<RTTI>* foundFactory = Factory<RTTI>::Find("Foo"s);
			Assert::IsNull(foundFactory);

			{
				const FooFactory fooFactory; 
				Assert::AreEqual(1_z, Factory<RTTI>::Size());
				foundFactory = Factory<RTTI>::Find("Foo"s);
				Assert::AreEqual(&fooFactory, static_cast<const FooFactory*>(foundFactory));

			}

			Assert::AreEqual(0_z, Factory<RTTI>::Size());
			foundFactory = Factory<RTTI>::Find("Foo"s);
			Assert::IsNull(foundFactory);
		}
		TEST_METHOD(ProductCreation)
		{
			RTTI* rtti = Factory<RTTI>::Create("Foo"s);
			Assert::IsNull(rtti);

			{
				FooFactory foofactory; 

				rtti = Factory<RTTI>::Create("Foo"s);
				Assert::IsNotNull(rtti);

				Foo* foo = rtti->As<Foo>();
				Assert::IsNotNull(foo);

				delete foo;
			}

			rtti = Factory<RTTI>::Create("Foo"s);
			Assert::IsNull(rtti);

		}
	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState FacoryTests::_startMemState;
}