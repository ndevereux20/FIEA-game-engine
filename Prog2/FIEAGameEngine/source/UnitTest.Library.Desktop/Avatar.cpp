#include "pch.h"
#include "Avatar.h"


namespace UnitTestLibraryDesktop
{
	RTTI_DEFINITIONS(Avatar);

	Avatar::Avatar() :
		GameObject(Avatar::TypeIdClass())
	{

	}

	gsl::owner<Avatar*> Avatar::Clone() const
	{
		return new Avatar(*this);
	}

	Vector<Signature> Avatar::Signatures()
	{
		return Vector<Signature>
		{
			{"HitPoints"s, DatumTypes::Integer, 1, offsetof(Avatar, HitPoints)}
		};
	}

	void Avatar::Update(const GameTime& gameTime)
	{
		GameObject::Update(gameTime);
		--HitPoints;
	}

	bool Avatar::Equals(const RTTI* rhs) const
	{
		const auto rhsAvatar = rhs->As<Avatar>();
		if (rhsAvatar == nullptr)
		{
			return false;
		}
		return GameObject::Equals(rhs) && HitPoints == rhsAvatar->HitPoints;
	}

}