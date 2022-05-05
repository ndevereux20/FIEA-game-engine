#pragma once
#include "Action.h"
namespace FieaGameEngine
{
	/// <summary>
	/// Destroys a designated Action.
	/// </summary>
	class ActionDestroyAction : public Action
	{
		friend class GameState;
		RTTI_DECLARATIONS(ActionDestroyAction, Action);
	public:
		/// <summary>
		/// Default constructor for ActionDestroyAction, calls Actions Constructor.
		/// </summary>
		ActionDestroyAction();
		virtual ~ActionDestroyAction() = default;
		ActionDestroyAction& operator=(const ActionDestroyAction& otherGameObject) = default;
		ActionDestroyAction(const ActionDestroyAction& otherGameObject) = default;
		ActionDestroyAction& operator=(ActionDestroyAction&& otherGameObject) = default;
		ActionDestroyAction(ActionDestroyAction&& otherGameObject) = default;

		/// <summary>
		/// Update for ActionDestroyAction, adds an Action to a list of actions to destroy, actual deletion of the action controlled by GameState.
		/// </summary>
		/// <param name="gameTime">A GameTime instance.</param>
		virtual void Update(const GameTime& gameTime);

		/// <summary>
		/// Clones this ActionDestroyAction, makes a copy that the user is responsible for deleting.
		/// </summary>
		/// <returns>A pointer to a ActionDestroyAction, the user is responsible for deleting it.</returns>
		virtual gsl::owner<ActionDestroyAction*> Clone() const override;

		/// <summary>
		/// Compares two ActionDestroyAction to see if they are equal.
		/// </summary>
		/// <param name="rhs">The other RTTI pointer.</param>
		/// <returns>A boolean as to whether they are equal or not.</returns>
		virtual bool Equals(const RTTI* rhs) const override;

		/// <summary>
		/// Converts the ActionDestroyAction to a string.
		/// </summary>
		/// <returns>A string.</returns>
		virtual std::string ToString() const override;

		/// <summary>
		/// Vector of Signatures for ActionDestroyAction.
		/// </summary>
		/// <returns>The Vector of Signatures.</returns>
		static const Vector<Signature> Signatures();

		std::string ActionToDestroy;

	protected:
		inline static Vector<std::pair<Datum*, std::size_t>> destroyActionVector;
	};
	ConcreteFactory(ActionDestroyAction, Scope);
}
