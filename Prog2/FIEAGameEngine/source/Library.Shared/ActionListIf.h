#pragma once
#include "ActionList.h"
namespace FieaGameEngine
{
	/// <summary>
	/// Action that deals with If statements.
	/// </summary>
	class ActionListIf : public ActionList
	{
		RTTI_DECLARATIONS(ActionListIf, ActionList);
	public: 
		/// <summary>
		/// Default constructor for ActionListIf, calls ActionLists Constructor.
		/// </summary>
		ActionListIf();
		virtual ~ActionListIf() = default;
		ActionListIf& operator=(const ActionListIf& otherActionListIf) = default;
		ActionListIf(const ActionListIf& otherActionListIf) = default;
		ActionListIf& operator=(ActionListIf&& otherActionListIf) = default;
		ActionListIf(ActionListIf&& otherActionListIf) = default;

		/// <summary>
		/// Update for ActionListIf, calls the appropriate action given the result of the condition
		/// </summary>
		/// <param name="gameTime">A AameTime instance.</param>
		virtual void Update(const GameTime& gameTime);

		/// <summary>
		/// Gets the Condition.
		/// </summary>
		/// <returns>The Condition.</returns>
		const int32_t GetCondition() const;

		/// <summary>
		/// Sets the condition to the given result.
		/// </summary>
		/// <param name="conditionResult">The result to set the Condition to.</param>
		void SetCondition(bool conditionResult);

		/// <summary>
		/// Clones this ActionListIf, makes a copy that the user is responsible for deleting.
		/// </summary>
		/// <returns>A pointer to a ActionListIf, the user is responsible for deleting it.</returns>
		virtual gsl::owner<ActionListIf*> Clone() const override;

		/// <summary>
		/// Compares two ActionListIf to see if they are equal.
		/// </summary>
		/// <param name="rhs">The other RTTI pointer.</param>
		/// <returns>A boolean as to whether they are equal or not.</returns>
		virtual bool Equals(const RTTI* rhs) const override;

		/// <summary>
		/// Converts the ActionListIf to a string.
		/// </summary>
		/// <returns>A string.</returns>
		virtual std::string ToString() const override;

		/// <summary>
		/// Vector of Signatures for ActionListIf.
		/// </summary>
		/// <returns>The Vector of Signatures.</returns>
		static const Vector<Signature> Signatures();
	protected:
		int32_t Condition { 1 };
	};
	ConcreteFactory(ActionListIf, Scope);
}
