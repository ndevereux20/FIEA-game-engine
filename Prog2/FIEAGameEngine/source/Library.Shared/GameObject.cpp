#include "pch.h"
#include "GameObject.h"

namespace FieaGameEngine 
{
	RTTI_DEFINITIONS(GameObject);
	GameObject::GameObject() : 
		Attribute(GameObject::TypeIdInstance())
	{
	}

	GameObject::GameObject(RTTI::IdType childId) :
		Attribute(childId)
	{
	}


	const Vector<Signature> GameObject::Signatures()
	{
		return Vector<Signature>
		{
			{ "Name", DatumTypes::String, 1, offsetof(GameObject, Name) },
			{ "Position", DatumTypes::Vector, 1, offsetof(GameObject, Transform.Position) },
			{ "Rotation", DatumTypes::Vector, 1, offsetof(GameObject, Transform.Rotation) },
			{ "Scale", DatumTypes::Vector, 1, offsetof(GameObject, Transform.Scale) },
			{ "Children", DatumTypes::Table, 1, 0 },
			{ "Actions", DatumTypes::Table, 1, 0}
		};
	}


	const Datum* GameObject::Actions() const
	{
		return Find("Actions");
	}

	Scope* GameObject::CreateAction(const std::string& className, const std::string& instanceName)
	{
		Scope* scope = Factory<Scope>::Create(className);
		assert(scope->Is(Action::TypeIdClass()));
		Action* action = static_cast<Action*>(scope);
		action->Name = instanceName;
		Adopt("Actions", *scope);
		return scope;
	}

	void GameObject::Update(const GameTime& gameTime)
	{
		Datum* childDatum = Find("Children");
		if (childDatum != nullptr)
		{
			for (size_t i = 0; i < childDatum->Size(); ++i)
			{
				Scope* childScope = childDatum->Get<Scope*>(i);
				assert(childScope->Is(GameObject::TypeIdClass()) != false);
				GameObject* childGameObject = static_cast<GameObject*>(childScope);
				childGameObject->Update(gameTime);
			}
		}
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

	gsl::owner<GameObject*> GameObject::Clone() const
	{
		return new GameObject(*this);
	}

	std::string GameObject::ToString() const
	{
		return "GameObject";
	}

	bool GameObject::Equals(const RTTI* rhs) const
	{
		auto rhsGameObject = rhs->As<GameObject>();
		if (rhsGameObject == nullptr)
		{
			return false;
		}
	
		return *rhsGameObject == *this;
	}
}