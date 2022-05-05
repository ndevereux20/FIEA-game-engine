#pragma once
#include "ActionCreateAction.h"
#include "ActionDestroyAction.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Controls the State of the Game.
	/// </summary>
	class GameState final
	{
	public:
		GameState() = default;
		~GameState() = default;
		GameState& operator=(const GameState& otherGameObject) = default;
		GameState(const GameState& otherGameObject) = default;
		GameState& operator=(GameState&& otherGameObject) = default;
		GameState(GameState&& otherGameObject) = default;

		/// <summary>
		/// Loops through the Vector of Actions to create, and adopts them into the parents Actions Datum.
		/// </summary>
		void AddPending();

		/// <summary>
		/// Loops through the Vector of Actions to delete, and then deletes the Action.
		/// </summary>
		void DestroyPending();
	};
}
