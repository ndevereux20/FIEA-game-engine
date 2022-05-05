#include "pch.h"
#include "ActionListIf.h"

namespace FieaGameEngine
{
	RTTI_DEFINITIONS(ActionListIf);
	ActionListIf::ActionListIf() : 
		ActionList(ActionListIf::TypeIdClass())
	{

	}

	void ActionListIf::Update(const GameTime& gameTime)
	{
		Datum* datum = Find("Actions");
		if (Condition == 0)
		{
			Action* trueAction = datum->Get<Scope*>(0)->As<Action>();
			trueAction->Update(gameTime);
		}
		else
		{
			Action* falseAction = datum->Get<Scope*>(1)->As<Action>();
			falseAction->Update(gameTime);
		}
	}

	const int32_t ActionListIf::GetCondition() const
	{
		return Condition;
	}

	void ActionListIf::SetCondition(bool conditionResult)
	{
		if (conditionResult)
		{
			Condition = 0;
		}
		else
		{
			Condition = 1;
		}
	}

	const Vector<Signature> ActionListIf::Signatures()
	{
		return Vector<Signature>
		{
			{ "Condition", DatumTypes::Integer, 1, offsetof(ActionListIf, Condition) }
		};
	}

	gsl::owner<ActionListIf*> ActionListIf::Clone() const
	{
		return new ActionListIf(*this);
	}

	bool ActionListIf::Equals(const RTTI* rhs) const
	{
		auto rhsActionListIf = rhs->As<ActionListIf>();
		if (rhsActionListIf == nullptr)
		{
			return false;
		}
		return ActionList::Equals(rhs) && Condition == rhsActionListIf->Condition;
	}

	std::string ActionListIf::ToString() const
	{
		return "ActionListIf";
	}

}