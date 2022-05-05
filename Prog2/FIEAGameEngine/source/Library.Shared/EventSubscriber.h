#pragma once
#include "RTTI.h"
namespace FieaGameEngine
{
	class EventPublisher;
	/// <summary>
	/// Pure-virtual base class for a subscriber, has an overridable notify method, that must be implemented in any
	/// class you want to make a subscriber
	/// </summary>
	class EventSubscriber : RTTI
	{
		RTTI_DECLARATIONS(EventSubscriber, RTTI);
	public:
		EventSubscriber() = default;
		virtual ~EventSubscriber() = default;
		EventSubscriber& operator=(const EventSubscriber& otherEventSubscriber) = default;
		EventSubscriber(const EventSubscriber& otherEventSubscriber) = default;
		EventSubscriber& operator=(EventSubscriber&& otherEventSubscriber) = default;
		EventSubscriber(EventSubscriber&& otherEventSubscriber) = default;

		/// <summary>
		/// Does whatever work is needed in the subscriber.
		/// </summary>
		/// <param name="eventPublisher">The publisher of that notifies the subscriber, use the RTTI system to verify 
		/// you are recieving the right message.</param>
		virtual void Notify(const EventPublisher& eventPublisher) = 0;

	};
}

