#include "pch.h"
#include "Slist.h"
#include "Foo.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;


namespace UnitTestLibraryDesktop
{


	TEST_CLASS(SlistTests)
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
			if(_CrtMemDifference(&diffMemState, &_startMemState, &endMemState))
			{
				_CrtMemDumpStatistics(&diffMemState);
				Assert::Fail(L"Memory Leaks!");
			}
#endif
		}
		TEST_METHOD(Constructor)
		{
			Slist<Foo> list;
			Assert::AreEqual((size_t)0, list.Size());

		}
		TEST_METHOD(Front)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };
			auto func = [&list] {list.Front(); };
			Assert::ExpectException<std::runtime_error>(func);

			list.PushFront(a);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(a, list.Back());
			list.PushFront(b); 
			Assert::AreEqual(b, list.Front());
			Assert::AreEqual(a, list.Back());

		}
		TEST_METHOD(Back)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			auto func = [&list] {list.Back(); };
			Assert::ExpectException<std::runtime_error>(func);

			list.PushFront(a);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(a, list.Back());
			list.PushBack(b);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(b, list.Back());
		}
		TEST_METHOD(Push_Front)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());
			list.PushFront(a);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(a, list.Back());
			Assert::AreEqual(size_t(1), list.Size());
			Assert::IsFalse(list.IsEmpty());
			list.PushFront(b);
			Assert::AreEqual(b, list.Front());
			Assert::AreEqual(a, list.Back());
			Assert::AreEqual(size_t(2), list.Size());
		}
		TEST_METHOD(Push_Back)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());
			list.PushBack(a);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(a, list.Back());
			Assert::AreEqual(size_t(1), list.Size());
			Assert::IsFalse(list.IsEmpty());
			list.PushBack(b);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(b, list.Back());
			Assert::AreEqual(size_t(2), list.Size());
		}
		TEST_METHOD(Pop_Front)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());
			list.PushFront(b);
			list.PushFront(a);

			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(b, list.Back());
			Assert::AreEqual(size_t(2), list.Size());

			list.PopFront();
			
			Assert::AreEqual(b, list.Front());
			list.PopFront();
			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());

			auto func = [&list] {list.Front(); };
			Assert::ExpectException<std::runtime_error>(func);
			auto func1 = [&list] {list.Back(); };
			Assert::ExpectException<std::runtime_error>(func1);

		}
		TEST_METHOD(Pop_Back)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());

			list.PushFront(b);
			list.PushFront(a);

			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(b, list.Back());
			Assert::AreEqual(size_t(2), list.Size());

			list.PopBack();
			Assert::AreEqual(a, list.Back());
			list.PopBack();
			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());

			auto func = [&list] {list.Back(); };
			Assert::ExpectException<std::runtime_error>(func);
			auto func1 = [&list] {list.Front(); };
			Assert::ExpectException<std::runtime_error>(func1);
		}
		TEST_METHOD(Is_Empty)
		{
			Slist<Foo> list;
			Foo a{ 1 };

			Assert::IsTrue(list.IsEmpty());
			list.PushFront(a);
			Assert::IsFalse(list.IsEmpty());
		}

		TEST_METHOD(Size)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreEqual((size_t)0, list.Size());
			list.PushFront(a);
			Assert::AreEqual((size_t)1, list.Size());
			list.PushBack(b); 
			Assert::AreEqual((size_t)2, list.Size());
			list.PopBack();
			Assert::AreEqual((size_t)1, list.Size());
			list.PopFront();
			Assert::AreEqual((size_t)0, list.Size());

			list.PushFront(a);
			list.PushFront(b);
			list.Clear();
			Assert::AreEqual((size_t)0, list.Size());
		}
		TEST_METHOD(Clear)
		{
			Slist<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			list.PushFront(a);
			list.PushFront(b);
			Assert::AreEqual((size_t)2, list.Size());
			list.Clear();
			Assert::AreEqual((size_t)0, list.Size());

		}

		TEST_METHOD(Iterator)
		{
			{
				Slist<Foo> list;
				Assert::AreEqual(list.begin(), list.end());
				
				Foo a(10);
				list.PushBack(a);
				Assert::AreNotEqual(list.end(), list.begin());
			}
			{
				Foo a(1);
				Foo b(2);
				Foo c(3);
				Slist<Foo> list{a, b, c };
			
				size_t count = 0;
				for (auto it = list.begin(); it != list.end(); ++it)
				{
					++count;
				}
				Assert::AreEqual(list.Size(), count);

				count = 0;
				for (const Foo& value : list)
				{
					value;
					count++;
				}
				Assert::AreEqual(list.Size(), count);
			}
			
		}

		TEST_METHOD(ConstIterator)
		{
			Foo a(1);
			Foo b(2);
			Foo c(3);
			const Slist<Foo> list{ a, b, c };

			size_t count = 0;
			for (auto it = list.begin(); it != list.end(); ++it)
			{
				++count;
			}
			Assert::AreEqual(list.Size(), count);

			count = 0;
			for (const Foo& value : list)
			{
				value;
				count++;
			}
			Assert::AreEqual(list.Size(), count);
		}

		TEST_METHOD(CendCbegin)
		{
			Foo a(1);
			Foo b(2);
			Foo c(3);
			Slist<Foo> list{ a, b, c };

			Assert::AreEqual(a, *list.cbegin());
			size_t count = 0; 
			for (auto it = list.cbegin(); it != list.cend(); ++it)
			{
				++count;
			}
			Assert::AreEqual(list.Size(), count);
		}

		TEST_METHOD(IteratorIncrement)
		{
			Assert::ExpectException<runtime_error>([] {Slist<Foo>::Iterator it; ++it; });
		}

		TEST_METHOD(IteratorDereference)
		{
			Assert::ExpectException<runtime_error>([] {Slist<Foo>::Iterator it; *it; });
		}

		TEST_METHOD(ConstIteratorIncrement)
		{
			Assert::ExpectException<runtime_error>([] {Slist<Foo>::ConstIterator it; ++it; });
		}

		TEST_METHOD(ConstIteratorDereference)
		{
			Assert::ExpectException<runtime_error>([] {Slist<Foo>::ConstIterator it; *it; });
		}

		TEST_METHOD(Find)
		{
			Foo a(1);
			Foo b(2);
			Foo c(3);
			Foo d(4);
			Slist<Foo> list{ a, b, c };

			Slist<Foo>::Iterator it = list.Find(a);
			Assert::AreEqual(*it, a);

			Slist<Foo>::ConstIterator it2 = list.Find(a);
			Assert::AreEqual(*it2, a);

		}

		TEST_METHOD(InsertAfter)
		{
			Foo a(1);
			Foo b(2); 
			Foo c(3);
			Slist<Foo> list;
			Slist<Foo>::Iterator it = list.begin();
			
			list.InsertAfter(a, it);
			it = list.begin();
			Assert::AreEqual(*it, a);
		
			list.InsertAfter(b, it);
			list.InsertAfter(c, it);
			
			Assert::AreEqual(list.Front(), a);
			Assert::AreEqual(list.Back(), b);
			Assert::AreEqual(list.Size(), size_t(3));
		}

		TEST_METHOD(Remove)
		{
			// remove from front
			{
				Foo a(1);
				Foo b(2);
				Foo c(3);
				Slist<Foo> list{a, b, c};
				Slist<Foo>::Iterator it = list.begin();
				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				list.Remove(a, it);
				Assert::AreEqual(list.Front(), b);
				Assert::AreEqual(list.Back(), c);
			}
			// remove from back
			{
				Foo a(1);
				Foo b(2);
				Foo c(3);
				Slist<Foo> list{ a, b, c };
				Slist<Foo>::Iterator it = list.begin();
				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				list.Remove(c, it);
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), b);
			}
			// remove from middle
			{
				Foo a(1);
				Foo b(2);
				Foo c(3);
				Slist<Foo> list{ a, b, c };
				Slist<Foo>::Iterator it = list.begin();
				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				list.Remove(b, it);
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
			}
			{
				Foo a(1);
				Foo b(2);
				Foo c(3);
				Slist<Foo> list{ a, b, c };
				Slist<Foo>::Iterator it = list.Find(b);

				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				list.Remove(it);
				Assert::AreEqual(list.Size(), size_t(2));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);

			}
		}

		TEST_METHOD(ConstIteratorTypeCast)
		{
			Foo a(10);
			Foo b(20);
			Foo c(30);

			Slist<Foo> list1{a, b, c};

			Slist<Foo>::Iterator it1 = list1.begin();
			Slist<Foo>::ConstIterator it2(it1);

			
		}

	private:
		static _CrtMemState _startMemState;
	};

	_CrtMemState SlistTests::_startMemState;
}
