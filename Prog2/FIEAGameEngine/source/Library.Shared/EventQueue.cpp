#include "pch.h"
#include "EventQueue.h"

namespace FieaGameEngine
{
	void EventQueue::Enqueue(std::shared_ptr<EventPublisher> eventPublisher, GameTime& gameTime, const std::chrono::milliseconds& timeDelay)
	{
		if (_isUpdating)
		{
			_pendingEventQueue.PushBack(EventInfo(eventPublisher, gameTime.CurrentTime(), timeDelay));
		}
		else
		{
			_eventQueue.PushBack(EventInfo(eventPublisher, gameTime.CurrentTime(), timeDelay));
		}
	}


	void EventQueue::Update(const GameTime& gameTime)
	{
		_isUpdating = true;
		
		for (auto it = _eventQueue.begin(); it < _eventQueue.end();)
		{
			auto& eventInfo = *it;
			if (gameTime.CurrentTime() > eventInfo._delay + eventInfo._enqueueTime )
			{
				eventInfo._event.get()->Deliver();	
				_eventQueue.Remove(it);
			}
			else
			{
				++it;
			}
		}
		_isUpdating = false;

		for (size_t i = 0; i < _pendingEventQueue.Size(); ++i)
		{
			_eventQueue.PushBack(_pendingEventQueue[i]);
		}
		_pendingEventQueue.Clear();
		
	}

	void EventQueue::Clear()
	{
		_eventQueue.Clear();
	}

	bool EventQueue::IsEmpty() const
	{
		return _eventQueue.Size() == 0;
	}

	const std::size_t EventQueue::Size() const
	{
		return _eventQueue.Size();
	}

}
