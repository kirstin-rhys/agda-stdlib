------------------------------------------------------------------------
-- The Agda standard library
--
-- Bounded vectors (inefficient implementation)
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



-- Vectors of a specified maximum length.
module Safe.Data.Star.BoundedVec where

open import Safe.Data.Star
open import Safe.Data.Star.Nat
open import Safe.Data.Star.Decoration
open import Safe.Data.Star.Pointer
open import Safe.Data.Star.List using (List)
open import Safe.Data.Unit
open import Safe.Function
import Safe.Data.Maybe.Base as Maybe
open import Safe.Relation.Binary
open import Safe.Relation.Binary.Consequences

------------------------------------------------------------------------
-- The type

-- Finite sets decorated with elements (note the use of suc).

BoundedVec : Set → ℕ → Set
BoundedVec a n = Any (λ _ → a) (λ _ → ⊤) (suc n)

[] : ∀ {a n} → BoundedVec a n
[] = this tt

infixr 5 _∷_

_∷_ : ∀ {a n} → a → BoundedVec a n → BoundedVec a (suc n)
_∷_ = that

------------------------------------------------------------------------
-- Increasing the bound

-- Note that this operation is linear in the length of the list.

↑ : ∀ {a n} → BoundedVec a n → BoundedVec a (suc n)
↑ {a} = gmap inc lift
  where
  inc = Maybe.map (map-NonEmpty suc)

  lift : Pointer (λ _ → a) (λ _ → ⊤) =[ inc ]⇒
         Pointer (λ _ → a) (λ _ → ⊤)
  lift (step x) = step x
  lift (done _) = done _

------------------------------------------------------------------------
-- Conversions

fromList : ∀ {a} → (xs : List a) → BoundedVec a (length xs)
fromList ε        = []
fromList (x ◅ xs) = x ∷ fromList xs

toList : ∀ {a n} → BoundedVec a n → List a
toList xs = gmap (const tt) decoration (init xs)
