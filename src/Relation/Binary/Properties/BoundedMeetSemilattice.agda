------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by bounded meet semilattices
------------------------------------------------------------------------

open import Relation.Binary.Lattice


module Relation.Binary.Properties.BoundedMeetSemilattice
  {c ℓ₁ ℓ₂} (M : BoundedMeetSemilattice c ℓ₁ ℓ₂) where

open import Safe.Relation.Binary.Properties.BoundedMeetSemilattice M public
