#include "pch.h"
#include "ActionList.h"


namespace FieaGameEngine
{
	RTTI_DEFINITIONS(ActionList);

	ActionList::ActionList() : 
		Action(ActionList::TypeIdClass())
	{
	}

	ActionList::ActionList(RTTI::IdType childID) :
		Action(childID)
	{
	}

	const Vector<Signature> ActionList::Signatures()
	{
		return Vector<Signature>
		{
			{ "Actions", DatumTypes::Table, 1, 0 }
		};
	}

	void ActionList::Update(const GameTime& gameTime)
	{
		Datum* actionDatum = Find("Actions");
		if (actionDatum != nullptr)
		{
			for (size_t i = 0; i < actionDatum->Size(); ++i)
			{
				Scope* actionScope = actionDatum->Get<Scope*>(i);
				assert(actionScope->Is(Action::TypeIdClass()) != false);
				Action* actionObject = static_cast<Action*>(actionScope);
				actionObject->Update(gameTime);
			}
		}
	}

	Scope* ActionList::CreateAction(const std::string& className, const std::string& instanceName)
	{
		Scope* scope = Factory<Scope>::Create(className);
		assert(scope->Is(Action::TypeIdClass()));
		Action* action = static_cast<Action*>(scope);
		action->Name = instanceName;
		Adopt("Actions", *scope);
		return scope;
	}

	gsl::owner<ActionList*> ActionList::Clone() const
	{
		return new ActionList(*this);
	}

	bool ActionList::Equals(const RTTI* rhs) const
	{
		auto rhsActionList = rhs->As<ActionList>();
		if (rhsActionList == nullptr)
		{
			return false;
		}
		return Name == rhsActionList->Name;
	}

	std::string ActionList::ToString() const
	{
		return "ActionList";
	}



}