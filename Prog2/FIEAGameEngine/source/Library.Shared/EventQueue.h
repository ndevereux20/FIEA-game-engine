#pragma once
#include "EventPublisher.h"
#include "GameTime.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Holds info for each event pushed into the Queue, The time the event was queued, and the the delay to wait for unqueueing.
	/// </summary>
	struct EventInfo {
		EventInfo(std::shared_ptr<EventPublisher> event, const std::chrono::high_resolution_clock::time_point enqueueTime, const std::chrono::milliseconds delay) :
			_event(event), _enqueueTime(enqueueTime), _delay(delay)
		{
		}
		
		std::shared_ptr<EventPublisher> _event;
		const std::chrono::high_resolution_clock::time_point _enqueueTime;
		const std::chrono::milliseconds _delay;

	};
	class EventQueue final
	{
	public:
		/// <summary>
		/// Enqueue an event with an optional delay to wait before publishing 
		/// </summary>
		/// <param name="eventPublisher">A shared_ptr to an eventPublisher base class.</param>
		/// <param name="gameTime">The GameTime.</param>
		/// <param name="timeDelay">Delay to wait before Delivering the event.</param>
		void Enqueue(std::shared_ptr<EventPublisher> eventPublisher, GameTime& gameTime, const std::chrono::milliseconds& timeDelay = static_cast<std::chrono::duration<long long, std::milli>>(0));
		
		/// <summary>
		/// Delivers all events message if they are expired.
		/// </summary>
		/// <param name="gameTime">The GameTime.</param>
		void Update(const GameTime& gameTime);

		/// <summary>
		/// Clears the Queue.
		/// </summary>
		void Clear();

		/// <summary>
		/// Queuries if the Queue is empty.
		/// </summary>
		/// <returns>Bool as to whether the Queue is empty.</returns>
		bool IsEmpty() const;

		/// <summary>
		/// Gets the size of the Queue.
		/// </summary>
		/// <returns>The size of the Queue.</returns>
		const std::size_t Size() const;

	private: 
		Vector<EventInfo> _eventQueue; 
		Vector<EventInfo> _pendingEventQueue;
		bool _isUpdating = false;
	};


}