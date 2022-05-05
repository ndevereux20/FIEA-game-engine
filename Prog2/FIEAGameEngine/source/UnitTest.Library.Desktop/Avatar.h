#pragma once
#include "GameObject.h"
#include "Vector.h"

namespace UnitTestLibraryDesktop
{
	class Avatar final :public FieaGameEngine::GameObject
	{
		RTTI_DECLARATIONS(Avatar, FieaGameEngine::GameObject);

	public:
		Avatar();

		void Update(const FieaGameEngine::GameTime& gameTime) override;
		gsl::owner<Avatar*> Clone() const override;
		static FieaGameEngine::Vector<FieaGameEngine::Signature> Signatures();
		virtual bool Equals(const RTTI* rhs) const override;

		int HitPoints{ 100 };

	};
	ConcreteFactory(Avatar, FieaGameEngine::Scope);
}

