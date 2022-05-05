#include "pch.h"
#include "EventSubscribers.h"

using namespace std;
using namespace FieaGameEngine;

namespace UnitTestLibraryDesktop
{
	void FooSubscriber::Notify(const EventPublisher& eventPublisher)
	{
		const Event<Foo>* e = eventPublisher.As<Event<Foo>>();
		if (e != nullptr)
		{
			const Foo& foo = e->Message();
			Data = foo.Data();
		}
		WasNotified = true;
	}

	void FooCountSubscriber::Notify(const EventPublisher&)
	{
		++Count;
	}

	RTTI_DEFINITIONS(EventEnqueFoo);

	EventEnqueFoo::EventEnqueFoo(EventQueue& eventQueue) :
		mEventQueue(&eventQueue)
	{
		  
	}
	EventQueue& EventEnqueFoo::Queue()
	{
		return *mEventQueue;
	}

	void EventEnqueueSubscriber::Notify(const EventPublisher& eventPublisher)
	{
		++Count;
		const Event<EventEnqueFoo>* e = eventPublisher.As<Event<EventEnqueFoo>>();
		if (e != nullptr)
		{
			EventEnqueFoo message = e->Message();
			EventQueue& queue = message.Queue();

			GameTime gameTime;
			EventEnqueFoo eventEnqueFoo(queue);
			auto newEvent = make_shared<Event<EventEnqueFoo>>(eventEnqueFoo);
			queue.Enqueue(newEvent, gameTime);
		}
	}
}