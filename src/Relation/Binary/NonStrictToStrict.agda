------------------------------------------------------------------------
-- The Agda standard library
--
-- Conversion of ≤ to <, along with a number of properties
------------------------------------------------------------------------

-- Possible TODO: Prove that a conversion ≤ → < → ≤ returns a
-- relation equivalent to the original one (and similarly for
-- < → ≤ → <).

open import Relation.Binary


module Relation.Binary.NonStrictToStrict
         {a ℓ₁ ℓ₂} {A : Set a}
         (_≈_ : Rel A ℓ₁) (_≤_ : Rel A ℓ₂)
         where

open import Safe.Relation.Binary.NonStrictToStrict _≈_ _≤_ public
