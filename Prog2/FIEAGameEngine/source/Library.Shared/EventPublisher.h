#pragma once
#include "RTTI.h"
#include "Vector.h"
#include "GameTime.h"
#include <memory>
#include <chrono>
#include "EventSubscriber.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Base class for Event, Delivers the message of an event to all subscribers.
	/// </summary>
	class EventPublisher : public RTTI
	{
		RTTI_DECLARATIONS(EventPublisher, RTTI);
	public: 
		virtual ~EventPublisher() = default;
		EventPublisher& operator=(const EventPublisher& otherEventPublisher) = default;
		EventPublisher(const EventPublisher& otherEventPublisher) = default;
		EventPublisher& operator=(EventPublisher&& otherEventPublisher) noexcept = default;
		EventPublisher(EventPublisher&& otherEventPublisher) noexcept = default;

		/// <summary>
		/// Delivers the message of the event of type T, to all of its subscribers. 
		/// </summary>
		void Deliver();

	protected: 
		EventPublisher(Vector<EventSubscriber*>& subscriberListReference);
		Vector<EventSubscriber*>* _subscriberListReference;
	};
}

