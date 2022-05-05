#include "pch.h"
#include "Slist.h"
#include "Foo.h"
#include "Vector.h"
#include "HashMap.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;

namespace FieaGameEngine
{
	template <>
	struct DefaultHash<Foo>
	{

		std::size_t operator()(const Foo& value)
		{
			return abs(value.Data());
		}
	};

	template <>
	struct DefaultHash<const Foo>
	{

		std::size_t operator()(const Foo& value)
		{
			return abs(value.Data());
		}
	};
}


namespace UnitTestLibraryDesktop
{

	
	TEST_CLASS(HashMapTests)
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

		TEST_METHOD(DefaultHashTests)
		{
			//int 
			{
				int a = 10; 
				DefaultHash<int> hash; 

				Assert::AreEqual(hash(a), hash(a));

			}
			//string 
			{
				std::string s = "hello";
				DefaultHash<std::string> hash; 
				Assert::AreEqual(hash(s), hash(s));
			}

			//Foo
			{
				Foo a(1);
				DefaultHash<Foo> hash;
				Assert::AreEqual(hash(a), hash(a));
			}

			//char *
			{
				char* s = "hello";
				DefaultHash<char*> hash;
				Assert::AreEqual(hash(s), hash(s));
				
			}
		}

		TEST_METHOD(Constructor)
		{
			{
				HashMap<Foo, Foo> map;
				Assert::AreEqual((size_t)0, map.Size());
				Assert::AreEqual(0.0f, map.GetLoadFactor());
			}

			{
				HashMap<Foo, Foo> map(20);
				Assert::AreEqual((size_t)0, map.Size());
				Assert::AreEqual(0.0f, map.GetLoadFactor());
			}

		}

		TEST_METHOD(CopyConstructor)
		{
			Foo a(1);
			Foo c(3);
			int b = 2;
			int d = 4;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			HashMap<Foo, int> map{p, p2};
			HashMap<Foo, int> map2 = map; 

			Assert::AreEqual(map.Size(), map2.Size());
			Assert::AreEqual(map.GetLoadFactor(), map2.GetLoadFactor());
			Assert::AreEqual(*map2.Find(a), p);
			Assert::AreEqual(*map2.Find(c), p2);
		}

		TEST_METHOD(AssignmentConstructor)
		{
			Foo a(1);
			Foo c(3);
			int b = 2;
			int d = 4;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			HashMap<Foo, int> map{ p, p2 };
			HashMap<Foo, int> map2 = {p};
			map2 = map;

			Assert::AreEqual(map.Size(), map2.Size());
			Assert::AreEqual(map.GetLoadFactor(), map2.GetLoadFactor());
			Assert::AreEqual(*map2.Find(a), p);
			Assert::AreEqual(*map2.Find(c), p2);
		}

		TEST_METHOD(Find)
		{
			{
				Foo a(1);
				Foo c(3);
				int b = 2;
				int d = 4;
				std::pair<const Foo, int> p(a, b);
				std::pair<const Foo, int> p2(c, d);
				HashMap<Foo, int> map;
				HashMap<Foo, int>::Iterator it = map.Find(a);
				Assert::AreEqual(map.begin(), it);
				Assert::AreEqual(map.end(), it);
				Assert::AreEqual(map.Size(), (size_t)0);

				map.Insert(p);
				HashMap<Foo, int>::Iterator it2 = map.Find(a);
				Assert::AreEqual(it2->second, p.second);
				Assert::AreEqual(it2->first, p.first);
				Assert::AreEqual(map.Size(), (size_t)1);

				HashMap<Foo, int>::ConstIterator it3 = map.Find(a);
				Assert::AreEqual(it3->second, p.second);
				Assert::AreEqual(it3->first, p.first);
			}
		}

		TEST_METHOD(Insert)
		{
			{
				Foo a(1);
				Foo c(3);
				int b = 2;
				int d = 4;
				std::pair<const Foo, int> p(a, b);
				std::pair<const Foo, int> p2(c, d);
				HashMap<Foo, int> map;

				std::pair<HashMap<Foo, int>::Iterator, bool> p3 = map.Insert(p);
				HashMap<Foo, int>::Iterator it = map.Find(a);
				Assert::AreEqual(it->second, p.second);
				Assert::AreEqual(it->first, p.first);
				Assert::AreEqual(it->second, map[a]);
				Assert::AreEqual(it->second, map.At(a));
				Assert::AreEqual(p3.second, true);
				Assert::AreEqual(p3.first, map.Find(a));
				Assert::AreEqual(map.Size(), (size_t)1);

				std::pair<HashMap<Foo, int>::Iterator, bool> p4 = map.Insert(p);
				Assert::AreEqual(p4.first, map.Find(a));
				Assert::AreEqual(p4.second, false);
				Assert::AreEqual(map.Size(), (size_t)1);


				std::pair<HashMap<Foo, int>::Iterator, bool> p5 = map.Insert(p2);
				HashMap<Foo, int>::Iterator it2 = map.Find(c);
				Assert::AreEqual(it2->second, p2.second);
				Assert::AreEqual(it2->first, p2.first);
				Assert::AreEqual(it2->second, map[c]);
				Assert::AreEqual(it2->second, map.At(c));
				Assert::AreEqual(p5.second, true);
				Assert::AreEqual(p5.first, map.Find(c));
				Assert::AreEqual(map.Size(), (size_t)2);
			}

			{
				Foo a(1);
				Foo c(3);
				Foo e(5);
				int b = 2;
				int d = 4;
				int f = 6;
				std::pair<const Foo, int> p(a, b);
				std::pair<const Foo, int> p2(c, d);
				std::pair<const Foo, int> p3(e, f);
				HashMap<Foo, int> map;

				Assert::AreEqual(map.Size(), (size_t)0);
				map.Insert(p);
				Assert::AreEqual(p.first, map.Find(a)->first);
				Assert::AreEqual(p.second, map.Find(a)->second);
				Assert::AreEqual(map.Size(), (size_t)1);
				map.Insert(p2);
				Assert::AreEqual(p2.first, map.Find(c)->first);
				Assert::AreEqual(p2.second, map.Find(c)->second);
				Assert::AreEqual(map.Size(), (size_t)2);
				map.Insert(p3);
				Assert::AreEqual(p3.first, map.Find(e)->first);
				Assert::AreEqual(p3.second, map.Find(e)->second);
				Assert::AreEqual(map.Size(), (size_t)3);
			}
		}

		TEST_METHOD(BracketOperator)
		{
			Foo a(1);
			Foo c(3);
			int b = 2;
			int d = 4;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			HashMap<Foo, int> map;

			int data = map[a];
			Assert::AreEqual(data, 0);
			Assert::AreEqual(map.Size(), (size_t)1);
			
			HashMap<Foo, int>::Iterator it = map.Find(a);
			Assert::AreEqual(it->second, data);
			Assert::AreEqual(it->first, a);

			map[a] = b;
			Assert::AreEqual(map[a], b);
		}

		TEST_METHOD(At)
		{
			Foo a(1);
			Foo c(3);
			int b = 2;
			int d = 4;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			HashMap<Foo, int> map;

			auto func1 = [&map, &a] {map.At(a); };
			Assert::ExpectException<std::out_of_range>(func1);

			map.Insert(p);
			Assert::AreEqual(map.Size(), (size_t)1);
			Assert::AreEqual(map.At(a), b);
			Assert::AreEqual(map.Find(a)->first, a);
			Assert::AreEqual(map.Find(a)->second, b);
			Assert::AreEqual(map[a], map.At(a));
		}

		TEST_METHOD(Remove)
		{
			Foo a(1);
			Foo c(3);
			int b = 2;
			int d = 4;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			HashMap<Foo, int> map;

			Assert::AreEqual(map.Size(), (size_t)0);
			map.Remove(a);
			Assert::AreEqual(map.Size(), (size_t)0);

			map.Insert(p);
			Assert::AreEqual(map.Size(), (size_t)1);
			Assert::AreEqual(map.At(a), b);
			Assert::AreEqual(map.Find(a)->first, a);
			Assert::AreEqual(map.Find(a)->second, b);
			Assert::AreEqual(map[a], map.At(a));
			map.Remove(a);
			Assert::AreEqual(map.Size(), (size_t)0);
		}

		TEST_METHOD(Clear)
		{
			Foo a(1);
			Foo c(3);
			Foo e(5);
			int b = 2;
			int d = 4;
			int f = 6;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			std::pair<const Foo, int> p3(e, f);
			HashMap<Foo, int> map;

			Assert::AreEqual(map.Size(), (size_t)0);
			map.Insert(p);
			map.Insert(p2);
			map.Insert(p3);
			Assert::AreEqual(map.Size(), (size_t)3);
			map.Clear();
			Assert::AreEqual(map.Size(), (size_t)0);
		}

		TEST_METHOD(Size)
		{
			Foo a(1);
			int b = 2;
			std::pair<const Foo, int> p(a, b);
			HashMap<Foo, int> map;

			Assert::AreEqual(map.Size(), (size_t)0);
			map.Insert(p);
			Assert::AreEqual(map.Size(), (size_t)1);
		}

		TEST_METHOD(ContainsKey)
		{
			Foo a(1);
			Foo c(3);
			int b = 2;
			std::pair<const Foo, int> p(a, b);
			HashMap<Foo, int> map;
			
			Assert::AreEqual(map.Size(), (size_t)0);
			map.Insert(p);
			bool found = map.ContainsKey(a);
			Assert::AreEqual(found, true);
			found = map.ContainsKey(c);
			Assert::AreEqual(found, false);
		}

		TEST_METHOD(GetLoadFactor)
		{
			Foo a(1);
			Foo c(3);
			Foo e(5);
			int b = 2;
			int d = 4;
			int f = 6;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			std::pair<const Foo, int> p3(e, f);
			HashMap<Foo, int> map{ p, p2, p3};

			HashMap<Foo, int>::Iterator it = map.Find(a);
			Assert::AreEqual(a, it->first);
			Assert::AreEqual(b, it->second);

			HashMap<Foo, int>::Iterator it2 = map.Find(c);
			Assert::AreEqual(c, it2->first);
			Assert::AreEqual(d, it2->second);

			HashMap<Foo, int>::Iterator it3 = map.Find(e);
			Assert::AreEqual(e, it3->first);
			Assert::AreEqual(f, it3->second);

			float load = map.GetLoadFactor();
			Assert::AreEqual(load, float(3)/ float(11));
		}

		TEST_METHOD(Resize)
		{
			{
				Foo a(1);
				Foo c(3);
				Foo e(5);
				int b = 2;
				int d = 4;
				int f = 6;
				std::pair<const Foo, int> p(a, b);
				std::pair<const Foo, int> p2(c, d);
				std::pair<const Foo, int> p3(e, f);
				HashMap<Foo, int> map{ p, p2, p3 };

				float load = map.GetLoadFactor();
				Assert::AreEqual(load, float(3) / float(11));
				Assert::AreEqual(size_t(3), map.Size());
				
				map.Resize(5);
				HashMap<Foo, int>::Iterator it = map.Find(a);
				Assert::AreEqual(a, it->first);
				Assert::AreEqual(b, it->second);

				HashMap<Foo, int>::Iterator it2 = map.Find(c);
				Assert::AreEqual(c, it2->first);
				Assert::AreEqual(d, it2->second);

				HashMap<Foo, int>::Iterator it3 = map.Find(e);
				Assert::AreEqual(e, it3->first);
				Assert::AreEqual(f, it3->second);

				float load2 = map.GetLoadFactor();
				Assert::AreEqual(load2, float(3) / float(5));
				Assert::AreEqual(size_t(3), map.Size());
			}

			{
				Foo a(1);
				Foo c(3);
				Foo e(5);
				int b = 2;
				int d = 4;
				int f = 6;
				std::pair<const Foo, int> p(a, b);
				std::pair<const Foo, int> p2(c, d);
				std::pair<const Foo, int> p3(e, f);
				HashMap<Foo, int> map{ p, p2, p3 };

				float load = map.GetLoadFactor();
				Assert::AreEqual(load, float(3) / float(11));
				Assert::AreEqual(size_t(3), map.Size());

				map.Resize(20);
				HashMap<Foo, int>::Iterator it = map.Find(a);
				Assert::AreEqual(a, it->first);
				Assert::AreEqual(b, it->second);

				HashMap<Foo, int>::Iterator it2 = map.Find(c);
				Assert::AreEqual(c, it2->first);
				Assert::AreEqual(d, it2->second);

				HashMap<Foo, int>::Iterator it3 = map.Find(e);
				Assert::AreEqual(e, it3->first);
				Assert::AreEqual(f, it3->second);

				float load2 = map.GetLoadFactor();
				Assert::AreEqual(load2, float(3) / float(20));
				Assert::AreEqual(size_t(3), map.Size());
			}
		}
		TEST_METHOD(Iterator)
		{
			{
				HashMap<Foo, int> map; 
				Assert::AreEqual(map.begin(), map.end());

				Foo a(1);
				int b = 2;
				std::pair<const Foo, int> p(a, b);

				map.Insert(p);
				Assert::AreNotEqual(map.end(), map.begin());

			}

			{
				Foo a(1);
				Foo c(3);
				Foo e(5);
				int b = 2;
				int d = 4;
				int f = 6;
				std::pair<const Foo, int> p(a, b);
				std::pair<const Foo, int> p2(c, d);
				std::pair<const Foo, int> p3(e, f);
				HashMap<Foo, int> map{ p, p2, p3 };

				size_t count = 0;
				for (auto it = map.begin(); it != map.end(); ++it)
				{
					++count;
				}
				Assert::AreEqual(map.Size(), count);

				count = 0;
				for (const std::pair<const Foo, int>& value : map)
				{
					value;
					count++;
				}
				Assert::AreEqual(map.Size(), count);
			}
		}

		TEST_METHOD(ConstIterator)
		{
			Foo a(1);
			Foo c(3);
			Foo e(5);
			int b = 2;
			int d = 4;
			int f = 6;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			std::pair<const Foo, int> p3(e, f);
			const HashMap<Foo, int> map{ p, p2, p3 };

			size_t count = 0;
			for (auto it = map.begin(); it != map.end(); ++it)
			{
				++count;
			}
			Assert::AreEqual(map.Size(), count);

			count = 0;
			for (const std::pair<const Foo, int>& value : map)
			{
				value;
				count++;
			}
			Assert::AreEqual(map.Size(), count);
		}

		TEST_METHOD(CendCbegin)
		{
			const Foo a(1);
			const Foo c(3);
			const Foo e(5);
			int b = 2;
			int d = 4;
			int f = 6;
			std::pair<const Foo, int> p(a, b);
			std::pair<const Foo, int> p2(c, d);
			std::pair<const Foo, int> p3(e, f);
			HashMap<Foo, int> map{ p, p2, p3 };

			Assert::AreEqual(p, *map.cbegin());
			size_t count = 0;
			for (auto it = map.cbegin(); it != map.cend(); ++it)
			{
				++count;
			}
			Assert::AreEqual(map.Size(), count);
		}

		TEST_METHOD(IteratorIncrementFail)
		{
			Assert::ExpectException<runtime_error>([] {HashMap<Foo, int>::Iterator it; ++it; });
		}

		TEST_METHOD(IteratorDereferenceFail)
		{

			Assert::ExpectException<runtime_error>([] {HashMap<Foo, int>::Iterator it; *it; });
		}

		TEST_METHOD(ConstIteratorIncrementFail)
		{
			Assert::ExpectException<runtime_error>([] {HashMap<Foo, int>::ConstIterator it; ++it; });
		}

		TEST_METHOD(ConstIteratorDereferenceFail)
		{
			Assert::ExpectException<runtime_error>([] {HashMap<Foo, int>::ConstIterator it; *it; });
		}


	private:
		static _CrtMemState _startMemState;
	};

	_CrtMemState HashMapTests::_startMemState;
}
