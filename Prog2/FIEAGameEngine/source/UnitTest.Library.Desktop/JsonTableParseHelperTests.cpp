#include "pch.h"
#include "JsonParseCoordinator.h"
#include "IJsonParseHelper.h"
#include "JsonTableParseHelper.h"
#include "Foo.h"
#include <fstream>
#include "AttributedFoo.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;
using namespace std::string_literals;


namespace UnitTestLibraryDesktop
{
	TEST_CLASS(JsonTableParseHelperTests)
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

		TEST_METHOD(JsoTableParseHelperRTTI)
		{
			JsonTableParseHelper helper;

			RTTI* rtti = &helper;
			Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(JsonTableParseHelper::TypeIdClass()));
			Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));
			Assert::AreEqual(JsonTableParseHelper::TypeIdClass(), rtti->TypeIdInstance());

			Foo* f = rtti->As<Foo>();
			Assert::IsNull(f);

			JsonTableParseHelper* h = rtti->As<JsonTableParseHelper>();
			Assert::IsNotNull(h);
			Assert::AreEqual(&helper, h);
		}

		TEST_METHOD(Clone)
		{
			Scope scope;
			JsonTableParseHelper::SharedData sharedData(scope);
			JsonParseCoordinator parseCoordinator(sharedData);
			Assert::IsFalse(parseCoordinator.IsClone());

			JsonTableParseHelper testParseHelper;
			parseCoordinator.AddHelper(testParseHelper);

			auto clone = parseCoordinator.Clone();
			Assert::AreNotEqual(clone, &parseCoordinator);
			Assert::IsTrue(clone->IsClone());
			Assert::AreEqual(1_z, clone->Helpers().Size());

			auto clonedHelper = clone->Helpers()[0]->As<JsonTableParseHelper>();
			Assert::IsNotNull(clonedHelper);
			Assert::AreNotEqual(clonedHelper, parseCoordinator.Helpers()[0]->As<JsonTableParseHelper>());
			Assert::AreNotSame(clone->GetSharedData(), parseCoordinator.GetSharedData());
			delete clone;
		}
		TEST_METHOD(ParseFromStream)
		{
			size_t attributedFooSize = 13;
			AttributedFooFactory attributedFooFactory;
			std::stringstream inputString;
			inputString << R"(
            {
                "Address": {
                    "type": "table",
					"class" : "AttributedFoo",
                    "value": {
                        "Street": {
                            "type": "string",
                            "value": "123 Anystreet St."
                        },
                        "City": {
                            "type": "string",
                            "value": "Orlando"
                        },
                        "Postal Code": {
                            "type": "table",
							"class" : "AttributedFoo",
                            "value": {
                                "Zip Code": {
                                    "type": "integer",
                                    "value": 12345
                                },
                                "Zip Code+4": {
                                    "type": "integer",
                                    "value": 6789
                                }
                            }
                        }
                    }
                }
            })"s;
			Scope scope;
			JsonTableParseHelper::SharedData sharedData(scope);
			JsonTableParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);

			parseCoordinator.Initialize();


			parseCoordinator.Parse(inputString);

			Datum* scopeDatum = scope.Find("Address");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Table, scopeDatum->Type());
			Assert::AreEqual(size_t(1), scopeDatum->Size());

			Scope& addressScope = scopeDatum->operator[](0);
			Assert::AreEqual(size_t(3) + attributedFooSize, addressScope.Size());
			Assert::AreEqual(&scope, addressScope.GetParent());

			Datum& streetDatum = addressScope["Street"];
			Assert::AreEqual(DatumTypes::String, streetDatum.Type());
			Assert::AreEqual(size_t(1), streetDatum.Size());
			Assert::AreEqual("123 Anystreet St."s, streetDatum.Get<string>());

			Datum& cityDatum = addressScope["City"];
			Assert::AreEqual(DatumTypes::String, cityDatum.Type());
			Assert::AreEqual(size_t(1), cityDatum.Size());
			Assert::AreEqual("Orlando"s, cityDatum.Get<string>());

			Datum& postalCodeDatum = addressScope["Postal Code"];
			Assert::AreEqual(DatumTypes::Table, postalCodeDatum.Type());
			Assert::AreEqual(size_t(1), postalCodeDatum.Size());

			Scope& postalCodeScope = postalCodeDatum[0];
			Assert::AreEqual(size_t(2) + attributedFooSize, postalCodeScope.Size());
			Assert::AreEqual(&addressScope, postalCodeScope.GetParent());

			Datum& zipCodeDatum = postalCodeScope["Zip Code"];
			Assert::AreEqual(DatumTypes::Integer, zipCodeDatum.Type());
			Assert::AreEqual(size_t(1), zipCodeDatum.Size());
			Assert::AreEqual(12345, zipCodeDatum.Get<int32_t>());

			Datum& zipCodeMoreDatum = postalCodeScope["Zip Code+4"];
			Assert::AreEqual(DatumTypes::Integer, zipCodeMoreDatum.Type());
			Assert::AreEqual(size_t(1), zipCodeMoreDatum.Size());
			Assert::AreEqual(6789, zipCodeMoreDatum.Get<int32_t>());
		}
		TEST_METHOD(ParseFromString)
		{
			size_t attributedFooSize = 13;
			AttributedFooFactory attributedFooFactory;
			string inputString = R"(
            {
                "Address": {
                    "type": "table",
					"class" : "AttributedFoo",
                    "value": {
                        "Street": {
                            "type": "string",
                            "value": "123 Anystreet St."
                        },
                        "City": {
                            "type": "string",
                            "value": "Orlando"
                        },
                        "Postal Code": {
                            "type": "table",
							"class" : "AttributedFoo",
                            "value": {
                                "Zip Code": {
                                    "type": "integer",
                                    "value": 12345
                                },
                                "Zip Code+4": {
                                    "type": "integer",
                                    "value": 6789
                                }
                            }
                        }
                    }
                }
            })"s;
			Scope scope;
			JsonTableParseHelper::SharedData sharedData(scope);
			JsonTableParseHelper testParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(testParseHelper);

			parseCoordinator.Initialize();
			
			parseCoordinator.Parse(inputString);

			Datum* scopeDatum = scope.Find("Address");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Table, scopeDatum->Type());
			Assert::AreEqual(size_t(1), scopeDatum->Size());

			Scope& addressScope = scopeDatum->operator[](0);
			Assert::AreEqual(size_t(3) + attributedFooSize, addressScope.Size());
			Assert::AreEqual(&scope, addressScope.GetParent());

			Datum& streetDatum = addressScope["Street"];
			Assert::AreEqual(DatumTypes::String, streetDatum.Type());
			Assert::AreEqual(size_t(1), streetDatum.Size());
			Assert::AreEqual("123 Anystreet St."s, streetDatum.Get<string>());

			Datum& cityDatum = addressScope["City"];
			Assert::AreEqual(DatumTypes::String, cityDatum.Type());
			Assert::AreEqual(size_t(1), cityDatum.Size());
			Assert::AreEqual("Orlando"s, cityDatum.Get<string>());

			Datum& postalCodeDatum = addressScope["Postal Code"];
			Assert::AreEqual(DatumTypes::Table, postalCodeDatum.Type());
			Assert::AreEqual(size_t(1), postalCodeDatum.Size());

			Scope& postalCodeScope = postalCodeDatum[0];
			Assert::AreEqual(size_t(2) + attributedFooSize, postalCodeScope.Size());
			Assert::AreEqual(&addressScope, postalCodeScope.GetParent());

			Datum& zipCodeDatum = postalCodeScope["Zip Code"];
			Assert::AreEqual(DatumTypes::Integer, zipCodeDatum.Type());
			Assert::AreEqual(size_t(1), zipCodeDatum.Size());
			Assert::AreEqual(12345, zipCodeDatum.Get<int32_t>());

			Datum& zipCodeMoreDatum = postalCodeScope["Zip Code+4"];
			Assert::AreEqual(DatumTypes::Integer, zipCodeMoreDatum.Type());
			Assert::AreEqual(size_t(1), zipCodeMoreDatum.Size());
			Assert::AreEqual(6789, zipCodeMoreDatum.Get<int32_t>());

		}

		TEST_METHOD(ParseFromFile)
		{
			AttributedFooFactory attributedFooFactory;
			size_t attributedFooSize = 13;
			const string filename = "..\\..\\..\\..\\..\\source\\UnitTest.Library.Desktop\\TestJson.json";
			
			Scope scope;
			JsonTableParseHelper::SharedData sharedData(scope);

			JsonTableParseHelper tableParseHelper;
			JsonParseCoordinator parseCoordinator(sharedData);
			parseCoordinator.AddHelper(tableParseHelper);

			parseCoordinator.Initialize();
			Assert::AreEqual(0_z, sharedData.Depth());
			parseCoordinator.ParseFromFile(filename);
			Assert::AreEqual(0_z, sharedData.Depth());

			Datum* scopeDatum = scope.Find("Name");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::String, scopeDatum->Type());
			Assert::AreEqual(size_t(1), scopeDatum->Size());
			Assert::AreEqual("Test"s, scopeDatum->Get<string>());

			scopeDatum = scope.Find("Health");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Integer, scopeDatum->Type());
			Assert::AreEqual(size_t(1), scopeDatum->Size());
			Assert::AreEqual(100, scopeDatum->Get<int32_t>());

			scopeDatum = scope.Find("Direction");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Vector, scopeDatum->Type());
			Assert::AreEqual(size_t(1), scopeDatum->Size());
			Assert::AreEqual(glm::vec4(1, 0, 0, 1), scopeDatum->Get<vec4>());

			scopeDatum = scope.Find("Transform");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Matrix, scopeDatum->Type());
			Assert::AreEqual(size_t(1), scopeDatum->Size());
			Assert::AreEqual(glm::mat4{ 1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1 }, scopeDatum->Get<mat4>());

			scopeDatum = scope.Find("Aliases");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::String, scopeDatum->Type());
			Assert::AreEqual(size_t(3), scopeDatum->Size());
			Assert::AreEqual("Bob"s, scopeDatum->Get<string>(0));
			Assert::AreEqual("Jim"s, scopeDatum->Get<string>(1));
			Assert::AreEqual("Fred"s, scopeDatum->Get<string>(2));

			scopeDatum = scope.Find("Address");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Table, scopeDatum->Type());
			Assert::AreEqual(size_t(1), scopeDatum->Size());

			Scope& addressScope = scopeDatum->operator[](0);
			Assert::AreEqual(size_t(3) + attributedFooSize, addressScope.Size());
			Assert::AreEqual(&scope, addressScope.GetParent());

			Datum& streetDatum = addressScope["Street"];
			Assert::AreEqual(DatumTypes::String, streetDatum.Type());
			Assert::AreEqual(size_t(1), streetDatum.Size());
			Assert::AreEqual("123 Anystreet St."s, streetDatum.Get<string>());

			Datum& cityDatum = addressScope["City"];
			Assert::AreEqual(DatumTypes::String, cityDatum.Type());
			Assert::AreEqual(size_t(1), cityDatum.Size());
			Assert::AreEqual("Orlando"s, cityDatum.Get<string>());

			Datum& postalCodeDatum = addressScope["Postal Code"];
			Assert::AreEqual(DatumTypes::Table, postalCodeDatum.Type());
			Assert::AreEqual(size_t(1), postalCodeDatum.Size());

			Scope& postalCodeScope = postalCodeDatum[0];
			Assert::AreEqual(size_t(2) + attributedFooSize, postalCodeScope.Size());
			Assert::AreEqual(&addressScope, postalCodeScope.GetParent());

			Datum& zipCodeDatum = postalCodeScope["Zip Code"];
			Assert::AreEqual(DatumTypes::Integer, zipCodeDatum.Type());
			Assert::AreEqual(size_t(1), zipCodeDatum.Size());
			Assert::AreEqual(12345, zipCodeDatum.Get<int32_t>());

			Datum& zipCodeMoreDatum = postalCodeScope["Zip Code+4"];
			Assert::AreEqual(DatumTypes::Integer, zipCodeMoreDatum.Type());
			Assert::AreEqual(size_t(1), zipCodeMoreDatum.Size());
			Assert::AreEqual(6789, zipCodeMoreDatum.Get<int32_t>());

			scopeDatum = scope.Find("EmptyNestedScopeArray");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Table, scopeDatum->Type());
			Assert::AreEqual(size_t(0), scopeDatum->Size());

			scopeDatum = scope.Find("Powers");
			Assert::IsNotNull(scopeDatum);
			Assert::AreEqual(DatumTypes::Table, scopeDatum->Type());
			Assert::AreEqual(size_t(2), scopeDatum->Size());

			Scope& powerScope = scopeDatum->operator[](0);
			Assert::AreEqual(size_t(2) + attributedFooSize, powerScope.Size());
			Assert::AreEqual(&scope, powerScope.GetParent());

			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("this"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalInteger"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalFloat"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalString"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalVector"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalMatrix"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalIntegerArray"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalFloatArray"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalStringArray"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalVectorArray"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("ExternalMatrixArray"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("NestedScope"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsPrescribedAttribute("NestedScopeArray"));

			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsAuxiliaryAttribute("Name"));
			Assert::IsTrue(powerScope.As<AttributedFoo>()->IsAuxiliaryAttribute("Dps"));

			Datum* nameDatum = powerScope.Find("Name");
			Assert::IsNotNull(nameDatum);
			Assert::AreEqual(DatumTypes::String, nameDatum->Type());
			Assert::AreEqual("Laser Vision"s, nameDatum->Get<string>());

			Datum* dpsDatum = powerScope.Find("Dps");
			Assert::IsNotNull(dpsDatum);
			Assert::AreEqual(DatumTypes::Float, dpsDatum->Type());
			Assert::AreEqual(1.5f, dpsDatum->Get<float>());

			Datum* externalIntegerDatum = powerScope.Find("ExternalInteger");
			Assert::IsNotNull(externalIntegerDatum);
			Assert::AreEqual(DatumTypes::Integer, externalIntegerDatum->Type());
			Assert::AreEqual(100, externalIntegerDatum->Get<int32_t>());
			Assert::IsTrue(externalIntegerDatum->IsExternal());

			Datum* externalIntegerArrayDatum = powerScope.Find("ExternalIntegerArray");
			Assert::IsNotNull(externalIntegerArrayDatum);
			Assert::AreEqual(DatumTypes::Integer, externalIntegerArrayDatum->Type());
			Assert::AreEqual(100, externalIntegerArrayDatum->Get<int32_t>());
			Assert::AreEqual(100, externalIntegerArrayDatum->Get<int32_t>(1));
			Assert::AreEqual(100, externalIntegerArrayDatum->Get<int32_t>(2));
			Assert::AreEqual(100, externalIntegerArrayDatum->Get<int32_t>(3));
			Assert::AreEqual(100, externalIntegerArrayDatum->Get<int32_t>(4));
			Assert::IsTrue(externalIntegerArrayDatum->IsExternal());

			powerScope = scopeDatum->operator[](1);
			Assert::AreEqual(size_t(2) + attributedFooSize, powerScope.Size());
			Assert::AreEqual(&scope, powerScope.GetParent());

			nameDatum = powerScope.Find("Name");
			Assert::IsNotNull(nameDatum);
			Assert::AreEqual(DatumTypes::String, nameDatum->Type());
			Assert::AreEqual("Freeze Breath"s, nameDatum->Get<string>());

			dpsDatum = powerScope.Find("Dps");
			Assert::IsNotNull(dpsDatum);
			Assert::AreEqual(DatumTypes::Float, dpsDatum->Type());
			Assert::AreEqual(3.0f, dpsDatum->Get<float>());
		}
	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState JsonTableParseHelperTests::_startMemState;
}