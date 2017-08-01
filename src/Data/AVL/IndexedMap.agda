------------------------------------------------------------------------
-- The Agda standard library
--
-- Finite maps with indexed keys and values, based on AVL trees
------------------------------------------------------------------------

open import Data.Product as Prod
open import Relation.Binary
open import Relation.Binary.PropositionalEquality using (_≡_)


module Data.AVL.IndexedMap
  {i k v ℓ}
  {Index : Set i} {Key : Index → Set k} (Value : Index → Set v)
  {_<_ : Rel (∃ Key) ℓ}
  (isStrictTotalOrder : IsStrictTotalOrder _≡_ _<_)
  where

open import Safe.Data.AVL.IndexedMap Value isStrictTotalOrder public
