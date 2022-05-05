#include "pch.h"
#include "Foo.h"
#include "RTTI.h"
#include "Scope.h"
#include "Datum.h"


using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;


namespace UnitTestLibraryDesktop
{


	TEST_CLASS(ScopeTests)
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
			Scope scope{10};
			Scope* parent = nullptr;
			Assert::AreEqual(parent, scope.GetParent());
		}

		TEST_METHOD(CopyConstructor)
		{

			{
				Scope* scope1 = new Scope;
				Scope scope2 = *scope1;
				Assert::IsTrue(*scope1 == scope2);
				delete scope1;

			}

			{
				Scope* scope1 = new Scope;
				Scope* childScope = new Scope;
				string s = "name";
				string s1 = "damage";
				int damage = 10;

				scope1->Adopt(s, *childScope);
				scope1->Append(s1) = damage;

				Scope scope2 = *scope1;
				Assert::IsTrue(*scope1 == scope2);
				delete scope1;
			}

		}

		TEST_METHOD(CopyAssignment)
		{
			{
				Scope* scope1 = new Scope;
				Scope* scope2 = new Scope;
				*scope2 = *scope1;
				Assert::IsTrue(*scope1 == *scope2);
				delete scope1;
				delete scope2;

			}

			{
				Scope* scope1 = new Scope;
				Scope* childScope = new Scope;
				Scope* otherChildScope = new Scope;
				string s = "name";
				string s1 = "damage";
				string s2 = "DOB";
				int damage = 10;
			
				scope1->Adopt(s, *childScope);
				scope1->Append(s1) = damage;
			
				Scope* scope2 = new Scope;
				scope2->Adopt(s2, *otherChildScope);
				*scope2 = *scope1;
				Assert::IsTrue(*scope1 == *scope2);
				delete scope1;
				delete scope2;
			
			}
		}

		TEST_METHOD(MoveSemantics)
		{
			Scope root;
			root.Append("name");
			Scope* child = new Scope;
			root.Adopt("child",  *child);

			Scope& returnedChild = child->AppendScope("child");
			Scope* returnedChild2 = new Scope;
			child->Append("damage") = 3;
			child->Adopt("child2", *returnedChild2);
			child->Append("transform") = glm::mat4(29.f);

			Scope* movedScope = new Scope(std::move(*child));
			Assert::AreEqual((root.FindContainedScope(movedScope).first)->Get<Scope*>(), movedScope);
			Assert::IsNull(root.FindContainedScope(child).first);
			Assert::AreEqual(returnedChild.GetParent(), movedScope);
			Assert::AreEqual(returnedChild2->GetParent(), movedScope);
			delete child;

			Scope anotherMovedScope;
			anotherMovedScope.Append("Class") = "paladin";
			anotherMovedScope = std::move(*movedScope);
			
			Assert::AreEqual((root.FindContainedScope(&anotherMovedScope).first)->Get<Scope*>(), &anotherMovedScope);
			Assert::IsNull(root.FindContainedScope(movedScope).first);
			Assert::AreEqual(returnedChild.GetParent(), &anotherMovedScope);
			Assert::AreEqual(returnedChild2->GetParent(), &anotherMovedScope);
			
			delete movedScope;
			
		}

		TEST_METHOD(OperatorBracket)
		{
			//index 
			{
				string s = "name";
				string s2 = "address";
				string s3 = "nathan";
				string s4 = "hello road.";
				Scope scope;
				auto pair = std::make_pair(s, Datum());
				Datum& datum = scope.Append(s);
				datum = s3;
				Datum& datum2 = scope.Append(s2);
				datum2 = s4;
				Assert::IsTrue(datum == scope[0]);
				Assert::IsTrue(datum2 == scope[1]);

				Assert::ExpectException<exception>([&scope] {scope[2]; });
			}
			//key
			{
				string s = "name";
				string s2 = "address";
				string s3 = "nathan";
				string s4 = "hello road.";
				Scope scope;
				auto pair = std::make_pair(s, Datum());
				Datum& datum = scope[s];
				datum = s3;
				Datum& datum2 = scope[s2];
				datum = s4;
				Assert::IsTrue(datum == scope[0]);
				Assert::IsTrue(datum2 == scope[1]);

			}
			{
				const Scope scope;
				Assert::ExpectException<exception>([&scope] {scope[0]; });
			}
		
		}

		TEST_METHOD(ComparisonOperators)
		{
			{
				string s1 = "name";
				string s2 = "damage";
				string s3 = "level";
				string s4 = "Nathan";
				float damage = 10.5f;
				int level = 2;  
				Scope scope1{15};
				Scope scope2{15};
				Assert::IsFalse(scope1 != scope2);
				Assert::IsTrue(scope1 == scope2);

				scope1.Append(s1) = s4;
				Assert::IsTrue(scope1 != scope2);
				Assert::IsFalse(scope1 == scope2);
			
				scope1.Append(s2) = damage;
				scope1.Append(s3) = level;

				scope2.Append(s3) = level;
				scope2.Append(s2) = damage;
				scope2.Append(s1) = s4;

				Assert::IsTrue(scope1 == scope2);
				Assert::IsFalse(scope1 != scope2);
			}

			{
				string s1 = "name";
				string s2 = "damage";
				string s3 = "level";
				string s4 = "Nathan";
				float damage = 10.5f;
				float damage2 = 1.0f;
				int level = 2;
				Scope scope1{ 15 };
				Scope scope2{ 15 };
				Assert::IsFalse(scope1 != scope2);
				Assert::IsTrue(scope1 == scope2);

				scope1.Append(s1) = s4;
				Assert::IsTrue(scope1 != scope2);
				Assert::IsFalse(scope1 == scope2);

				scope1.Append(s2) = damage;
				scope1.Append(s3) = level;

				scope2.Append(s3) = level;
				scope2.Append(s2) = damage2;
				scope2.Append(s1) = s4;

				Assert::IsTrue(scope1 != scope2);
				Assert::IsFalse(scope1 == scope2);
			}

			{
				string s1 = "name";
				string s2 = "damage";
				string s5 = "RandomString";
				string s3 = "level";
				string s4 = "Nathan";
				float damage = 10.5f;
				int level = 2;
				Scope scope1{ 15 };
				Scope scope2{ 15 };
				Assert::IsFalse(scope1 != scope2);
				Assert::IsTrue(scope1 == scope2);

				scope1.Append(s1) = s4;
				Assert::IsTrue(scope1 != scope2);
				Assert::IsFalse(scope1 == scope2);

				scope1.Append(s2) = damage;
				scope1.Append(s3) = level;

				scope2.Append(s3) = level;
				scope2.Append(s5) = damage;
				scope2.Append(s1) = s4;

				Assert::IsTrue(scope1 != scope2);
				Assert::IsFalse(scope1 == scope2);
			}
		}

		TEST_METHOD(Find)
		{
			{
				Scope scope; 
				string s = "Name";
				Datum* datum = nullptr;
				Assert::AreEqual(datum, scope.Find(s));
				scope.Append(s);
				datum = scope.Find(s);
				Assert::AreEqual(*datum, scope[s]);
			}

			{
				const Scope scope;
				string s = "Name";
				const Datum* datum = nullptr;
				Assert::AreEqual(datum, scope.Find(s));
				
			}

			{
				string s = "Name";
				const Scope scope{s};
				const Datum* datum = scope.Find(s);
				Assert::AreEqual(*datum, scope[0]);

			}

		}

		TEST_METHOD(Search)
		{
			{
				{
					Scope* parent = new Scope; 
					Scope* child = new Scope;
					Scope* grandChild = new Scope;
					string s = "name";
					string s1 = "address";
					parent->Adopt(s, *child);
					child->Adopt(s1, *grandChild);
					Datum* search = grandChild->Search(s);
					Datum* find = parent->Find(s);
					Assert::AreEqual(find, search);
					delete parent;
				}
				//need const tests
				{
					Scope* parent = new Scope;
					Scope* child = new Scope;
					Scope* grandChild = new Scope;
					string s = "name";
					string s1 = "address";
					parent->Adopt(s, *child);
					child->Adopt(s1, *grandChild);
					const Scope* constScope = grandChild;
					const Scope* constParent = parent;
					const Datum* search = constScope->Search(s);
					const Datum* find = constParent->Find(s);
					Assert::AreEqual(find, search);
					delete parent;
				}
			}

			{
				{
					Scope* parent = new Scope;
					Scope* child = new Scope;
					Scope* grandChild = new Scope;
					Scope* foundScope;
					string s = "name";
					string s1 = "address";
					parent->Adopt(s, *child);
					child->Adopt(s1, *grandChild);
					Datum* search = grandChild->Search(s, foundScope);
					Datum* find = parent->Find(s);
					Assert::AreEqual(find, search);
					Assert::AreEqual(foundScope, parent);
					delete parent;
				}
				//need const test
				{
					Scope* parent = new Scope;
					Scope* child = new Scope;
					Scope* grandChild = new Scope;
					const Scope* foundScope;
					string s = "name";
					string s1 = "address";
					parent->Adopt(s, *child);
					child->Adopt(s1, *grandChild);
					const Scope* constScope = grandChild;
					const Scope* constParent = parent;
					const Datum* search = constScope->Search(s, foundScope);
					const Datum* find = constParent->Find(s);
					Assert::AreEqual(find, search);
					Assert::AreEqual(foundScope, constParent);
					delete parent;
				}
			}
		}

		TEST_METHOD(Append)
		{
			{
				string s = "name";
				string s2 = "Damage";
				string s3 = "Nathan";
				float damage = 10.0f;
				Scope scope; 
				Datum& datum = scope.Append(s);
				datum = s3;
				
				Assert::AreEqual(datum, scope[0]);
				Assert::IsTrue(datum == scope[0]);
				
				Datum& datum2 = scope.Append(s);
				Assert::AreEqual(datum2, scope[0]);
				Assert::IsTrue(datum2 == scope[0]);
				Assert::IsTrue(datum == datum2);
				
				Datum& datum3 = scope.Append(s2);
				datum3 = damage;
				Assert::AreEqual(datum3, scope[1]);
				Assert::IsTrue(datum3 == scope[1]);

				Assert::ExpectException<std::exception>([&scope] { scope.Append(""s); });
			}
		}

		TEST_METHOD(AppendScope)
		{
			{
				Scope* parent = new Scope; 
				string s = "name";
				Scope& child = parent->AppendScope(s);
				Assert::AreEqual(child.GetParent(), parent);

				Scope& child2 = parent->AppendScope(s);
				Assert::AreEqual(child2.GetParent(), parent);
				
				delete parent;
			}

			{
				Scope* parent = new Scope;
				string s = "name";
				string s1 = "Nathan";
				parent->Append(s) = s1;
				Assert::ExpectException<exception>([&parent, &s] {parent->AppendScope(s); });
				Assert::ExpectException<std::exception>([&parent] { parent->AppendScope(""s); });
				delete parent;
			}
		}

		TEST_METHOD(Adopt)
		{
			{
				Scope* parent = new Scope;
				Scope* parent2 = new Scope;
				Scope* child = new Scope;
				Scope* child2 = new Scope;
				Scope* child3 = new Scope;
				string s = "Name";
		
				parent->Adopt(s, *child);
				Assert::AreEqual(child->GetParent(), parent);

				parent2->Adopt(s, *child);
				Assert::AreEqual(child->GetParent(), parent2);

				parent2->Adopt(s, *child2);
				Assert::AreEqual(child2->GetParent(), parent2);

				Assert::ExpectException<std::exception>([&parent, &child3] { parent->Adopt(""s, *child3); });
				delete child3;
				delete parent;
				delete parent2;

			}


			{
				Scope* parent = new Scope;
				string s = "name";
				Assert::ExpectException<exception>([&parent, &s] {parent->Adopt(s, *parent); });
				delete parent; 
			}

			{
				Scope* parent = new Scope;
				Scope* child = new Scope;
				string s = "Name";
				string s1 = "Nathan";
				parent->Append(s) = s1;
				Assert::ExpectException<exception>([&parent, &s, &child] {parent->Adopt(s, *child);});
				delete parent;
				delete child;
			}

		}

		TEST_METHOD(GetParent)
		{
			Scope* parent = new Scope;
			Scope* child = new Scope;
			string s = "name";
			parent->Adopt(s, *child);
			Assert::AreEqual(parent, child->GetParent());
			delete parent;
		}

		TEST_METHOD(Equals)
		{
			Scope* scope1 = new Scope;
			Scope* scope2 = new Scope;
			Foo foo(1);
			RTTI* r = &foo;
			Assert::IsTrue(scope1->Equals(scope2));

			Assert::IsFalse(scope1->Equals(r));
			delete scope1;
			delete scope2;
		}

		TEST_METHOD(FindContainedScope)
		{
			Scope* parent = new Scope;
			Scope* child = new Scope;
			string s = "name";
			parent->Adopt(s, *child);
			auto [datum, index] = parent->FindContainedScope(child);
			Assert::AreEqual(datum->Get<Scope*>(), child);
			Assert::AreEqual(0_z, index);
			delete parent;
		}

		TEST_METHOD(IsAncestorOf)
		{
			Scope* parent = new Scope;
			Scope* child = new Scope;
			string s = "name";
			parent->Adopt(s, *child);
			Assert::IsTrue(parent->IsAncestorOf(*child));
			delete parent;
		}


		TEST_METHOD(IsDescendantOf)
		{
			Scope* parent = new Scope;
			Scope* child = new Scope;
			string s = "name";
			parent->Adopt(s, *child);
			Assert::IsTrue(child->IsDescendantOf(*parent));
			delete parent;
		}


	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState ScopeTests::_startMemState;
}