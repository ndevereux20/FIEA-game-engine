#pragma once
#include "Attribute.h"
#include "GameTime.h"
#include "Factory.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Abstract base class for Action.s
	/// </summary>
	class Action : public Attribute
	{
		RTTI_DECLARATIONS(Action, Attribute);
	public: 
		virtual ~Action() = default;
		Action& operator=(const Action& otherGameObject) = default;
		Action(const Action& otherGameObject) = default;
		Action& operator=(Action&& otherGameObject) = default;
		Action(Action&& otherGameObject) = default;

		/// <summary>
		/// Pure virtual update, overridden in the child classes.
		/// </summary>
		/// <param name="gameTime">A GameTIme instance</param>
		virtual void Update(const GameTime& gameTime) = 0;

		/*const std::string& GetName();
		void SetName(const std::string& name);*/

		/// <summary>
		/// The vector of Signatures, becomes the prescribed Attributes of the GameObject. 
		/// </summary>
		/// <returns></returns>
		static const Vector<Signature> Signatures();

		std::string Name;
		

	protected:
		explicit Action(RTTI::IdType childID);
	};
}
