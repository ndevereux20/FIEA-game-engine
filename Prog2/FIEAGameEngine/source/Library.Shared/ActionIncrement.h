#pragma once
#include "Action.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Action that increments the value of a target datum (works for int and floats)
	/// </summary>
	class ActionIncrement : public Action
	{
		RTTI_DECLARATIONS(ActionIncrement, Action);
	public: 
		/// <summary>
		/// Default constructor for ActionIncrement, calls Actions Constructor.
		/// </summary>
		ActionIncrement();
		virtual ~ActionIncrement() = default;
		ActionIncrement& operator=(const ActionIncrement& otherGameObject) = default;
		ActionIncrement(const ActionIncrement& otherGameObject) = default;
		ActionIncrement& operator=(ActionIncrement&& otherGameObject) = default;
		ActionIncrement(ActionIncrement&& otherGameObject) = default;


		/// <summary>
		/// Gets the Target string name.
		/// </summary>
		/// <returns>The name of the Target.</returns>
		const std::string& GetTarget() const;

		/// <summary>
		/// Sets the name of the Target, resets the cached TargetDatum.
		/// </summary>
		/// <param name="_target"></param>
		void SetTarget(const std::string& _target);

		/// <summary>
		/// Update for ActionIncrement, trys to find the Target, and then increments the Targets Datum Value.
		/// </summary>
		/// <param name="gameTime">A GameTime instance.</param>
		virtual void Update(const GameTime& gameTime);

		/// <summary>
		/// Clones this ActionIncrement, makes a copy that the user is responsible for deleting.
		/// </summary>
		/// <returns>A pointer to a ActionList, the user is responsible for deleting it.</returns>
		virtual gsl::owner<ActionIncrement*> Clone() const override;

		/// <summary>
		/// Compares two ActionIncrement to see if they are equal.
		/// </summary>
		/// <param name="rhs">The other RTTI pointer.</param>
		/// <returns>A boolean as to whether they are equal or not.</returns>
		virtual bool Equals(const RTTI* rhs) const override;

		/// <summary>
		/// Converts the ActionIncrement to a string.
		/// </summary>
		/// <returns>A string.</returns>
		virtual std::string ToString() const override;

		/// <summary>
		/// Vector of Signatures for ActionDestroyAction.
		/// </summary>
		/// <returns>The Vector of Signatures.</returns>
		static const Vector<Signature> Signatures();

		float Step{ 1.0f };

	private: 
		std::string Target;
		Datum* _targetDatum{ nullptr };

	};
	ConcreteFactory(ActionIncrement, Scope);
}
