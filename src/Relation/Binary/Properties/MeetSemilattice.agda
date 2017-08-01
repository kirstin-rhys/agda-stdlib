------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by meet semilattices
------------------------------------------------------------------------

open import Relation.Binary.Lattice


module Relation.Binary.Properties.MeetSemilattice
  {c ℓ₁ ℓ₂} (M : MeetSemilattice c ℓ₁ ℓ₂) where

open import Safe.Relation.Binary.Properties.MeetSemilattice M public
