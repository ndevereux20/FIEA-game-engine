#include "pch.h"
#include "Vector.h"
#include "Foo.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;


namespace UnitTestLibraryDesktop
{


	TEST_CLASS(VectorTests)
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
			Vector<Foo> list;
			Assert::AreEqual((size_t)0, list.Size());

		}

		TEST_METHOD(Assignment)
		{
			Foo a(1);
			Foo b(2);
			Foo c(3);
			Vector<Foo> list{ a, b, c };
			Vector<Foo> list2 = {a, b};
			list2 = list; 
			list2;
		}

		TEST_METHOD(MoveSemantics)
		{
			Foo a(1);
			Foo b(2); 
			Foo c(3);
			Vector<Foo> list{ a, b, c};

			Vector<Foo> list2 = move(list);

			Assert::AreEqual(size_t(3), list2.Size());
			Assert::AreEqual(a, list2.Front());
			Assert::AreEqual(c, list2.Back());
			Assert::AreEqual(size_t(11), list2.Capacity());
			Assert::IsTrue(list.IsEmpty());
			

			Vector<Foo> list3 = { c, b, a };
			list3 = move(list2);
			Assert::AreEqual(size_t(3), list3.Size());
			Assert::AreEqual(a, list3.Front());
			Assert::AreEqual(c, list3.Back());
			Assert::AreEqual(size_t(11), list3.Capacity());
			Assert::IsTrue(list2.IsEmpty());
			
			
		}
		TEST_METHOD(Front)
		{
			Vector<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };
			auto func = [&list] {list.Front(); };
			Assert::ExpectException<std::runtime_error>(func);

			list.PushBack(a);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(a, list.Back());
			list.PushBack(b);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(b, list.Back());

		}
		TEST_METHOD(Back)
		{
			Vector<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			auto func = [&list] {list.Back(); };
			Assert::ExpectException<std::runtime_error>(func);

			list.PushBack(a);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(a, list.Back());
			list.PushBack(b);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(b, list.Back());
		}

		TEST_METHOD(BracketOperator)
		{
			Foo a{ 1 };
			Foo b{ 2 };
			Vector<Foo> list{a, b};
			const Vector<Foo> list2{a, b};
			
			Assert::AreEqual(a, list[0]);
			Assert::AreEqual(b, list[1]);
			auto func = [&list] {list[2];};
			Assert::ExpectException<std::runtime_error>(func);

			Assert::AreEqual(a, list2[0]);
			Assert::AreEqual(b, list2[1]);
			auto func2 = [&list2] {list2[2]; };
			Assert::ExpectException<std::runtime_error>(func2);
		}

		TEST_METHOD(At)
		{
			Foo a{ 1 };
			Foo b{ 2 };
			Vector<Foo> list{ a, b };
			const Vector<Foo> list2{ a, b };

			Assert::AreEqual(a, list.At(0));
			Assert::AreEqual(b, list.At(1));
			auto func = [&list] {list.At(2); };
			Assert::ExpectException<std::runtime_error>(func);

			Assert::AreEqual(a, list2.At(0));
			Assert::AreEqual(b, list2.At(1));
			auto func2 = [&list2] {list2.At(2); };
			Assert::ExpectException<std::runtime_error>(func2);
		}

		TEST_METHOD(Size)
		{
			Vector<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreEqual((size_t)0, list.Size());
			list.PushBack(a);
			Assert::AreEqual((size_t)1, list.Size());
			list.PushBack(b);
			Assert::AreEqual((size_t)2, list.Size());
			list.PopBack();
			Assert::AreEqual((size_t)1, list.Size());
			list.PopBack();
			Assert::AreEqual((size_t)0, list.Size());

			list.PushBack(a);
			list.PushBack(b);
			list.Clear();
			Assert::AreEqual((size_t)0, list.Size());
		}

		TEST_METHOD(Is_Empty)
		{
			Vector<Foo> list;
			Foo a{ 1 };

			Assert::IsTrue(list.IsEmpty());
			list.PushBack(a);
			Assert::IsFalse(list.IsEmpty());
		}

		TEST_METHOD(Capacity)
		{
			Vector<Foo> list;

			//capacity is defaulted to 10
			Assert::AreEqual((size_t)11, list.Capacity());
			list.Reserve(20);
			Assert::AreEqual((size_t)20, list.Capacity());
			list.Reserve(10);
			Assert::AreEqual((size_t)20, list.Capacity());
		}

		TEST_METHOD(Pop_Back)
		{
			Vector<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };

			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());

			list.PushBack(a);
			list.PushBack(b);

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

		TEST_METHOD(Push_Back)
		{
			size_t baseCapacity = 11;
			Vector<Foo> list;
			Foo a{ 1 };
			Foo b{ 2 };
			Foo c{ 3 };
			Foo d{ 4 };
			Foo e{ 5 };
			Foo f{ 6 };
			Foo g{ 7 };
			Foo h{ 8 };
			Foo i{ 9 };
			Foo j{ 10 };
			Foo k{ 11 };

			Assert::AreEqual(size_t(0), list.Size());
			Assert::IsTrue(list.IsEmpty());
			list.PushBack(a);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(a, list.Back());
			Assert::AreEqual(size_t(1), list.Size());
			Assert::AreEqual(baseCapacity, list.Capacity());
			Assert::IsFalse(list.IsEmpty());
			list.PushBack(b);
			Assert::AreEqual(a, list.Front());
			Assert::AreEqual(b, list.Back());
			Assert::AreEqual(size_t(2), list.Size());
			Assert::AreEqual(baseCapacity, list.Capacity());

			Vector<Foo> list2{ a, b, c, d, e, f, g, h, i, j};
			auto v = list2.Capacity();
			v;
			Assert::AreEqual(baseCapacity, list2.Capacity());
			Assert::AreEqual(10_z, list2.Size());
			list2.PushBack(k);
			list2.PushBack(k);
			// doubles capacity if size goes over
			Assert::AreEqual(baseCapacity * 2, list2.Capacity());
		}

		TEST_METHOD(Reserve)
		{
			size_t baseCapacity = 11;
			Vector<Foo> list;
			Assert::AreEqual(baseCapacity, list.Capacity());
			list.Reserve(baseCapacity * 2);
			Assert::AreEqual(baseCapacity * 2, list.Capacity());
		}

		TEST_METHOD(Clear)
		{
			Foo a{ 1 };
			Foo b{ 2 };
			Slist<Foo> list{a, b};
			Assert::AreEqual((size_t)2, list.Size());
			list.Clear();
			Assert::AreEqual((size_t)0, list.Size());
		}

		TEST_METHOD(Remove)
		{
			// remove front item 
			{
				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Vector<Foo> list{ a, b, c};
				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				list.Remove(a);
				Assert::AreEqual(list.Front(), b);
				Assert::AreEqual(list.Back(), c);
				Assert::AreEqual(list.Size(), size_t(2));

			}
			// remove middle item
			{
				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Vector<Foo> list{ a, b, c };
				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				list.Remove(b);
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				Assert::AreEqual(list.Size(), size_t(2));
			}
			// remove end item 
			{
				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Vector<Foo> list{ a, b, c };
				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				list.Remove(c);
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), b);
				Assert::AreEqual(list.Size(), size_t(2));
			}
			// remove from iterator position
			{
				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Vector<Foo> list{ a, b, c};
				Vector<Foo> list2; 

				Vector<Foo>::Iterator it = list.begin();
				Vector<Foo>::Iterator it2 = list2.begin();

				auto func1 = [&list, &it2] {list.Remove(it2); };
				Assert::ExpectException<std::runtime_error>(func1);

				Assert::AreEqual(list.Size(), size_t(3));
				Assert::AreEqual(list.Front(), a);
				Assert::AreEqual(list.Back(), c);
				Assert::AreEqual(*list.begin(), a);
				list.Remove(it);
				Assert::AreEqual(*list.begin(), b);
				Assert::AreEqual(list.Front(), b);
				Assert::AreEqual(list.Back(), c);
				Assert::AreEqual(list.Size(), size_t(2));
				list.Remove(it);
				Assert::AreEqual(*list.begin(), c);
				Assert::AreEqual(list.Front(), c);
				Assert::AreEqual(list.Back(), c);
				Assert::AreEqual(list.Size(), size_t(1));
				list.Remove(it);
				Assert::IsTrue(list.IsEmpty());
				Assert::IsTrue(list.begin() == list.end());
				Assert::AreEqual(list.begin(), list.end());
			}
			 //range based remove 
			{
				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Foo d{ 4 };
				Foo e{ 5 };
				Foo f{ 6 };
				Foo g{ 7 };
				Foo h{ 8 };
				Foo i{ 9 };
				Foo j{ 10 };
				Vector<Foo> list{ a, b, c, d, e, f, g, h, i, j };
				Vector<Foo> list2; 
				Vector<Foo>::Iterator it1 = list.begin();
				Vector<Foo>::Iterator it2 = list.begin();
				Vector<Foo>::Iterator it3 = list2.begin();

				auto func1 = [&list, &it1, &it3] {list.Remove(it3, it1); };
				Assert::ExpectException<std::runtime_error>(func1);

				auto func2 = [&list, &it1, &it3] {list.Remove(it1, it3); };
				Assert::ExpectException<std::runtime_error>(func2);

				for (int m = 0; m < 6; ++m)
				{
					++it2;
					
				}
			
				auto func3 = [&list, &it1, &it2] {list.Remove(it2, it1); };
				Assert::ExpectException<std::runtime_error>(func3);
				list.Remove(it1, it2);
				Assert::AreEqual(*list.begin(), g);
				Assert::AreEqual(g, list[0]);
				Assert::AreEqual(h, list[1]);
				Assert::AreEqual(i, list[2]);
				Assert::AreEqual(j, list[3]);
			}
			{
				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Foo d{ 4 };
				Foo e{ 5 };
				Foo f{ 6 };
				Foo g{ 7 };
				Foo h{ 8 };
				Foo i{ 9 };
				Foo j{ 10 };
				Vector<Foo> list{ a, b, c, d, e, f, g, h, i, j };

				Vector<Foo>::Iterator it1 = list.begin();
				Vector<Foo>::Iterator it2 = list.begin();
				
				list.Remove(it1, it2);
				Assert::AreEqual(*list.begin(), a);
			}
		}

		TEST_METHOD(ShirnkToFit)
		{
			{

				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Vector<Foo> list{ a, b, c };
				Assert::AreEqual(size_t(3), list.Size());
				Assert::AreEqual(size_t(11), list.Capacity());
				list.ShrinkToFit();
				Assert::AreEqual(size_t(3), list.Size());
				Assert::AreEqual(size_t(3), list.Capacity());
			}

			{
				Foo a{ 1 };
				Foo b{ 2 };
				Foo c{ 3 };
				Foo d{ 4 };
				Foo e{ 5 };
				Foo f{ 6 };
				Foo g{ 7 };
				Foo h{ 8 };
				Foo i{ 9 };
				Foo j{ 10 };
				Vector<Foo> list{ a, b, c, d, e, f, g, h, i, j };
				Assert::AreEqual(size_t(10), list.Size());
				Assert::AreEqual(size_t(11), list.Capacity());
				list.ShrinkToFit();
				Assert::AreEqual(size_t(10), list.Size());
				Assert::AreEqual(size_t(10), list.Capacity());
			}
		}

		TEST_METHOD(Resize)
		{
			Foo a{ 1 };
			Foo b{ 2 };
			Foo c{ 3 };
			Vector<Foo> list{ a, b, c };
			Assert::AreEqual(size_t(3), list.Size());
			Assert::AreEqual(size_t(11), list.Capacity());
			list.Resize(20);
			Assert::AreEqual(size_t(20), list.Size());
			Assert::AreEqual(size_t(20), list.Capacity());
			list.Resize(20);
			Assert::AreEqual(size_t(20), list.Size());
			Assert::AreEqual(size_t(20), list.Capacity());

			list.Resize(2);
			Assert::AreEqual(size_t(2), list.Size());
			Assert::AreEqual(size_t(2), list.Capacity());

		}
		TEST_METHOD(Iterator)
		{
			{
				Vector<Foo> list;
				Assert::AreEqual(list.begin(), list.end());

				Foo a(10);
				list.PushBack(a);
				Assert::AreNotEqual(list.end(), list.begin());
			}
			{
				Foo a(1);
				Foo b(2);
				Foo c(3);
				Vector<Foo> list{ a, b, c };

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
			const Vector<Foo> list{ a, b, c };
		
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
			Vector<Foo> list{ a, b, c };
		
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
			Assert::ExpectException<runtime_error>([] {Vector<Foo>::Iterator it; ++it; });
		}

		TEST_METHOD(IteratorDereference)
		{
			Assert::ExpectException<runtime_error>([] {Vector<Foo>::Iterator it; *it; });
		}

		TEST_METHOD(ConstIteratorIncrement)
		{
			Assert::ExpectException<runtime_error>([] {Vector<Foo>::ConstIterator it; ++it; });
		}

		TEST_METHOD(ConstIteratorDereference)
		{
			Assert::ExpectException<runtime_error>([] {Vector<Foo>::ConstIterator it; *it; });
		}

		TEST_METHOD(Find)
		{
			Foo a(1);
			Foo b(2);
			Foo c(3);
			Foo d(4);
			Vector<Foo> list{ a, b, c };
			//const Vector<Foo> list2 = list;

			Vector<Foo>::Iterator it = list.Find(a);
			Assert::AreEqual(*it, a);

			Vector<Foo>::ConstIterator it2 = list.Find(a);
			Assert::AreEqual(*it2, a);

			Vector<Foo>::Iterator it3 = list.Find(d);
			Assert::AreEqual(it3, list.end());

			//Vector<Foo>::ConstIterator it4 = list2.Find(d);
			//Assert::AreEqual(it4, list2.end());
		}

		TEST_METHOD(IteratorLessThanGreaterThan)
		{
			Foo a(1);
			Foo b(2);
			Foo c(3);
			Vector<Foo> list{ a, b, c };
			Vector<Foo>::Iterator it = list.Find(c);
			Vector<Foo>::Iterator it2 = list.begin();
			Vector<Foo>::Iterator it3 = list.Find(c);
		
			Assert::IsTrue(it2 < it);
			Assert::IsTrue(it > it2);
		}


	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState VectorTests::_startMemState;
}

