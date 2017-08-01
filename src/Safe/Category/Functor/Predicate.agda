------------------------------------------------------------------------
-- The Agda standard library
--
-- Functors on indexed sets (predicates)
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



-- Note that currently the functor laws are not included here.
module Safe.Category.Functor.Predicate where

open import Safe.Function
open import Safe.Level
open import Safe.Relation.Unary
open import Safe.Relation.Unary.PredicateTransformer using (PT)

record RawPFunctor {i j ℓ₁ ℓ₂} {I : Set i} {J : Set j}
                   (F : PT I J ℓ₁ ℓ₂) : Set (i ⊔ j ⊔ suc ℓ₁ ⊔ suc ℓ₂)
                   where
  infixl 4 _<$>_ _<$_

  field
    _<$>_ : ∀ {P Q} → P ⊆ Q → F P ⊆ F Q

  _<$_ : ∀ {P Q} → (∀ {i} → P i) → F Q ⊆ F P
  x <$ y = const x <$> y
