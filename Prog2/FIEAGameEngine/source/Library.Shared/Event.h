#pragma once
#include "EventPublisher.h"
namespace FieaGameEngine
{
	
	/// <summary>
	/// Templated Event class, can take in any type of Event that you want to send.
	/// </summary>
	template <typename messageT>
	class Event : public EventPublisher
	{
		RTTI_DECLARATIONS(Event, EventPublisher);
	public: 
		/// <summary>
		/// The message object you want to Deliver to the Subscribers 
		/// </summary>
		/// <param name="messageObject"></param>
		Event(const messageT& messageObject);
		virtual ~Event() = default;
		Event& operator=(const Event& otherEvent) = default;
		Event(const Event& otherEvent) = default;
		Event& operator=(Event&& otherEvent)noexcept = default;
		Event(Event&& otherEvent) noexcept = default;

		/// <summary>
		/// Subscribes a subscriber to get notifications about this Event.
		/// </summary>
		/// <param name="eventSubscriber">The EventSubscriber to subscribe to this Event.</param>
		static void Subscribe(EventSubscriber* eventSubscriber);

		/// <summary>
		/// Unsubscribe a subscriber from this Event.
		/// </summary>
		/// <param name="eventSubscriber">The EventSubscriber to UnSubscribe to this Event.</param>
		static void Unsubscribe(EventSubscriber* eventSubscriber);

		/// <summary>
		/// Unsubscribe all subscribers of this event.
		/// </summary>
		static void UnsubscribeAll();

		/// <summary>
		/// Returns the message object.
		/// </summary>
		/// <returns></returns>
		const messageT& Message() const;
	protected:  
		inline static Vector<EventSubscriber*> _eventSubscriberList;
		messageT _message;
	};


}
#include "Event.inl"