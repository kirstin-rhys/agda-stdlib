------------------------------------------------------------------------
-- The Agda standard library
--
-- AVL trees
------------------------------------------------------------------------

-- AVL trees are balanced binary search trees.

-- The search tree invariant is specified using the technique
-- described by Conor McBride in his talk "Pivotal pragmatism".

open import Relation.Binary
open import Relation.Binary.PropositionalEquality as P using (_≡_)


module Data.AVL
  {k v ℓ}
  {Key : Set k} (Value : Key → Set v)
  {_<_ : Rel Key ℓ}
  (isStrictTotalOrder : IsStrictTotalOrder _≡_ _<_)
  where

open import Safe.Data.AVL Value isStrictTotalOrder public
