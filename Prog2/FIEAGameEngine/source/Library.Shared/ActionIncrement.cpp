#include "pch.h"
#include "ActionIncrement.h"

namespace FieaGameEngine
{
	RTTI_DEFINITIONS(ActionIncrement);
	ActionIncrement::ActionIncrement() :
		Action(ActionIncrement::TypeIdClass())
	{

	}

	const std::string& ActionIncrement::GetTarget() const
	{
		return Target;
	}

	void ActionIncrement::SetTarget(const std::string& _target)
	{
		Target = _target;
		_targetDatum = nullptr;
	}

	void ActionIncrement::Update(const GameTime&)
	{
		if (_targetDatum == nullptr)
		{
			_targetDatum = GlobalSearch(Target);
			if (_targetDatum == nullptr)
			{
				throw std::exception("The target does not exist.");
			}
		}
		if (_targetDatum != nullptr)
		{
			if (_targetDatum->Type() == DatumTypes::Integer)
			{
				int32_t& iValue = _targetDatum->Get<int32_t>();
				iValue += static_cast<int32_t>(Step);
			}
			else if (_targetDatum->Type() == DatumTypes::Float)
			{
				float& fValue = _targetDatum->Get<float>();
				fValue += Step;
			}
			else 
			{	
				throw std::runtime_error("cannot increment a datum not of type int or float.");
			}
		}
		
	}

	gsl::owner<ActionIncrement*> ActionIncrement::Clone() const
	{
		return new ActionIncrement(*this);
	}

	bool ActionIncrement::Equals(const RTTI* rhs) const
	{
		auto rhsActionIncrement = rhs->As<ActionIncrement>();
		if (rhsActionIncrement == nullptr)
		{
			return false;
		}
		return Target == rhsActionIncrement->Target && Step == rhsActionIncrement->Step;
	}

	const Vector<FieaGameEngine::Signature> ActionIncrement::Signatures()
	{
		return Vector<Signature>
		{
			{ "Target", DatumTypes::String, 1, offsetof(ActionIncrement, Target) },
			{ "Step", DatumTypes::Float, 1, offsetof(ActionIncrement, Step) }
		};
	}

	std::string ActionIncrement::ToString() const
	{
		return "ActionIncrement";
	}

}