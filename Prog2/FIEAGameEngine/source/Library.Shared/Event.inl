#pragma once
#include "Event.h"

namespace FieaGameEngine
{
	template <typename messageT>
	RTTI_DEFINITIONS(Event<messageT>);

	template <typename messageT>
	Event<messageT>::Event(const messageT& messageObject) :
		EventPublisher(_eventSubscriberList), _message(messageObject)
	{

	}

	template <typename messageT>
	void Event<messageT>::Subscribe(EventSubscriber* eventSubscriber)
	{
		if (_eventSubscriberList.Find(eventSubscriber) == _eventSubscriberList.end())
		{
			_eventSubscriberList.PushBack(eventSubscriber);
		}
	}

	template <typename messageT>
	void Event<messageT>::Unsubscribe(EventSubscriber* eventSubscriber)
	{
		_eventSubscriberList.Remove(eventSubscriber);
	}

	template <typename messageT>
	void Event<messageT>::UnsubscribeAll()
	{
		_eventSubscriberList.Clear();
	}


	template <typename messageT>
	const typename messageT& Event<messageT>::Message() const
	{
		return _message;
	}
}