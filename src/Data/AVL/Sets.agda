------------------------------------------------------------------------
-- The Agda standard library
--
-- Finite sets, based on AVL trees
------------------------------------------------------------------------

open import Relation.Binary
open import Relation.Binary.PropositionalEquality using (_≡_)


module Data.AVL.Sets
  {k ℓ} {Key : Set k} {_<_ : Rel Key ℓ}
  (isStrictTotalOrder : IsStrictTotalOrder _≡_ _<_)
  where

open import Safe.Data.AVL.Sets isStrictTotalOrder public
