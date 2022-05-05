#pragma once
#include "Action.h"
namespace FieaGameEngine
{
	/// <summary>
	/// Creates Actions to put in the container.
	/// </summary>
	class ActionCreateAction : public Action
	{
		friend class GameState;
		RTTI_DECLARATIONS(ActionCreateAction, Action);
	public:

		/// <summary>
		/// Default constructor for ActionCreateAction, calls Actions Constructor.
		/// </summary>
		ActionCreateAction();
		virtual ~ActionCreateAction() = default;
		ActionCreateAction& operator=(const ActionCreateAction& otherGameObject) = default;
		ActionCreateAction(const ActionCreateAction& otherGameObject) = default;
		ActionCreateAction& operator=(ActionCreateAction&& otherGameObject) = default;
		ActionCreateAction(ActionCreateAction&& otherGameObject) = default;


		/// <summary>
		/// Update for ActionCreateAction, adds an Action to a list of Actions to create, creation is controlled by GameState.
		/// </summary>
		/// <param name="gameTime">A GameTime instance.</param>
		virtual void Update(const GameTime& gameTime);

		/// <summary>
		/// Clones this ActionCreateAction, makes a copy that the user is responsible for deleting.
		/// </summary>
		/// <returns>A pointer to a ActionCreateAction, the user is responsible for deleting it.</returns>
		virtual gsl::owner<ActionCreateAction*> Clone() const override;

		/// <summary>
		/// Compares two ActionCreateAction to see if they are equal.
		/// </summary>
		/// <param name="rhs">The other RTTI pointer.</param>
		/// <returns>A boolean as to whether they are equal or not.</returns>
		virtual bool Equals(const RTTI* rhs) const override;

		/// <summary>
		/// Converts the ActionCreateAction to a string.
		/// </summary>
		/// <returns>A string.</returns>
		virtual std::string ToString() const override;

		/// <summary>
		/// Vector of Signatures for ActionCreateAction.
		/// </summary>
		/// <returns>The Vector of Signatures.</returns>
		static const Vector<Signature> Signatures();

		std::string Prototype;

	protected:
		inline static Vector<std::pair<Scope*, Action*>> createActionVector;
	};
	ConcreteFactory(ActionCreateAction, Scope);
}
