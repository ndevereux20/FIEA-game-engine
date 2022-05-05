#pragma once
#include "Attribute.h"
#include "Vector.h"
#include "GameTime.h"
#include "Factory.h"
#include "Action.h"

namespace FieaGameEngine
{
	/// <summary>
	/// Transform class holds the position, rotation, and scale of the GameObject
	/// </summary>
	struct Transform final
	{
		/// <summary>
		/// Compares two Transforms to see if they are equal.
		/// </summary>
		/// <param name="rhs">The other Transform</param>
		/// <returns>A boolean as to wheter they are equal or not.</returns>
		inline bool operator==(const Transform& rhs) const 
		{
			return Position == rhs.Position && 
					Rotation == rhs.Rotation && 
					Scale == rhs.Scale;
		}
		/// <summary>
		/// Compares two Transforms to see if they are not equal.
		/// </summary>
		/// <param name="rhs">The other Transform</param>
		/// <returns>A boolean as to whether they are equal or not.</returns>
		inline bool operator!=(const Transform& rhs) const
		{
			return !operator==(rhs);
		}
		glm::vec4 Position{ 0 };
		glm::vec4 Rotation{ 0 }; 
		glm::vec4 Scale{ 0 };
	};

	/// <summary>
	/// GameObject class extends Attribute, base class for any object we want to make in the game.
	/// </summary>
	class GameObject : public Attribute
	{
		RTTI_DECLARATIONS(GameObject, Attribute);
		public: 

			/// <summary>
			/// Default constructor for GameObject, Calls Attributes Constructor.
			/// </summary>
			GameObject();
			~GameObject() = default; 
			GameObject& operator=(const GameObject& otherGameObject) = default;
			GameObject(const GameObject& otherGameObject) = default;
			GameObject& operator=(GameObject&& otherGameObject) = default;
			GameObject(GameObject&& otherGameObject) = default;

			/// <summary>
			/// Compares that two game objects are equivalent. 
			/// </summary>
			/// <param name="otherGameObject">The other GameObject</param>
			/// <returns>A boolean as to whether the two GameObjects are equal or not.</returns>
			inline bool operator==(const GameObject& otherGameObject) const
			{
				return Name == otherGameObject.Name && Transform == otherGameObject.Transform;
			}

			/// <summary>
			/// Compares that two game objects are not equivalent. 
			/// </summary>
			/// <param name="otherGameObject">The other GameObject</param>
			/// <returns>A boolean as to whether the two GameObjects are equal or not.</returns>
			inline bool operator!=(const GameObject& otherGameObject) const
			{
				return !operator==(otherGameObject);
			}

			/// <summary>
			/// Getter for the Datum of Actions.
			/// </summary>
			/// <returns>A const Datum pointer to the Actions Datum.</returns>
			const Datum* Actions() const;

			/// <summary>
			/// Creates a new Action on the Actions Datum, wraps Adopt. 
			/// </summary>
			/// <param name="className">The name of the Factory class you want to create.</param>
			/// <param name="instanceName">The name of the instance you want to add to the Class Name's datum.</param>
			Scope* CreateAction(const std::string& className, const std::string& instanceName);

			/// <summary>
			/// Updates this GameObject and calls update on all of its children.
			/// </summary>
			/// <param name="gameTime">A constant reference to a GameTime object.</param>
			virtual void Update(const GameTime& gameTime);

			/// <summary>
			/// Clones this GameObject, makes a copy that the user is responsible for deleting.
			/// </summary>
			/// <returns>A pointer to a GameObject, the user is responsible for deleting it.</returns>
			virtual gsl::owner<GameObject*> Clone() const override;

			/// <summary>
			/// Compares two GameObjects to see if they are equal. Calls the operator== for GameObject
			/// </summary>
			/// <param name="rhs">The other RTTI pointer.</param>
			/// <returns>A boolean as to whether they are equal or not.</returns>
			virtual bool Equals(const RTTI* rhs) const override;

			/// <summary>
			/// Converts the GameObject to a string.
			/// </summary>
			/// <returns>A string.</returns>
			virtual std::string ToString() const override;

			/// <summary>
			/// The vector of signatures, becomes the prescribed Attributes of the GameObject. 
			/// </summary>
			/// <returns></returns>
			static const Vector<Signature> Signatures();

			std::string Name;
			Transform Transform;
			
	protected:
		explicit GameObject(RTTI::IdType childID);
		

	};
	ConcreteFactory(GameObject, Scope);
}
