#include "pch.h"
#include "ActionDestroyAction.h"
namespace FieaGameEngine
{
	RTTI_DEFINITIONS(ActionDestroyAction);

	ActionDestroyAction::ActionDestroyAction() :
		Action(ActionDestroyAction::TypeIdClass())
	{
	}

	const Vector<Signature> ActionDestroyAction::Signatures()
	{
		return Vector<Signature>
		{
			{ "ActionToDestroy", DatumTypes::Table, 1, offsetof(ActionDestroyAction, ActionToDestroy) }
		};
	}

	void ActionDestroyAction::Update(const GameTime&)
	{
		Datum* datum = Search("Actions");
		assert(datum != nullptr);
		for (size_t i = 0; i < datum->Size(); ++i)
		{
			if (datum->Get<Scope*>(i)->As<Action>()->Name == ActionToDestroy)
			{
				destroyActionVector.PushBack(std::make_pair(datum, i));
				break;
			}
		}
	}

	gsl::owner<ActionDestroyAction*> ActionDestroyAction::Clone() const
	{
		return new ActionDestroyAction(*this);
	}

	bool ActionDestroyAction::Equals(const RTTI* rhs) const
	{
		auto rhsActionDestroyAction = rhs->As<ActionDestroyAction>();
		if (rhsActionDestroyAction == nullptr)
		{
			return false;
		}
		return ActionToDestroy == rhsActionDestroyAction->ActionToDestroy;
	}

	std::string ActionDestroyAction::ToString() const
	{
		return "ActionDestroyAction";
	}

}