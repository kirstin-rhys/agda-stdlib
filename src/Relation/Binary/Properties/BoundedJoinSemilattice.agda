------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by bounded join semilattices
------------------------------------------------------------------------

open import Relation.Binary.Lattice


module Relation.Binary.Properties.BoundedJoinSemilattice
  {c ℓ₁ ℓ₂} (J : BoundedJoinSemilattice c ℓ₁ ℓ₂) where

open import Safe.Relation.Binary.Properties.BoundedJoinSemilattice J public
