------------------------------------------------------------------------
-- The Agda standard library
--
-- Natural numbers
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Nat where

open import Safe.Function
open import Safe.Function.Equality as F using (_⟨$⟩_)
open import Safe.Function.Injection using (_↣_)
open import Safe.Data.Sum
open import Safe.Data.Empty
import Safe.Level
open import Safe.Relation.Nullary
import Safe.Relation.Nullary.Decidable as Dec
open import Safe.Relation.Binary
open import Safe.Relation.Binary.PropositionalEquality as PropEq
  using (_≡_; refl)

-- The core type and operations are re-exported from Data.Nat.Base
open import Safe.Data.Nat.Base public

-- If there is an injection from a type to ℕ, then the type has
-- decidable equality.

eq? : ∀ {a} {A : Set a} → A ↣ ℕ → Decidable {A = A} _≡_
eq? inj = Dec.via-injection inj _≟_
