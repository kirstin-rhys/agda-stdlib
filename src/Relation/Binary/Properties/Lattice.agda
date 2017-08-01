------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by lattices
------------------------------------------------------------------------

open import Relation.Binary.Lattice


module Relation.Binary.Properties.Lattice
  {c ℓ₁ ℓ₂} (L : Lattice c ℓ₁ ℓ₂) where

open import Safe.Relation.Binary.Properties.Lattice L public
