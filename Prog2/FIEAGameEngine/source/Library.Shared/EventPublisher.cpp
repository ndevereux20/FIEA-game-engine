#include "pch.h"
#include "EventPublisher.h"

namespace FieaGameEngine
{
	RTTI_DEFINITIONS(EventPublisher);

	EventPublisher::EventPublisher(Vector<EventSubscriber*>& subscriberListReference) :
		_subscriberListReference(&subscriberListReference)
	{
	}

	void EventPublisher::Deliver()
	{
		for (auto& subscriber : *_subscriberListReference)
		{
			subscriber->Notify(*this);
		}
	}

}