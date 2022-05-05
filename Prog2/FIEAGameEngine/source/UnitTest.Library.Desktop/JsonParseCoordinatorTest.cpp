#include "pch.h"
#include "JsonParseCoordinator.h"
#include "IJsonParseHelper.h"
#include "JsonTestParseHelper.h"
#include "JsonIntegerParseHelper.h"
#include "Foo.h"
#include <fstream>

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;
using namespace std::string_literals;


namespace UnitTestLibraryDesktop
{
	TEST_CLASS(JsonParseCoordinatorTest)
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

		TEST_METHOD(JsoParseTestHelperRTTI)
		{
			JsonTestParseHelper helper;

			RTTI* rtti = &helper;
			Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(JsonTestParseHelper::TypeIdClass()));
			Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
			Assert::AreEqual(JsonTestParseHelper::TypeIdClass(), rtti->TypeIdInstance());

			Foo* f = rtti->As<Foo>();
			Assert::IsNull(f);

			JsonTestParseHelper* h = rtti->As<JsonTestParseHelper>();
			Assert::IsNotNull(h);
			Assert::AreEqual(&helper, h);
		}

		TEST_METHOD(JsoParseTestHelperSharedDataRTTI)
		{
			JsonTestParseHelper::SharedData sharedData;

			RTTI* rtti = &sharedData;
			Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(JsonTestParseHelper::SharedData::TypeIdClass()));
			Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
			Assert::AreEqual(JsonTestParseHelper::SharedData::TypeIdClass(), rtti->TypeIdInstance());

			Foo* f = rtti->As<Foo>();
			Assert::IsNull(f);

			JsonTestParseHelper::SharedData* h = rtti->As<JsonTestParseHelper::SharedData>();
			Assert::IsNotNull(h);
			Assert::AreEqual(&sharedData, h);
		}

		TEST_METHOD(Constructor)
		{
			JsonTestParseHelper::SharedData sharedData; 
			JsonParseCoordinator parseCoordinator(sharedData);
			Assert::IsFalse(parseCoordinator.IsClone());
			Assert::AreEqual(0_z, parseCoordinator.Helpers().Size());
			Assert::AreEqual(&sharedData, parseCoordinator.GetSharedData()->As<JsonTestParseHelper::SharedData>());

			JsonTestParseHelper testParseHelper;
			parseCoordinator.AddHelper(testParseHelper);
			Assert::AreEqual(1_z, parseCoordinator.Helpers().Size());

			Assert::AreEqual(&sharedData, parseCoordinator.GetSharedData()->As<JsonTestParseHelper::SharedData>());
			Assert::AreEqual(&parseCoordinator, sharedData.GetJsonParseCoordinator());
		
			const auto& constSharedData = sharedData;
			Assert::AreEqual(const_cast<const JsonParseCoordinator*>(&parseCoordinator), constSharedData.GetJsonParseCoordinator());

			const auto& constParseCoordinator = parseCoordinator;
			Assert::AreEqual(const_cast<const JsonTestParseHelper::SharedData*>(&sharedData), constParseCoordinator.GetSharedData()->As<JsonTestParseHelper::SharedData>());

			JsonTestParseHelper::SharedData anotherSharedData;
			parseCoordinator.SetSharedData(&anotherSharedData);
			Assert::AreEqual(&anotherSharedData, parseCoordinator.GetSharedData()->As<JsonTestParseHelper::SharedData>());
		}

		TEST_METHOD(MoveSemantics)
		{
			JsonTestParseHelper::SharedData sharedData;
			JsonTestParseHelper testParseHelper;

			{
				JsonParseCoordinator parseCoordinator(sharedData);
				parseCoordinator.AddHelper(testParseHelper);

				//move constructor 
				JsonParseCoordinator otherParseCoordinator = std::move(parseCoordinator);
				Assert::IsFalse(otherParseCoordinator.IsClone());
				Assert::AreEqual(1_z, otherParseCoordinator.Helpers().Size());
				Assert::AreEqual(&sharedData, otherParseCoordinator.GetSharedData()->As<JsonTestParseHelper::SharedData>());
				Assert::AreEqual(&otherParseCoordinator, sharedData.GetJsonParseCoordinator());
			}

			{
				JsonParseCoordinator parseCoordinator(sharedData);
				parseCoordinator.AddHelper(testParseHelper);

				//move assignment operator 
				JsonTestParseHelper::SharedData  otherSharedData;
				JsonParseCoordinator otherParseCoordinator(otherSharedData);
				otherParseCoordinator = std::move(parseCoordinator);
				Assert::IsFalse(otherParseCoordinator.IsClone());
				Assert::AreEqual(1_z, otherParseCoordinator.Helpers().Size());
				Assert::AreEqual(&sharedData, otherParseCoordinator.GetSharedData()->As<JsonTestParseHelper::SharedData>());
				Assert::AreEqual(&otherParseCoordinator, sharedData.GetJsonParseCoordinator());
			}
		}

		TEST_METHOD(ParseFromString)
		{
			string inputString = R"(
			{ 
				"Address":
				{
					"table" : 
					{
						"Street":
						{
							"string" : "123 Anystreet St."
						}
					}
				}
			})"s;

			JsonTestParseHelper::SharedData sharedData;
			JsonTestParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);
			
			Assert::IsFalse(testParseHelper._initializedCall);
			parseCoordinator.Initialize();
			Assert::IsTrue(testParseHelper._initializedCall);

			Assert::AreEqual(0_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(0_z, testParseHelper._endHandlerCount);
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(0_z, sharedData._maxDepth);

			parseCoordinator.Parse(inputString);

			
			Assert::AreEqual(4_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(4_z, testParseHelper._endHandlerCount);
			
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(4_z, sharedData._maxDepth);
		}

		TEST_METHOD(ParseFromStream)
		{
			stringstream inputStream;
			inputStream << R"(
			{
				"Health" : 
				{
					"integer" : 100
				}
			})"s;

			JsonTestParseHelper::SharedData sharedData; 
			JsonTestParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);

			Assert::IsFalse(testParseHelper._initializedCall);
			parseCoordinator.Initialize();
			Assert::IsTrue(testParseHelper._initializedCall);

			parseCoordinator.Parse(inputStream);

			Assert::AreEqual(2_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(2_z, testParseHelper._endHandlerCount);
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(2_z, sharedData._maxDepth);
		}

		TEST_METHOD(FileParsing)
		{
			const std::string filename = "TestFile.json";
			const string inputString = R"(
			{ 
				"Health": 
				{ 
					"integer" : 100 
				}
			})";

			std::ofstream outputFile(filename);
			Assert::IsTrue(outputFile.good());

			outputFile << inputString;
			outputFile.close();

			JsonTestParseHelper::SharedData sharedData;
			JsonTestParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);

			Assert::IsFalse(testParseHelper._initializedCall);
			parseCoordinator.Initialize();
			Assert::IsTrue(testParseHelper._initializedCall);

			parseCoordinator.ParseFromFile(filename);

			Assert::AreEqual(2_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(2_z, testParseHelper._endHandlerCount);
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(2_z, sharedData._maxDepth);

			Assert::ExpectException<exception>([&parseCoordinator] { parseCoordinator.ParseFromFile("NonExistentFile.json"); });

		}
		TEST_METHOD(Clone)
		{
			JsonTestParseHelper::SharedData sharedData;
			JsonParseCoordinator parseCoordinator(sharedData);
			Assert::IsFalse(parseCoordinator.IsClone());

			JsonTestParseHelper testParseHelper;
			parseCoordinator.AddHelper(testParseHelper);

			JsonIntegerParseHelper integerParseHelper;
			parseCoordinator.AddHelper(integerParseHelper);

			auto clone = parseCoordinator.Clone();
			Assert::AreNotEqual(clone, &parseCoordinator);
			Assert::IsTrue(clone->IsClone());
			Assert::AreEqual(2_z, clone->Helpers().Size());

			auto clonedHelper = clone->Helpers()[0]->As<JsonTestParseHelper>();
			Assert::IsNotNull(clonedHelper);
			Assert::AreNotEqual(clonedHelper, parseCoordinator.Helpers()[0]->As<JsonTestParseHelper>());
			Assert::AreNotSame(clone->GetSharedData(), parseCoordinator.GetSharedData());
			delete clone;
		}

		TEST_METHOD(ParsingInvalidJson)
		{
			JsonTestParseHelper::SharedData sharedData;
			JsonTestParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);
			Assert::ExpectException<exception>([&parseCoordinator]
			{
				const string inputString = R"({ "integer" : { 100 } })";
				parseCoordinator.Parse(inputString);

			});
		}

		TEST_METHOD(IntegerParsing)
		{
			string inputString = R"({ "integer" : 100 })";

			JsonIntegerParseHelper::SharedData sharedData;
			JsonIntegerParseHelper integerParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(integerParseHelper);

			parseCoordinator.Parse(inputString);
			Assert::AreEqual(1_z, sharedData._data.Size());
			Assert::AreEqual(100, sharedData._data.Front());
		}

		TEST_METHOD(IntegerArrayParsing)
		{
			string inputString = R"({ "integer": [ 10, 20, 30, 40 ] })";

			JsonIntegerParseHelper::SharedData sharedData;
			JsonIntegerParseHelper integerParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(integerParseHelper);

			parseCoordinator.Parse(inputString);
			Assert::AreEqual(4_z, sharedData._data.Size());
			Assert::AreEqual(10, sharedData._data[0]);
			Assert::AreEqual(20, sharedData._data[1]);
			Assert::AreEqual(30, sharedData._data[2]);
			Assert::AreEqual(40, sharedData._data[3]);

		}

		TEST_METHOD(ValueArrayParsing)
		{
			const string inputString = R"(
			{
				"Numbers": [1, 2, 3 ]
			})"s;

			JsonTestParseHelper::SharedData sharedData;
			JsonTestParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);

			Assert::IsFalse(testParseHelper._initializedCall);
			parseCoordinator.Initialize();
			Assert::IsTrue(testParseHelper._initializedCall);

			Assert::AreEqual(0_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(0_z, testParseHelper._endHandlerCount);
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(0_z, sharedData._maxDepth);

			parseCoordinator.Parse(inputString);

			Assert::AreEqual(3_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(3_z, testParseHelper._endHandlerCount);
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(1_z, sharedData._maxDepth);

		}

		TEST_METHOD(ObjectArrayParsing)
		{
			const string inputString = R"(
			{
				"Objects": 
				[
					{
						"1": 1,
						"2": 1, 
						"3": 1,
						"4": 1
					},
					{ "2": 2 },
					{ "3": 3 }
				]
			})"s;

			JsonTestParseHelper::SharedData sharedData;
			JsonTestParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);

			Assert::IsFalse(testParseHelper._initializedCall);
			parseCoordinator.Initialize();
			Assert::IsTrue(testParseHelper._initializedCall);

			Assert::AreEqual(0_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(0_z, testParseHelper._endHandlerCount);
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(0_z, sharedData._maxDepth);

			parseCoordinator.Parse(inputString);

			Assert::AreEqual(6_z, testParseHelper._startHandlerCount);
			Assert::AreEqual(6_z, testParseHelper._endHandlerCount);
			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(2_z, sharedData._maxDepth);

		}

		TEST_METHOD(AddRemoveHelpers)
		{
			JsonTestParseHelper::SharedData sharedData;
			JsonParseCoordinator parseCoordinator(sharedData);

			JsonTestParseHelper testParseHelper;
			Assert::AreEqual(0_z, parseCoordinator.Helpers().Size());
			parseCoordinator.AddHelper(testParseHelper);
			Assert::AreEqual(1_z, parseCoordinator.Helpers().Size());

			JsonIntegerParseHelper integerParseHelper;
			parseCoordinator.AddHelper(integerParseHelper);
			Assert::AreEqual(2_z, parseCoordinator.Helpers().Size());

			Assert::ExpectException<exception>([&parseCoordinator, &integerParseHelper] { parseCoordinator.AddHelper(integerParseHelper); });


			parseCoordinator.RemoveHelper(testParseHelper);
			Assert::AreEqual(1_z, parseCoordinator.Helpers().Size());

			parseCoordinator.RemoveHelper(integerParseHelper);
			Assert::AreEqual(0_z, parseCoordinator.Helpers().Size());
		}

		TEST_METHOD(FallingThroughTheChain)
		{
			const string inputString = R"(
			{
				"Test": 100
			})"s;

			JsonTestParseHelper::SharedData sharedData;
			JsonIntegerParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);

			parseCoordinator.Parse(inputString);

			Assert::AreEqual(0_z, sharedData.Depth());
			Assert::AreEqual(0_z, sharedData._maxDepth);
		}
	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState JsonParseCoordinatorTest::_startMemState;
}
