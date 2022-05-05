#include "pch.h"
#include "Action.h"

namespace FieaGameEngine
{
	RTTI_DEFINITIONS(Action);

	Action::Action(RTTI::IdType childID) : 
		Attribute(childID)
	{

	}

	const FieaGameEngine::Vector<FieaGameEngine::Signature> Action::Signatures()
	{
		return Vector<Signature>
		{
			{ "Name", DatumTypes::String, 1, offsetof(Action, Name) }
		};
	}

}