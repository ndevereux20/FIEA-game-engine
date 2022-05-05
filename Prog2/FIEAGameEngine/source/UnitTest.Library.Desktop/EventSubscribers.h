#pragma once
#include "Event.h"
#include "Foo.h"
#include "EventQueue.h"

namespace UnitTestLibraryDesktop
{
	struct FooSubscriber : public FieaGameEngine::EventSubscriber
	{
		void Notify(const FieaGameEngine::EventPublisher& eventPublisher) override;

		bool WasNotified = false; 
		int Data = 0;
	};

	struct FooCountSubscriber final : public FieaGameEngine::EventSubscriber
	{
		void Notify(const FieaGameEngine::EventPublisher& eventPublisher) override;

		std::size_t Count = 0;
	};

	class EventEnqueFoo final : public FieaGameEngine::RTTI
	{
		RTTI_DECLARATIONS(EventEnqueFoo, FieaGameEngine::RTTI);
	public:
		explicit EventEnqueFoo(FieaGameEngine::EventQueue& eventQueue);
		FieaGameEngine::EventQueue& Queue();

	private: 
		FieaGameEngine::EventQueue* mEventQueue;
	};

	struct EventEnqueueSubscriber final : public FieaGameEngine::EventSubscriber
	{
	public:
		void Notify(const FieaGameEngine::EventPublisher& eventPublisher) override;

		std::size_t Count = 0;
	};
}