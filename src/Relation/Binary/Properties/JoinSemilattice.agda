------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by join semilattices
------------------------------------------------------------------------

open import Relation.Binary.Lattice


module Relation.Binary.Properties.JoinSemilattice
  {c ℓ₁ ℓ₂} (J : JoinSemilattice c ℓ₁ ℓ₂) where

open import Safe.Relation.Binary.Properties.JoinSemilattice J public
