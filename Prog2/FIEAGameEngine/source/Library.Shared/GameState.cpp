#include "pch.h"
#include "GameState.h"

namespace FieaGameEngine
{
	void GameState::AddPending()
	{
		for (const auto it : ActionCreateAction::createActionVector)
		{
			auto [createdScope, createdAction] = it;
			assert(createdScope != nullptr);
			createdScope->Adopt("Actions", *createdAction);
		}

		ActionCreateAction::createActionVector.Clear();
	}

	void GameState::DestroyPending()
	{
		for (const auto it : ActionDestroyAction::destroyActionVector)
		{
			auto [datumToDestroy, index] = it;
			delete datumToDestroy->Get<Scope*>(index);
			//datumToDestroy->RemoveAt(index);
		}

		ActionDestroyAction::destroyActionVector.Clear();
	}

}