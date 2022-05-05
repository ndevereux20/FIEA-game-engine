#include "pch.h"
#include "Datum.h"
#include "Foo.h"
#include "RTTI.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;

namespace UnitTestLibraryDesktop
{


	TEST_CLASS(DatumTests)
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
			{
				Datum d;
				//Assert::AreEqual(DatumTypes::Unknown, d.Type());
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(0_z, d.Capacity());
			}

			{
				const size_t capacity = 5;
				Datum d(DatumTypes::Integer, capacity);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(capacity, d.Capacity());
				Assert::AreEqual(DatumTypes::Integer, d.Type());
			}
			{
				const size_t capacity = 5;
				Datum d(DatumTypes::Float, capacity);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(capacity, d.Capacity());
				Assert::AreEqual(DatumTypes::Float, d.Type());
			}

			{
				const size_t capacity = 5;
				Datum d(DatumTypes::Vector, capacity);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(capacity, d.Capacity());
				Assert::AreEqual(DatumTypes::Vector, d.Type());
			}

			{
				const size_t capacity = 5;
				Datum d(DatumTypes::Matrix, capacity);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(capacity, d.Capacity());
				Assert::AreEqual(DatumTypes::Matrix, d.Type());
			}

			{
				const size_t capacity = 5;
				Datum d(DatumTypes::String, capacity);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(capacity, d.Capacity());
				Assert::AreEqual(DatumTypes::String, d.Type());
			}

			{
				const size_t capacity = 5;
				Datum d(DatumTypes::Pointer, capacity);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(capacity, d.Capacity());
				Assert::AreEqual(DatumTypes::Pointer, d.Type());
			}

			Assert::ExpectException<exception>([] {Datum d(DatumTypes::Unknown, 1); });
		}

		TEST_METHOD(CopyConstructor)
		{
			{
				int a = 1;
				int b = 2;
				int c = 3;
				Datum datum1;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum1.PushBack(c);
				Datum datum2 = datum1;
				Assert::IsTrue(datum1 == datum2);

			}

			{
				string a = "Hello1";
				string b = "Hello2";
				string c = "Hello3";
				Datum datum1;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum1.PushBack(c);
				Datum datum2 = datum1;
				Assert::IsTrue(datum1 == datum2);

			}

			{
				int a[] = {1, 2, 3};
				Datum datum1;
				datum1.SetStorage(a, 3);
				Datum datum2 = datum1;
				Assert::IsTrue(datum1 == datum2);

			}
		}

		TEST_METHOD(AssignmentOperator)
		{
			// internal = external 
			{
				int a = 1;
				int b[] = { 1, 2, 3 };
				Datum datum1;
				datum1.SetStorage(b, 3);
				Datum datum2;
				datum2.PushBack(a);
				datum2 = datum1;
				Assert::IsTrue(datum1 == datum2);

			}
			//external = external
			{
				int a = 1;
				int b[] = { 1, 2, 3 };
				Datum datum1;
				datum1.SetStorage(b, 3);
				Datum datum2;
				datum2.SetStorage(&a, 1);
				datum2 = datum1;
				Assert::IsTrue(datum1 == datum2);

			}
			// internal = internal
			{
				{
					int a = 1;
					int b = 2;
					int c = 3;
					Datum datum1;
					datum1.PushBack(a);
					datum1.PushBack(b);
					datum1.PushBack(c);
					Datum datum2 = a;
					datum2 = datum1;
					Assert::IsTrue(datum1 == datum2);
				}
				{
					string a = "Hello1";
					string b = "Hello2";
					string c = "Hello3";
					Datum datum1;
					datum1.PushBack(a);
					datum1.PushBack(b);
					datum1.PushBack(c);
					Datum datum2 = a;
					datum2 = datum1;
					Assert::IsTrue(datum1 == datum2);
				}
			}
			// external = internal
			{
				{
					int a = 1;
					int b = 2;
					int c = 3;
					Datum datum1;
					datum1.PushBack(a);
					datum1.PushBack(b);
					datum1.PushBack(c);
					Datum datum2;
					datum2.SetStorage(&a, 1);
					datum2 = datum1;
					Assert::IsTrue(datum1 == datum2);
				}
				{
					string a = "Hello1";
					string b = "Hello2";
					string c = "Hello3";
					Datum datum1;
					datum1.PushBack(a);
					datum1.PushBack(b);
					datum1.PushBack(c);
					Datum datum2;
					datum2.SetStorage(&a, 1);
					datum2 = datum1;
					Assert::IsTrue(datum1 == datum2);
				}
			}
		}

		TEST_METHOD(MoveCopy)
		{
			int a = 10;
			int b = 10;
			Datum datum1;
			datum1.PushBack(a);
			datum1.PushBack(b);
			Assert::AreEqual(2_z, datum1.Size());
			Assert::AreEqual(2_z, datum1.Capacity());
			Assert::AreEqual(DatumTypes::Integer, datum1.Type());
			Assert::AreEqual(false, datum1.IsExternal());
			Assert::IsTrue(datum1.Find(a).first);
			Assert::IsTrue(datum1.Find(b).first);

			Datum datum2 = std::move(datum1);
			Assert::AreEqual(2_z, datum2.Size());
			Assert::AreEqual(2_z, datum2.Capacity());
			Assert::AreEqual(DatumTypes::Integer, datum2.Type());
			Assert::AreEqual(false, datum2.IsExternal());
			Assert::IsTrue(datum2.Find(a).first);
			Assert::IsTrue(datum2.Find(b).first);


		}

		TEST_METHOD(MoveAssignment)
		{
			int a = 10;
			int b = 10;
			Datum datum1;
			datum1.PushBack(a);
			datum1.PushBack(b);
			Assert::AreEqual(2_z, datum1.Size());
			Assert::AreEqual(2_z, datum1.Capacity());
			Assert::AreEqual(DatumTypes::Integer, datum1.Type());
			Assert::AreEqual(false, datum1.IsExternal());
			Assert::IsTrue(datum1.Find(a).first);
			Assert::IsTrue(datum1.Find(b).first);

			Datum datum2 = a;
			datum2 = std::move(datum1);
			Assert::AreEqual(2_z, datum2.Size());
			Assert::AreEqual(2_z, datum2.Capacity());
			Assert::AreEqual(DatumTypes::Integer, datum2.Type());
			Assert::AreEqual(false, datum2.IsExternal());
			Assert::IsTrue(datum2.Find(a).first);
			Assert::IsTrue(datum2.Find(b).first);
		}
		TEST_METHOD(TypeCastCopyConstructors)
		{
			{
				const int32_t a = 1;
				Datum d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Integer, d.Type());
				Assert::AreEqual(a, d.Get<int32_t>());
			}

			{
				const float a = 1.0f;
				Datum d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Float, d.Type());
				Assert::AreEqual(a, d.Get<float>());
			}
			
			{
				const vec4 a(1);
				Datum d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Vector, d.Type());
				Assert::AreEqual(a, d.Get<vec4>());
			}
			
			{
				const mat4 a(1);
				Datum d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Matrix, d.Type());
				Assert::AreEqual(a, d.Get<mat4>());
			}
			
			{
				const string a("ABC");
				Datum d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::String, d.Type());
				Assert::AreEqual(a, d.Get<string>());
			}
			
			{
				Foo aFoo(10);
				RTTI* a = &aFoo;
			
				Datum d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Pointer, d.Type());
				Assert::AreEqual(a, d.Get<RTTI*>());
			
			}
		}

		TEST_METHOD(TypeCastAssignment)
		{
			{
				const int32_t a = 1;
				Datum d;
				d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Integer, d.Type());
				Assert::AreEqual(a, d.Get<int32_t>());
			}

			{
				const float a = 1.0f;
				Datum d;
				d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Float, d.Type());
				Assert::AreEqual(a, d.Get<float>());
			}

			{
				const vec4 a(1);
				Datum d;
				d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Vector, d.Type());
				Assert::AreEqual(a, d.Get<vec4>());
			}

			{
				const mat4 a(1);
				Datum d;
				d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Matrix, d.Type());
				Assert::AreEqual(a, d.Get<mat4>());
			}

			{
				const string a("ABC");
				Datum d;
				d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::String, d.Type());
				Assert::AreEqual(a, d.Get<string>());
			}

			{
				Foo aFoo(10);
				RTTI* a = &aFoo;
				Datum d;
				d = a;
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
				Assert::AreEqual(DatumTypes::Pointer, d.Type());
				Assert::AreEqual(a, d.Get<RTTI*>());

			}
		}
		TEST_METHOD(Type)
		{
			Datum d;
			Assert::AreEqual(DatumTypes::Unknown, d.Type());
			d.SetType(DatumTypes::Integer);
			Assert::AreEqual(DatumTypes::Integer, d.Type());
		}

		TEST_METHOD(SetType)
		{
			Datum d;
			Assert::AreEqual(DatumTypes::Unknown, d.Type());
			d.SetType(DatumTypes::Integer);
			Assert::AreEqual(DatumTypes::Integer, d.Type());
			Assert::ExpectException<exception>([&d] {d.SetType(DatumTypes::Unknown); });
			Assert::ExpectException<exception>([&d] {d.SetType(DatumTypes::Float); });
		}

		TEST_METHOD(IsEmpty)
		{
			{
				Datum d;
				Assert::IsTrue(d.IsEmpty());

				d = 10;
				Assert::IsFalse(d.IsEmpty());

			}
		}

		TEST_METHOD(Size)
		{
			{
				int a = 1;
				int b = 2;
				Datum d;

				Assert::AreEqual(0_z, d.Size());
				d.PushBack(a);
				Assert::AreEqual(1_z, d.Size());
				d.PushBack(b);
				Assert::AreEqual(2_z, d.Size());
				d.PopBack();
				Assert::AreEqual(1_z, d.Size());
				d.Clear();
				Assert::AreEqual(0_z, d.Size());
			}
		}

		TEST_METHOD(Capcity)
		{
			Datum d;
			Assert::AreEqual(0_z, d.Capacity());
			d.SetType(DatumTypes::Integer);
			d.Reserve(10);
			Assert::AreEqual(10_z, d.Capacity());
		}

		TEST_METHOD(Resize)
		{
			for (DatumTypes type = DatumTypes::Begin; type <= DatumTypes::End; type = static_cast<DatumTypes>(static_cast<size_t>(type) + 1))
			{
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.Resize(10); });

				d.SetType(type);
				d.Resize(10);

				Assert::AreEqual(10_z, d.Capacity());
				Assert::AreEqual(10_z, d.Size());
				

				d.Resize(5);
				Assert::AreEqual(5_z, d.Capacity());
				Assert::AreEqual(5_z, d.Size());
				

			}

		}

		TEST_METHOD(Reserve)
		{
			for (DatumTypes type = DatumTypes::Begin; type <= DatumTypes::End; type = static_cast<DatumTypes>(static_cast<size_t>(type) + 1))
			{
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.Reserve(10); });

				d.SetType(type);
				d.Reserve(10);

				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());
				
				d.Reserve(3);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());
			}
		}

		TEST_METHOD(ShirnkToFit)
		{
			{
				int a = 10;
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.ShrinkToFit(); });

				d.SetType(DatumTypes::Integer);
				d.ShrinkToFit();
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				d.Reserve(10);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.PushBack(a);
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.ShrinkToFit();
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
			}

			{
				float a = 10;
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.ShrinkToFit(); });

				d.SetType(DatumTypes::Float);
				d.ShrinkToFit();
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				d.Reserve(10);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.PushBack(a);
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.ShrinkToFit();
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
			}

			{
				glm::vec4 a = {1, 2, 3, 4};
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.ShrinkToFit(); });

				d.SetType(DatumTypes::Vector);
				d.ShrinkToFit();
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				d.Reserve(10);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.PushBack(a);
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.ShrinkToFit();
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
			}

			{
				glm::mat4 a = { 10, 20, 30, 40
								, 50, 60, 70, 80,
								90, 100, 110, 120,
								130, 140, 150, 160 };
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.ShrinkToFit(); });

				d.SetType(DatumTypes::Matrix);
				d.ShrinkToFit();
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				d.Reserve(10);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.PushBack(a);
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.ShrinkToFit();
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
			}

			{
				string a = "Hello";
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.ShrinkToFit(); });

				d.SetType(DatumTypes::String);
				d.ShrinkToFit();
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				d.Reserve(10);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.PushBack(a);
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.ShrinkToFit();
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
			}

			{
				Foo foo = 10;
				RTTI* a = &foo;
				Datum d;
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				Assert::ExpectException<exception>([&d] {d.ShrinkToFit(); });

				d.SetType(DatumTypes::Pointer);
				d.ShrinkToFit();
				Assert::AreEqual(0_z, d.Capacity());
				Assert::AreEqual(0_z, d.Size());

				d.Reserve(10);
				Assert::AreEqual(0_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.PushBack(a);
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(10_z, d.Capacity());

				d.ShrinkToFit();
				Assert::AreEqual(1_z, d.Size());
				Assert::AreEqual(1_z, d.Capacity());
			}
		}


		TEST_METHOD(IsExternal)
		{
			{
				int a = 1;
				Datum datum;
				Assert::IsFalse(datum.IsExternal());
				datum.SetStorage(&a, 1);
				Assert::IsTrue(datum.IsExternal());
			}
			{
				float a = 1;
				Datum datum;
				Assert::IsFalse(datum.IsExternal());
				datum.SetStorage(&a, 1);
				Assert::IsTrue(datum.IsExternal());
			}
			{
				vec4 a = {1, 1, 1, 1};
				Datum datum;
				Assert::IsFalse(datum.IsExternal());
				datum.SetStorage(&a, 1);
				Assert::IsTrue(datum.IsExternal());
			}
			{
				mat4 a = {1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1, 
							1, 1, 1, 1};
				Datum datum;
				Assert::IsFalse(datum.IsExternal());
				datum.SetStorage(&a, 1);
				Assert::IsTrue(datum.IsExternal());
			}
			{
				string a = "Hi";
				Datum datum;
				Assert::IsFalse(datum.IsExternal());
				datum.SetStorage(&a, 1);
				Assert::IsTrue(datum.IsExternal());
			}
			{
				Foo foo = 10;
				RTTI* a = &foo;
				Datum datum;
				Assert::IsFalse(datum.IsExternal());
				datum.SetStorage(&a, 1);
				Assert::IsTrue(datum.IsExternal());
			}
		}

		TEST_METHOD(SetStorageInteger)
		{
			{
				int32_t a[] = { 1, 2, 3 };

				Datum datum;
				
				datum.SetStorage(a, 3);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(DatumTypes::Integer, datum.Type());
				
				//Assert::ExpectException<exception>([&datum] {int b = 2; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {Foo foo = 10; RTTI* b = &foo; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {Foo foo = 10; RTTI* b = &foo; datum.SetType(DatumTypes::Pointer); datum.SetStorage(&b, 1); });
			}
			
			{
				float a[] = { 1, 2, 3 };

				Datum datum;

				datum.SetStorage(a, 3);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(DatumTypes::Float, datum.Type());

				//Assert::ExpectException<exception>([&datum] {float b = 2; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {int b = 2; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {int b = 2; datum.SetType(DatumTypes::Integer) ;datum.SetStorage(&b, 1); });
			}
			{
				vec4 a[] = { {1, 1, 1, 1}, {2, 2, 2, 2}, {3, 3, 3, 3} };

				Datum datum;

				datum.SetStorage(a, 3);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(DatumTypes::Vector, datum.Type());

				//Assert::ExpectException<exception>([&datum] {vec4 b = {1, 1, 1, 1}; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {float b = 2.0f; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {float b = 2.0f; datum.SetType(DatumTypes::Float); datum.SetStorage(&b, 1); });
			}
			{
				mat4 d = { 1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1 };
				mat4 b = { 2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2 };
				mat4 c = { 3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3 };
				mat4 a[] = {d, b, c};

				Datum datum;

				datum.SetStorage(a, 3);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(DatumTypes::Matrix, datum.Type());

				//Assert::ExpectException<exception>([&datum] {mat4 b = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {vec4 b = {1, 1, 1, 1}; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {vec4 b = { 1, 1, 1, 1 }; datum.SetType(DatumTypes::Vector); datum.SetStorage(&b, 1); });
			}
			{
				string a[] = { "Hi", "Hello", "Goodbye"};

				Datum datum;

				datum.SetStorage(a, 3);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(DatumTypes::String, datum.Type());

				//Assert::ExpectException<exception>([&datum] {string b = "error"; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {mat4 b = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {mat4 b = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }; datum.SetType(DatumTypes::Matrix); datum.SetStorage(&b, 1); });
			}
			{
				Foo foo1 = 1;
				Foo foo2 = 2;
				Foo foo3 = 3;
				RTTI* a[] = { &foo1, &foo2, &foo3};

				Datum datum;

				datum.SetStorage(a, 3);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(DatumTypes::Pointer, datum.Type());

				//Assert::ExpectException<exception>([&datum] {Foo foo = 10; RTTI* b = &foo; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {string b = "error"; datum.SetStorage(&b, 1); });
				Assert::ExpectException<exception>([&datum] {string b = "error"; datum.SetType(DatumTypes::String); datum.SetStorage(&b, 1); });
			}

		}

		TEST_METHOD(EqualOperatorScalar)
		{
			{
				int32_t a = 10;
				int32_t b = 20;
				Datum d; 
				d = a; 
				Assert::IsTrue(d == a);
				Assert::IsFalse(d != a);
				Assert::IsTrue(d != b);
				Assert::IsFalse(d == b);
			}

			{
				float a = 10;
				float b = 20;
				Datum d;
				d = a;
				Assert::IsTrue(d == a);
				Assert::IsFalse(d != a);
				Assert::IsTrue(d != b);
				Assert::IsFalse(d == b);
			}

			{
				glm::vec4 a = { 10, 20, 30, 40 };
				glm::vec4 b = { 0, 0, 0, 0 };
				Datum d;
				d = a;
				Assert::IsTrue(d == a);
				Assert::IsFalse(d != a);
				Assert::IsTrue(d != b);
				Assert::IsFalse(d == b);
			}

			{
				glm::mat4 a = { 10, 20, 30, 40
								, 50, 60, 70, 80,
								90, 100, 110, 120,
								130, 140, 150, 160};
				glm::mat4 b = { 0, 0, 0, 0,
								0, 0, 0, 0,
								0, 0, 0, 0,
								0, 0, 0, 0,};
				Datum d;
				d = a;
				Assert::IsTrue(d == a);
				Assert::IsFalse(d != a);
				Assert::IsTrue(d != b);
				Assert::IsFalse(d == b);
			}

			{
				string a = "a b c";
				string b = " e f g";
				Datum d;
				d = a;
				Assert::IsTrue(d == a);
				Assert::IsFalse(d != a);
				Assert::IsTrue(d != b);
				Assert::IsFalse(d == b);
			}

			{
				Foo a1 = 10;
				Foo b1 = 20;
				RTTI* a = &a1;
				RTTI* b = &b1;
				Datum d;
				d = a;
				Assert::IsTrue(d == a);
				Assert::IsFalse(d != a);
				Assert::IsTrue(d != b);
				Assert::IsFalse(d == b);
			}

		}

		TEST_METHOD(EqualOperatorNonScalar)
		{
			//size isnt the same
			{
				int a = 1;
				int b = 2;
				Datum datum1;
				Datum datum2;
				datum1.PushBack(a);
				datum1.PushBack(b);
				Assert::AreEqual(2_z, datum1.Capacity());
				Assert::AreEqual(2_z, datum1.Size());
				datum2.PushBack(b);
				Assert::AreEqual(1_z, datum2.Capacity());
				Assert::AreEqual(1_z, datum2.Size());
				Assert::IsFalse(datum1 == datum2);
				Assert::IsTrue(datum1 != datum2);

			}
			//type isnt the same
			{
				
				Datum datum1;
				Datum datum2;
				datum1.SetType(DatumTypes::Integer);
				datum2.SetType(DatumTypes::Float);
				datum1.Reserve(10);
				datum2.Reserve(10);
				Assert::IsFalse(datum1 == datum2);
				Assert::IsTrue(datum1 != datum2);
			}
			
			//int
			{
				int a = 1;
				int b = 2;
				int c = 3;
				int d = 4;
				Datum datum1;
				Datum datum2;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum2.PushBack(a);
				datum2.PushBack(b);
				Assert::IsTrue(datum1 == datum2);
				Assert::IsFalse(datum1 != datum2);
				datum1.PushBack(c);
				datum2.PushBack(d);
				Assert::IsTrue(datum1 != datum2);
				Assert::IsFalse(datum1 == datum2);
			}
			//float
			{
				float a = 1;
				float b = 2;
				float c = 3;
				float d = 4;
				Datum datum1;
				Datum datum2;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum2.PushBack(a);
				datum2.PushBack(b);
				Assert::IsTrue(datum1 == datum2);
				Assert::IsFalse(datum1 != datum2);
				datum1.PushBack(c);
				datum2.PushBack(d);
				Assert::IsTrue(datum1 != datum2);
				Assert::IsFalse(datum1 == datum2);
			}
			//vector
			{
				vec4 a = {1, 1, 1, 1};
				vec4 b = {2, 2, 2, 2};
				vec4 c = { 3, 3, 3, 3 };
				vec4 d = { 4, 4, 4, 4 };
				Datum datum1;
				Datum datum2;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum2.PushBack(a);
				datum2.PushBack(b);
				Assert::IsTrue(datum1 == datum2);
				Assert::IsFalse(datum1 != datum2);
				datum1.PushBack(c);
				datum2.PushBack(d);
				Assert::IsTrue(datum1 != datum2);
				Assert::IsFalse(datum1 == datum2);
			}
			//matrix
			{
				mat4 a = { 1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1 };
				mat4 b = { 2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2 };
				mat4 c = { 3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3 };
				mat4 d = { 4, 4, 4, 4,
							4, 4, 4, 4,
							4, 4, 4, 4,
							4, 4, 4, 4 };
				Datum datum1;
				Datum datum2;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum2.PushBack(a);
				datum2.PushBack(b);
				Assert::IsTrue(datum1 == datum2);
				Assert::IsFalse(datum1 != datum2);
				datum1.PushBack(c);
				datum2.PushBack(d);
				Assert::IsTrue(datum1 != datum2);
				Assert::IsFalse(datum1 == datum2);
			}
			//string
			{
				
				string a = "Hello";
				string b = "Goodbye";
				string c = "Hi";
				string d = "Bye";
				Datum datum1;
				Datum datum2;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum2.PushBack(a);
				datum2.PushBack(b);
				Assert::IsTrue(datum1 == datum2);
				Assert::IsFalse(datum1 != datum2);
				datum1.PushBack(c);
				datum2.PushBack(d);
				Assert::IsTrue(datum1 != datum2);
				Assert::IsFalse(datum1 == datum2);
				
			}
			//Pointer
			{
				Foo foo1 = 10;
				Foo foo2 = 20;
				Foo foo3 = 30;
				Foo foo4 = 40;
				RTTI* a = &foo1;
				RTTI* b = &foo2;
				RTTI* c = &foo3;
				RTTI* d = &foo4;
				Datum datum1;
				Datum datum2;
				datum1.PushBack(a);
				datum1.PushBack(b);
				datum2.PushBack(a);
				datum2.PushBack(b);
				Assert::IsTrue(datum1 == datum2);
				Assert::IsFalse(datum1 != datum2);
				datum1.PushBack(c);
				datum2.PushBack(d);
				Assert::IsTrue(datum1 != datum2);
				Assert::IsFalse(datum1 == datum2);
			}
			
		}

		TEST_METHOD(PushBack)
		{
			{
				int a = 1;
				int b = 2;
				int c = 3;
				Datum datum; 
				
				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(1_z, datum.Capacity());
				Assert::AreEqual(DatumTypes::Integer, datum.Type());
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(2_z, datum.Capacity());
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());


				Assert::ExpectException<exception>([&datum] {float d = 1.0f; datum.PushBack(d); });
			}

			{
				float a = 1;
				float b = 2;
				float c = 3;
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(1_z, datum.Capacity());
				Assert::AreEqual(DatumTypes::Float, datum.Type());
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(2_z, datum.Capacity());
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());


				Assert::ExpectException<exception>([&datum] {Foo foo1 = 10; RTTI* d = &foo1; datum.PushBack(d); });
			}

			{
				vec4 a = {1, 1, 1, 1};
				vec4 b = {2, 2, 2, 2};
				vec4 c = {3, 3, 3, 3};
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(1_z, datum.Capacity());
				Assert::AreEqual(DatumTypes::Vector, datum.Type());
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(2_z, datum.Capacity());
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());


				Assert::ExpectException<exception>([&datum] {string d = "error"; datum.PushBack(d); });
			}

			{
				mat4 a = { 1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1};
				mat4 b = { 2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2};
				mat4 c = { 3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3};
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(1_z, datum.Capacity());
				Assert::AreEqual(DatumTypes::Matrix, datum.Type());
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(2_z, datum.Capacity());
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());


				Assert::ExpectException<exception>([&datum] {vec4 d = { 1, 1, 1, 1 }; datum.PushBack(d); });
			}

			{
				string a = "Hello";
				string b = "HI";
				string c = "Goodbye";
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(1_z, datum.Capacity());
				Assert::AreEqual(DatumTypes::String, datum.Type());
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(2_z, datum.Capacity());
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());


				Assert::ExpectException<exception>([&datum] {mat4 d = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }; datum.PushBack(d); });
			}

			{
				Foo foo1 = 10;
				Foo foo2 = 20; 
				Foo foo3 = 30;
				RTTI* a = &foo1;
				RTTI* b = &foo2;
				RTTI* c = &foo3;
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(1_z, datum.Capacity());
				Assert::AreEqual(DatumTypes::Pointer, datum.Type());
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(2_z, datum.Capacity());
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());


				Assert::ExpectException<exception>([&datum] {int d = 1; datum.PushBack(d); });
			}
		}

		TEST_METHOD(Clear)
		{
			{
				int a = 1;
				int b = 2;
				int c = 3;
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				datum.PushBack(b);
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.Clear();
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
			}
		}

		TEST_METHOD(PopBack)
		{
			{
				int a = 1;
				int b = 2;
				int c = 3;
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				datum.PushBack(b);
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
			}
			{
				string a = "Hello1";
				string b = "Hello2";
				string c = "Hello3";
				Datum datum;

				Assert::AreEqual(0_z, datum.Capacity());
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(DatumTypes::Unknown, datum.Type());

				datum.PushBack(a);
				datum.PushBack(b);
				datum.PushBack(c);
				Assert::AreEqual(3_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(2_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(1_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
				datum.PopBack();
				Assert::AreEqual(0_z, datum.Size());
				Assert::AreEqual(4_z, datum.Capacity());
			}
		}

		TEST_METHOD(Set)
		{
			{
				{
					int a = 1;
					int b = 2;
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.Set(a); });
					datum.SetType(DatumTypes::Integer);
					datum.Resize(5);
					datum.Set(a, 0);
					Assert::AreEqual(a, datum.Get<int>(0));
					datum.Set(b, 1);
					Assert::AreEqual(b, datum.Get<int>(1));
					datum.Set(a, 1);
					Assert::AreEqual(a, datum.Get<int>(1));
				}
				{
					int a = 1;
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.SetType(DatumTypes::Pointer); datum.Resize(2); datum.Set(a);});
				}

			}

			{
				{
					float a = 1;
					float b = 2;
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.Set(a); });
					datum.SetType(DatumTypes::Float);
					datum.Resize(5);
					datum.Set(a, 0);
					Assert::AreEqual(a, datum.Get<float>(0));
					datum.Set(b, 1);
					Assert::AreEqual(b, datum.Get<float>(1));
					datum.Set(a, 1);
					Assert::AreEqual(a, datum.Get<float>(1));
				}
				{
					float a = 1;
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.SetType(DatumTypes::Integer); datum.Resize(2); datum.Set(a); });
				}
			}
			{
				{
					vec4 a = { 1, 1, 1, 1 };
					vec4 b = { 2, 2, 2, 2 };
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.Set(a); });
					datum.SetType(DatumTypes::Vector);
					datum.Resize(5);
					datum.Set(a, 0);
					Assert::AreEqual(a, datum.Get<vec4>(0));
					datum.Set(b, 1);
					Assert::AreEqual(b, datum.Get<vec4>(1));
					datum.Set(a, 1);
					Assert::AreEqual(a, datum.Get<vec4>(1));
				}
				{
					vec4 a = {1, 1, 1, 1};
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.SetType(DatumTypes::Float); datum.Resize(2); datum.Set(a); });
				}

			}
			{
				{
					mat4 a = { 1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1};
					mat4 b = { 2, 2, 2, 2,
								2, 2, 2, 2,
								2, 2, 2, 2, 
								2, 2, 2, 2};
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.Set(a); });
					datum.SetType(DatumTypes::Matrix);
					datum.Resize(5);
					datum.Set(a, 0);
					Assert::AreEqual(a, datum.Get<mat4>(0));
					datum.Set(b, 1);
					Assert::AreEqual(b, datum.Get<mat4>(1));
					datum.Set(a, 1);
					Assert::AreEqual(a, datum.Get<mat4>(1));
				}
				{
					mat4 a = { 1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1 };
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.SetType(DatumTypes::Vector); datum.Resize(2); datum.Set(a); });
				}
			}
			{
				{
					string a = "Hi";
					string b = "Bye";
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.Set(a); });
					datum.SetType(DatumTypes::String);
					datum.Resize(5);
					datum.Set(a, 0);
					Assert::AreEqual(a, datum.Get<string>(0));
					datum.Set(b, 1);
					Assert::AreEqual(b, datum.Get<string>(1));
					datum.Set(a, 1);
					Assert::AreEqual(a, datum.Get<string>(1));
				}
				{
					string a = "Hi";
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.SetType(DatumTypes::Matrix); datum.Resize(2); datum.Set(a); });
				}
			}
			{
				{
					Foo foo1 = 1;
					Foo foo2 = 2;
					RTTI* a = &foo1;
					RTTI* b = &foo2;
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.Set(a); });
					datum.SetType(DatumTypes::Pointer);
					datum.Resize(5);
					datum.Set(a, 0);
					Assert::AreEqual(a, datum.Get<RTTI*>(0));
					datum.Set(b, 1);
					Assert::AreEqual(b, datum.Get<RTTI*>(1));
					datum.Set(a, 1);
					Assert::AreEqual(a, datum.Get<RTTI*>(1));
				}
				{
					Foo foo1 = 1;
					RTTI* a = &foo1;
					Datum datum;
					Assert::ExpectException<exception>([&datum, &a] {datum.SetType(DatumTypes::String); datum.Resize(2); datum.Set(a); });
				}
			}
		}

		TEST_METHOD(Get)
		{
			{
				//int
				{
					int a = 1;
					Datum datum = a;
					Assert::AreEqual(a, datum.Get<int>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<int>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<RTTI*>(0); });
				}
				{
					int a = 1;
					const Datum datum = a;
					Assert::AreEqual(a, datum.Get<int>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<int>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<RTTI*>(0); });
				}
				//float
				{
					float a = 1;
					Datum datum = a;
					Assert::AreEqual(a, datum.Get<float>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<float>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<int>(0); });
				}
				{
					float a = 1;
					const Datum datum = a;
					Assert::AreEqual(a, datum.Get<float>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<float>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<int>(0); });
				}
				//vector
				{
					vec4 a = { 1, 1, 1, 1 };
					Datum datum = a;
					Assert::AreEqual(a, datum.Get<vec4>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<vec4>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<float>(0); });
				}
				{
					vec4 a = { 1, 1, 1, 1 };
					const Datum datum = a;
					Assert::AreEqual(a, datum.Get<vec4>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<vec4>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<float>(0); });
				}
				//matrix
				{
					mat4 a = { 1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1 };
					Datum datum = a;
					Assert::AreEqual(a, datum.Get<mat4>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<mat4>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<vec4>(0); });
				}
				{
					mat4 a = { 1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1 };
					const Datum datum = a;
					Assert::AreEqual(a, datum.Get<mat4>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<mat4>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<vec4>(0); });
				}
				//string
				{
					string a = "string";
					Datum datum = a;
					Assert::AreEqual(a, datum.Get<string>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<string>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<mat4>(0); });
				}
				{
					string a = "string";
					const Datum datum = a;
					Assert::AreEqual(a, datum.Get<string>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<string>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<mat4>(0); });
				}
				//Pointer
				{
					Foo foo = 1;
					RTTI* a = &foo;
					Datum datum = a;
					Assert::AreEqual(a, datum.Get<RTTI*>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<RTTI*>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<string>(0); });
				}
				{
					Foo foo = 1;
					RTTI* a = &foo;
					const Datum datum = a;
					Assert::AreEqual(a, datum.Get<RTTI*>(0));
					Assert::ExpectException<exception>([&datum] {datum.Get<RTTI*>(1); });
					Assert::ExpectException<exception>([&datum] {datum.Get<string>(0); });
				}
			}
		}
		TEST_METHOD(FrontandBack)
		{
			//int 
			{
				int a = 1;
				Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<int>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<int>(); });
				datum.PushBack(a);
				Assert::AreEqual(a, datum.Front<int>());
				Assert::AreEqual(a, datum.Back<int>());
				Assert::ExpectException<exception>([&datum] {datum.Front<RTTI*>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<RTTI*>(); });
			}
			{
				const Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<int>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<int>(); });
			}
			{
				int a = 1;
				const Datum datum = a;
				Assert::AreEqual(a, datum.Front<int>());
				Assert::AreEqual(a, datum.Back<int>());
				Assert::ExpectException<exception>([&datum] {datum.Front<RTTI*>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<RTTI*>(); });
			}
			//Float
			{
				float a = 1;
				Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<float>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<float>(); });
				datum.PushBack(a);
				Assert::AreEqual(a, datum.Front<float>());
				Assert::AreEqual(a, datum.Back<float>());
				Assert::ExpectException<exception>([&datum] {datum.Front<int>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<int>(); });
			}
			{
				const Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<float>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<float>(); });
			}
			{
				float a = 1;
				const Datum datum = a;
				Assert::AreEqual(a, datum.Front<float>());
				Assert::AreEqual(a, datum.Back<float>());
				Assert::ExpectException<exception>([&datum] {datum.Front<int>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<int>(); });
			}
			//Vector
			{
				vec4 a = {1, 1, 1, 1};
				Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<vec4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<vec4>(); });
				datum.PushBack(a);
				Assert::AreEqual(a, datum.Front<vec4>());
				Assert::AreEqual(a, datum.Back<vec4>());
				Assert::ExpectException<exception>([&datum] {datum.Front<float>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<float>(); });
			}
			{
				const Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<vec4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<vec4>(); });
			}
			{
				vec4 a = { 1, 1, 1, 1 };
				const Datum datum = a;
				Assert::AreEqual(a, datum.Front<vec4>());
				Assert::AreEqual(a, datum.Back<vec4>());
				Assert::ExpectException<exception>([&datum] {datum.Front<float>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<float>(); });
			}
			//matrix
			{
				mat4 a = { 1, 1, 1, 1, 
							1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1};
				Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<mat4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<mat4>(); });
				datum.PushBack(a);
				Assert::AreEqual(a, datum.Front<mat4>());
				Assert::AreEqual(a, datum.Back<mat4>());
				Assert::ExpectException<exception>([&datum] {datum.Front<vec4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<vec4>(); });
			}
			{
				const Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<mat4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<mat4>(); });
			}
			{
				mat4 a = { 1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1 };
				const Datum datum = a;
				Assert::AreEqual(a, datum.Front<mat4>());
				Assert::AreEqual(a, datum.Back<mat4>());
				Assert::ExpectException<exception>([&datum] {datum.Front<vec4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<vec4>(); });
			}
			//string
			{
				string a = "Hello";
				Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<string>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<string>(); });
				datum.PushBack(a);
				Assert::AreEqual(a, datum.Front<string>());
				Assert::AreEqual(a, datum.Back<string>());
				Assert::ExpectException<exception>([&datum] {datum.Front<mat4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<mat4>(); });
			}
			{
				const Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<string>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<string>(); });
			}
			{
				string a = "Hello";
				const Datum datum = a;
				Assert::AreEqual(a, datum.Front<string>());
				Assert::AreEqual(a, datum.Back<string>());
				Assert::ExpectException<exception>([&datum] {datum.Front<mat4>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<mat4>(); });
			}
			//Pointer
			{
				Foo foo = 1;
				RTTI* a = &foo;
				Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<RTTI*>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<RTTI*>(); });
				datum.PushBack(a);
				Assert::AreEqual(a, datum.Front<RTTI*>());
				Assert::AreEqual(a, datum.Back<RTTI*>());
				Assert::ExpectException<exception>([&datum] {datum.Front<string>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<string>(); });
			}
			{
				const Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.Front<RTTI*>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<RTTI*>(); });
			}
			{
				Foo foo = 1;
				RTTI* a = &foo;
				const Datum datum = a;
				Assert::AreEqual(a, datum.Front<RTTI*>());
				Assert::AreEqual(a, datum.Back<RTTI*>());
				Assert::ExpectException<exception>([&datum] {datum.Front<string>(); });
				Assert::ExpectException<exception>([&datum] {datum.Back<string>(); });
			}

		}

		TEST_METHOD(Remove)
		{
			{
				int a = 1;
				int b = 2; 
				int c = 3;
				Datum datum; 
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsFalse(datum.Find(c).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Remove(a));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsFalse(datum.Remove(c));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsTrue(datum.Remove(b));
				Assert::AreEqual(0_z, datum.Size());
			}

			{
				float a = 1;
				float b = 2;
				float c = 3;
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsFalse(datum.Find(c).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Remove(a));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsFalse(datum.Remove(c));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsTrue(datum.Remove(b));
				Assert::AreEqual(0_z, datum.Size());
			}

			{
				vec4 a = {1, 1, 1, 1};
				vec4 b = {2, 2, 2, 2};
				vec4 c = {3, 3, 3, 3};
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsFalse(datum.Find(c).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Remove(a));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsFalse(datum.Remove(c));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsTrue(datum.Remove(b));
				Assert::AreEqual(0_z, datum.Size());
			}
			{
				mat4 a = { 1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1 };
				mat4 b = { 2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2 };
				mat4 c = { 3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3};
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsFalse(datum.Find(c).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Remove(a));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsFalse(datum.Remove(c));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsTrue(datum.Remove(b));
				Assert::AreEqual(0_z, datum.Size());
			}
			{
				string a = "Hello1";
				string b = "Hello2";
				string c = "Hello3";
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsFalse(datum.Find(c).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Remove(a));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsFalse(datum.Remove(c));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsTrue(datum.Remove(b));
				Assert::AreEqual(0_z, datum.Size());
			}
			{
				Foo foo1 = 1;
				Foo foo2 = 2;
				Foo foo3 = 3;
				RTTI* a = &foo1;
				RTTI* b = &foo2;
				RTTI* c = &foo3;
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsFalse(datum.Find(c).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Remove(a));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsFalse(datum.Remove(c));
				Assert::AreEqual(1_z, datum.Size());
				Assert::IsTrue(datum.Remove(b));
				Assert::AreEqual(0_z, datum.Size());
			}
		}

		TEST_METHOD(RemoveAt)
		{
			{
				int a = 1;
				int b = 2;
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::ExpectException<exception>([&datum] {datum.RemoveAt(2);});
				datum.RemoveAt(0);
				Assert::AreEqual(1_z, datum.Size());
				datum.RemoveAt(0);
				Assert::AreEqual(0_z, datum.Size());
			}
			{
				string a = "Hello1";
				string b = "Hello2";
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(b).first);
				Assert::AreEqual(2_z, datum.Size());
				Assert::ExpectException<exception>([&datum] {datum.RemoveAt(2); });
				datum.RemoveAt(0);
				Assert::AreEqual(1_z, datum.Size());
				datum.RemoveAt(0);
				Assert::AreEqual(0_z, datum.Size());
			}
		}

		TEST_METHOD(Find)
		{
			{
				int a = 1;
				int b = 2;
				int c = 3;
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(a).second == 0);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsTrue(datum.Find(b).second == 1);
				Assert::IsFalse(datum.Find(c).first);
			}

			{
				float a = 1;
				float b = 2;
				float c = 3;
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(a).second == 0);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsTrue(datum.Find(b).second == 1);
				Assert::IsFalse(datum.Find(c).first);
			}

			{
				vec4 a = { 1, 1, 1, 1 };
				vec4 b = { 2, 2, 2, 2 };
				vec4 c = { 3, 3, 3, 3 };
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(a).second == 0);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsTrue(datum.Find(b).second == 1);
				Assert::IsFalse(datum.Find(c).first);
			}
			{
				mat4 a = { 1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1,
								1, 1, 1, 1 };
				mat4 b = { 2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2,
							2, 2, 2, 2 };
				mat4 c = { 3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3,
							3, 3, 3, 3 };
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(a).second == 0);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsTrue(datum.Find(b).second == 1);
				Assert::IsFalse(datum.Find(c).first);
			}
			{
				string a = "Hello1";
				string b = "Hello2";
				string c = "Hello3";
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(a).second == 0);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsTrue(datum.Find(b).second == 1);
				Assert::IsFalse(datum.Find(c).first);
			}
			{
				Foo foo1 = 1;
				Foo foo2 = 2;
				Foo foo3 = 3;
				RTTI* a = &foo1;
				RTTI* b = &foo2;
				RTTI* c = &foo3;
				Datum datum;
				datum.PushBack(a);
				datum.PushBack(b);
				Assert::AreEqual(2_z, datum.Size());
				Assert::IsTrue(datum.Find(a).first);
				Assert::IsTrue(datum.Find(a).second == 0);
				Assert::IsTrue(datum.Find(b).first);
				Assert::IsTrue(datum.Find(b).second == 1);
				Assert::IsFalse(datum.Find(c).first);
				
			}
		}
		TEST_METHOD(ToString)
		{
			//exceptions
			{
				Datum datum; 
				Assert::ExpectException<exception>([&datum] {datum.ToString(0); });
				datum.SetType(DatumTypes::Pointer);
				Assert::ExpectException<exception>([&datum] {datum.ToString(0); });
			}
			{
				Datum datum;
				datum.SetType(DatumTypes::Integer);
				Assert::ExpectException<exception>([&datum] {datum.ToString(0); });
			}
			{
				string s = "1";
				int a = 1;
				Datum datum = a;	
				Assert::AreEqual(s, datum.ToString(0));
			}
			{
				string s = "1.500000";
				float a = 1.5f;
				Datum datum = a;
				Assert::AreEqual(s, datum.ToString(0));
			}
			{
				string s = "vec4(1.500000, 1.500000, 1.500000, 1.500000)";
				vec4 a = {1.5f, 1.5f, 1.5f, 1.5f};
				Datum datum = a;
				Assert::AreEqual(s, datum.ToString(0));
			}
			{
				string s = "mat4x4((1.500000, 1.500000, 1.500000, 1.500000), (1.500000, 1.500000, 1.500000, 1.500000), (1.500000, 1.500000, 1.500000, 1.500000), (1.500000, 1.500000, 1.500000, 1.500000))";
				mat4 a = { 1.5f, 1.5f, 1.5f, 1.5f,
							1.5f, 1.5f, 1.5f, 1.5f, 
							1.5f, 1.5f, 1.5f, 1.5f, 
							1.5f, 1.5f, 1.5f, 1.5f};
				Datum datum = a;
				Assert::AreEqual(s, datum.ToString(0));
			}
			{
				string s = "Hello";
				string a = "Hello";
				Datum datum = a;
				Assert::AreEqual(s, datum.ToString(0));
			}
		}

		TEST_METHOD(SetFromString)
		{
			//exceptions
			{
				Datum datum;
				Assert::ExpectException<exception>([&datum] {datum.SetFromString("s", 0); });
				datum.SetType(DatumTypes::Pointer);
				Assert::ExpectException<exception>([&datum] {datum.SetFromString("s", 0); });
			}
			{
				Datum datum;
				datum.SetType(DatumTypes::Integer);
				Assert::ExpectException<exception>([&datum] {datum.SetFromString("1", 0); });
			}
			//int 
			{
				string s = "1";
				int a = 1;
				Datum datum; 
				datum.SetType(DatumTypes::Integer);
				datum.Resize(1);
				datum.SetFromString(s, 0);
				Assert::AreEqual(a, datum.Get<int>(0));
			}
			//float 
			{
				string s = "1.000000f";
				float a = 1.0f;
				Datum datum;
				datum.SetType(DatumTypes::Float);
				datum.Resize(1);
				datum.SetFromString(s, 0);
				Assert::AreEqual(a, datum.Get<float>(0));
			}
			//vector 
			{
				string s = "vec4(1.000000, 1.000000, 1.000000, 1.000000)";
				vec4 a = {1.0f, 1.0f, 1.0f, 1.0f};
				Datum datum;
				datum.SetType(DatumTypes::Vector);
				datum.Resize(1);
				datum.SetFromString(s, 0);
				Assert::AreEqual(a, datum.Get<vec4>(0));
			}
			//vector 
			{
				string s = "mat4x4((1.500000, 1.500000, 1.500000, 1.500000), (1.500000, 1.500000, 1.500000, 1.500000), (1.500000, 1.500000, 1.500000, 1.500000), (1.500000, 1.500000, 1.500000, 1.500000))";
				mat4 a = { 1.5f, 1.5f, 1.5f, 1.5f,
							1.5f, 1.5f, 1.5f, 1.5f, 
							1.5f, 1.5f, 1.5f, 1.5f, 
							1.5f, 1.5f, 1.5f, 1.5f};
				Datum datum;
				datum.SetType(DatumTypes::Matrix);
				datum.Resize(1);
				datum.SetFromString(s, 0);
				Assert::AreEqual(a, datum.Get<mat4>(0));
			}
			//string
			{
				string s = "Hello";
				string a = "Hello";
				Datum datum;
				datum.SetType(DatumTypes::String);
				datum.Resize(1);
				datum.SetFromString(s, 0);
				Assert::AreEqual(a, datum.Get<string>(0));
			}

		}
		TEST_METHOD(ExternalFails)
		{
			{
				int i = 1;
				float f = 1.0f;
				vec4 vec = {1, 1, 1, 1};
				mat4 mat = { 1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1,
							1, 1, 1, 1,};
				string s = "Hello";
				Foo foo = 10;
				RTTI* r = &foo;
				Datum datum;
				datum.SetStorage(&i, 1);
				//push back 
				Assert::ExpectException<exception>([&datum, &i] {datum.PushBack(i); });
				Assert::ExpectException<exception>([&datum, &f] {datum.PushBack(f); });
				Assert::ExpectException<exception>([&datum, &vec] {datum.PushBack(vec); });
				Assert::ExpectException<exception>([&datum, &mat] {datum.PushBack(mat); });
				Assert::ExpectException<exception>([&datum, &s] {datum.PushBack(s); });
				Assert::ExpectException<exception>([&datum, &r] {datum.PushBack(r); });

				Assert::ExpectException<exception>([&datum] {datum.PopBack(); });
				Assert::ExpectException<exception>([&datum] {datum.Clear(); });

				//Find
				Assert::ExpectException<exception>([&datum, &i] {datum.Find(i); });
				Assert::ExpectException<exception>([&datum, &f] {datum.Find(f); });
				Assert::ExpectException<exception>([&datum, &vec] {datum.Find(vec); });
				Assert::ExpectException<exception>([&datum, &mat] {datum.Find(mat); });
				Assert::ExpectException<exception>([&datum, &s] {datum.Find(s); });
				Assert::ExpectException<exception>([&datum, &r] {datum.Find(r); });

				//Remove
				Assert::ExpectException<exception>([&datum, &i] {datum.Remove(i); });
				Assert::ExpectException<exception>([&datum, &f] {datum.Remove(f); });
				Assert::ExpectException<exception>([&datum, &vec] {datum.Remove(vec); });
				Assert::ExpectException<exception>([&datum, &mat] {datum.Remove(mat); });
				Assert::ExpectException<exception>([&datum, &s] {datum.Remove(s); });
				Assert::ExpectException<exception>([&datum, &r] {datum.Remove(r); });
				Assert::ExpectException<exception>([&datum, &i] {datum.RemoveAt(0); });

				//resizing 
				Assert::ExpectException<exception>([&datum, &i] {datum.Resize(10); });
				Assert::ExpectException<exception>([&datum, &i] {datum.Reserve(10); });
				Assert::ExpectException<exception>([&datum, &i] {datum.ShrinkToFit(); });
			}
			//test all exceptions for if list is external.
		}

	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState DatumTests::_startMemState;
}