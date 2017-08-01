------------------------------------------------------------------------
-- The Agda standard library
--
-- Operations on nullary relations (like negation and decidability)
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



-- Some operations on/properties of nullary relations, i.e. sets.
module Safe.Relation.Nullary where

open import Safe.Data.Empty
open import Safe.Level

-- Negation.

infix 3 ¬_

¬_ : ∀ {ℓ} → Set ℓ → Set ℓ
¬ P = P → ⊥

-- Decidable relations.

data Dec {p} (P : Set p) : Set p where
  yes : ( p :   P) → Dec P
  no  : (¬p : ¬ P) → Dec P
