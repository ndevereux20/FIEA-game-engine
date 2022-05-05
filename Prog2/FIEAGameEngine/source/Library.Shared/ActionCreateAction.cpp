#include "pch.h"
#include "ActionCreateAction.h"
namespace FieaGameEngine
{
	RTTI_DEFINITIONS(ActionCreateAction);

	ActionCreateAction::ActionCreateAction() : 
		Action(ActionCreateAction::TypeIdClass())
	{
	}


	const Vector<Signature> ActionCreateAction::Signatures()
	{
		return Vector<Signature>
		{
			{ "Prototype", DatumTypes::String, 1, offsetof(ActionCreateAction, Prototype) },
		};
	}

	void ActionCreateAction::Update(const GameTime& )
	{
		Scope* scope = Factory<Scope>::Create(Prototype);
		assert(scope->Is(Action::TypeIdClass()));
		Action* action = static_cast<Action*>(scope);
		assert(action != nullptr);
		action->Name = Name;
		createActionVector.PushBack(std::make_pair(_parent, action));
	}

	gsl::owner<ActionCreateAction*> ActionCreateAction::Clone() const
	{
		return new ActionCreateAction(*this);
	}

	bool ActionCreateAction::Equals(const RTTI* rhs) const
	{
		auto rhsActionCreteAction = rhs->As<ActionCreateAction>();
		if (rhsActionCreteAction == nullptr)
		{
			return false;
		}
		return Name == rhsActionCreteAction->Name && Prototype == rhsActionCreteAction->Prototype;
	}

	std::string ActionCreateAction::ToString() const
	{
		return "ActionCreateAction";
	}

}