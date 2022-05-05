#include "pch.h"
#include "Foo.h"
#include "AttributedFoo.h"
#include "GameState.h"
#include "ToStringOverload.h"
#include "Event.h"
#include "EventPublisher.h"
#include "EventSubscriber.h"
#include "EventQueue.h"
#include "GameTime.h"
#include "EventSubscribers.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;
using namespace FieaGameEngine;
using namespace std;
using namespace glm;
using namespace std::string_literals;
using namespace std::chrono_literals;
using namespace std::chrono;


namespace UnitTestLibraryDesktop
{
	TEST_CLASS(EventTests)
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
			Foo a(1);
			Event<Foo> event(a);

			RTTI* rtti = &event;
			Assert::IsFalse(rtti->Is(Foo::TypeIdClass()));
			Assert::IsTrue(rtti->Is(Event<Foo>::TypeIdClass()));
			Assert::IsTrue(rtti->Is(EventPublisher::TypeIdClass()));
			Assert::IsTrue(rtti->Is(rtti->TypeIdInstance()));

			Foo* b = rtti->As<Foo>();
			Assert::IsNull(b);

			Event<Foo>* e = rtti->As<Event<Foo>>();
			Assert::IsNotNull(e);
			Assert::AreEqual(&event, e);

			EventPublisher* ep = rtti->As<EventPublisher>();
			Assert::IsNotNull(ep);
			Assert::AreEqual(static_cast<Event<Foo>*>(ep), &event);
		}

		TEST_METHOD(TestEventDeliver)
		{
			Foo foo(1);
			FooSubscriber fooSubscriber;
			Event<Foo> event(foo);
			Assert::AreEqual(foo, event.Message());

			Assert::IsFalse(fooSubscriber.WasNotified);
			event.Deliver();
			Assert::IsFalse(fooSubscriber.WasNotified);

			Event<Foo>::Subscribe(&fooSubscriber);
			event.Deliver();
			Assert::IsTrue(fooSubscriber.WasNotified);
			Assert::AreEqual(event.Message().Data(), fooSubscriber.Data);
			Event<Foo>::UnsubscribeAll(); 
		}


		TEST_METHOD(EventNotifyCount)
		{
			GameTime gameTime;
			Foo foo(1);
			FooCountSubscriber fooCountSubscriber;

			shared_ptr<Event<Foo>> event = make_shared<Event<Foo>>(foo);
			Assert::AreEqual(event->Message(), foo);

			Event<Foo>::Subscribe(&fooCountSubscriber);
			Assert::AreEqual(0_z, fooCountSubscriber.Count);
			event->Deliver();
			Assert::AreEqual(1_z, fooCountSubscriber.Count);
			event->Deliver();
			Assert::AreEqual(2_z, fooCountSubscriber.Count);
			event->Deliver();
			Assert::AreEqual(3_z, fooCountSubscriber.Count);
			Event<Foo>::Unsubscribe(&fooCountSubscriber);

		}

		TEST_METHOD(EventQueueEnqueue)
		{
			GameTime gameTime;
			Foo foo(1);
			FooSubscriber fooSubscriber;
			EventQueue eventQueue;

			shared_ptr<Event<Foo>> event = make_shared<Event<Foo>>(foo);
			Assert::AreEqual(event->Message(), foo);

			Assert::AreEqual(0_z, eventQueue.Size());
			eventQueue.Enqueue(event, gameTime);
			/*Assert::AreEqual(0_z, eventQueue.Size());
			eventQueue.Update(gameTime);*/
			Assert::AreEqual(1_z, eventQueue.Size());

			Event<Foo>::Subscribe(&fooSubscriber);
			gameTime.SetCurrentTime(high_resolution_clock::time_point(1s));
			Assert::IsFalse(fooSubscriber.WasNotified);
			eventQueue.Clear();

			//Test Delay 
			gameTime.SetCurrentTime(high_resolution_clock::time_point());
			eventQueue.Enqueue(event, gameTime, 1s);
			Assert::IsFalse(eventQueue.IsEmpty());
			gameTime.SetCurrentTime(high_resolution_clock::time_point(500ms));
			eventQueue.Update(gameTime);
			Assert::IsFalse(fooSubscriber.WasNotified);
			gameTime.SetCurrentTime(high_resolution_clock::time_point(1s));
			eventQueue.Update(gameTime);
			Assert::IsFalse(fooSubscriber.WasNotified);
			gameTime.SetCurrentTime(high_resolution_clock::time_point(2s));
			eventQueue.Update(gameTime);
			Assert::IsTrue(fooSubscriber.WasNotified);

			Assert::IsTrue(eventQueue.IsEmpty());
			Event<Foo>::UnsubscribeAll();
		}

		TEST_METHOD(EventQueueEnqueuMultiple)
		{
			GameTime gameTime;
			Foo foo1(1);
			Foo foo2(2);
			Foo foo3(3);
			FooCountSubscriber fooCountSubscriber;
			EventQueue eventQueue;

			shared_ptr<Event<Foo>> event1 = make_shared<Event<Foo>>(foo1);
			shared_ptr<Event<Foo>> event2 = make_shared<Event<Foo>>(foo2);
			shared_ptr<Event<Foo>> event3 = make_shared<Event<Foo>>(foo3);
			Assert::AreEqual(event1->Message(), foo1);
			Assert::AreEqual(event2->Message(), foo2);
			Assert::AreEqual(event3->Message(), foo3);

			Assert::AreEqual(0_z, eventQueue.Size());
			eventQueue.Enqueue(event1, gameTime);
			eventQueue.Enqueue(event2, gameTime);
			eventQueue.Enqueue(event3, gameTime);
			/*Assert::AreEqual(0_z, eventQueue.Size());
			eventQueue.Update(gameTime);*/
			Assert::AreEqual(3_z, eventQueue.Size());

			Event<Foo>::Subscribe(&fooCountSubscriber);
			gameTime.SetCurrentTime(high_resolution_clock::time_point(1s));
			Assert::AreEqual(0_z, fooCountSubscriber.Count);
			eventQueue.Clear();

			gameTime.SetCurrentTime(high_resolution_clock::time_point());
			eventQueue.Enqueue(event1, gameTime, 1s);
			eventQueue.Enqueue(event2, gameTime, 500ms);
			eventQueue.Enqueue(event3, gameTime, 2s);
			gameTime.SetCurrentTime(high_resolution_clock::time_point(500ms));
			eventQueue.Update(gameTime);
			Assert::AreEqual(0_z, fooCountSubscriber.Count);
			Assert::AreEqual(3_z, eventQueue.Size());
			gameTime.SetCurrentTime(high_resolution_clock::time_point(1s));
			eventQueue.Update(gameTime);
			Assert::AreEqual(1_z, fooCountSubscriber.Count);
			Assert::AreEqual(2_z, eventQueue.Size());
			gameTime.SetCurrentTime(high_resolution_clock::time_point(2s));
			eventQueue.Update(gameTime);
			Assert::AreEqual(2_z, fooCountSubscriber.Count);
			Assert::AreEqual(1_z, eventQueue.Size());
			gameTime.SetCurrentTime(high_resolution_clock::time_point(3s));
			eventQueue.Update(gameTime);
			Assert::AreEqual(3_z, fooCountSubscriber.Count);
			Assert::AreEqual(0_z, eventQueue.Size());

			Assert::IsTrue(eventQueue.IsEmpty());
			Event<Foo>::UnsubscribeAll();
		}

		TEST_METHOD(EventSubscriberThatEnqueuesEvents)
		{
			GameTime gameTime; 
			Foo foo(1);
			EventEnqueueSubscriber subscriber;
			EventQueue eventQueue;

			shared_ptr<Event<EventEnqueFoo>> event = make_shared<Event<EventEnqueFoo>>(EventEnqueFoo(eventQueue));
			eventQueue.Enqueue(event, gameTime);

			Event<EventEnqueFoo>::Subscribe(&subscriber);
			gameTime.SetCurrentTime(high_resolution_clock::time_point(1s));
			Assert::AreEqual(0_z, subscriber.Count);
			Assert::AreEqual(1_z, eventQueue.Size());
			eventQueue.Update(gameTime);
			Assert::AreEqual(1_z, subscriber.Count);
			Assert::AreEqual(1_z, eventQueue.Size());

			eventQueue.Update(gameTime);
			Assert::AreEqual(2_z, subscriber.Count);
			Assert::AreEqual(1_z, eventQueue.Size());

			Event<EventEnqueFoo>::UnsubscribeAll();
		}

		TEST_METHOD(CopySemantics)
		{
			{
				//Test copy constructor
				Event<Foo> event(Foo(1));
				Event<Foo> anotherEvent(event);
				Assert::AreNotSame(event.Message(), anotherEvent.Message());
				Assert::AreEqual(event.Message(), anotherEvent.Message());
			}
			{
				//Test copy assignment operator
				Event<Foo> event(Foo(1));
				Event<Foo> anotherEvent(Foo(2));
				anotherEvent = event;
				Assert::AreNotSame(event.Message(), anotherEvent.Message());
				Assert::AreEqual(event.Message(), anotherEvent.Message());
			}
		}

		TEST_METHOD(MoveSemantics)
		{
			{
				//Test move constructor
				Event<Foo> event(Foo(1));
				Event<Foo> anotherEvent(move(event));
#pragma warning(push)
#pragma warning(disable:26800)
				Assert::IsFalse(&event.Message() == &anotherEvent.Message());
#pragma warning(pop)
			}
			{
				//Test move assignment operator
				Event<Foo> event(Foo(1));
				Event<Foo> anotherEvent(Foo(2));
				anotherEvent = move(event);
#pragma warning(push)
#pragma warning(disable:26800)
				Assert::IsFalse(&event.Message() == &anotherEvent.Message());
#pragma warning(pop)
			}
		}
	private:
		static _CrtMemState _startMemState;
	};
	_CrtMemState EventTests::_startMemState;
}