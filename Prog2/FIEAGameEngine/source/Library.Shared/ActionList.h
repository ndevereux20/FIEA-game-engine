#pragma once
#include "Action.h"
namespace FieaGameEngine
{
	/// <summary>
	/// Holds a list of Actions.
	/// </summary>
	class ActionList : public Action
	{
		RTTI_DECLARATIONS(ActionList, Action);
	public:
		
		/// <summary>
		/// Default constructor for ActionList, calls Actions Constructor.
		/// </summary>
		ActionList();
		virtual ~ActionList() = default;
		ActionList& operator=(const ActionList& otherActionList) = default;
		ActionList(const ActionList& otherActionList) = default;
		ActionList& operator=(ActionList&& otherActionList) = default;
		ActionList(ActionList&& otherActionList) = default;

		/// <summary>
		/// Update for ActionList, calls update on all nested Actions.
		/// </summary>
		/// <param name="gameTime">A GameTime instance.</param>
		virtual void Update(const GameTime& gameTime); 

		Scope* CreateAction(const std::string& className, const std::string& instanceName);

		/// <summary>
		/// Clones this ActionList, makes a copy that the user is responsible for deleting.
		/// </summary>
		/// <returns>A pointer to a ActionList, the user is responsible for deleting it.</returns>
		virtual gsl::owner<ActionList*> Clone() const override;

		/// <summary>
		/// Compares two ActionList to see if they are equal.
		/// </summary>
		/// <param name="rhs">The other RTTI pointer.</param>
		/// <returns>A boolean as to whether they are equal or not.</returns>
		virtual bool Equals(const RTTI* rhs) const override;

		/// <summary>
		/// Converts the ActionList to a string.
		/// </summary>
		/// <returns>A string.</returns>
		virtual std::string ToString() const override;

		/// <summary>
		/// Vector of Signatures for ActionList.
		/// </summary>
		/// <returns>The Vector of Signatures.</returns>
		static const Vector<Signature> Signatures();

	protected:
		explicit ActionList(RTTI::IdType childID);
	};
	ConcreteFactory(ActionList, Scope);
}

