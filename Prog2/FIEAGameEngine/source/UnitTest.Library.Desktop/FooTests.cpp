#include "pch.h"
#include "Foo.h"


using namespace Microsoft::VisualStudio::CppUnitTestFramework;


namespace UnitTestLibraryDesktop
{

	TEST_CLASS(FooTests)
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
			Foo a{ 1 };
			Assert::AreEqual(1, a.Data());
		}

		TEST_METHOD(Data)
		{
			Foo a{ 1 };
			Assert::AreEqual(1, a.Data());

			std::int32_t& data = a.Data();
			Assert::AreEqual(data, 1);
		}

		TEST_METHOD(AssignemtnOperator)
		{
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreNotSame(a, b);
			Assert::IsTrue(a != b);
			Assert::AreNotEqual(a.Data(), b.Data());
			b = a; 
			Assert::IsTrue(a == b);
			Assert::AreEqual(a.Data(), b.Data());
		}
		TEST_METHOD(CopyConstructor)
		{
			Foo a{ 1 };
			Foo b = a;
			Assert::IsTrue(a == b);
			Assert::AreEqual(a.Data(), b.Data());
			Assert::AreNotSame(a, b);
		}
		TEST_METHOD(BooleanChecks)
		{
			Foo a{ 1 };
			Foo b{ 2 };
			Assert::IsTrue(a == a);
			Assert::IsTrue(a != b);
			Assert::IsFalse(a != a);
			Assert::IsFalse(a == b);
		}
	private:
		static _CrtMemState _startMemState;
	};

	_CrtMemState FooTests::_startMemState;
}
