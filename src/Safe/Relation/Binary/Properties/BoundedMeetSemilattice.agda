------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by bounded meet semilattices
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



open import Safe.Relation.Binary.Lattice
module Safe.Relation.Binary.Properties.BoundedMeetSemilattice
  {c ℓ₁ ℓ₂} (M : BoundedMeetSemilattice c ℓ₁ ℓ₂) where

open BoundedMeetSemilattice M

import Safe.Algebra.FunctionProperties as P; open P _≈_
open import Safe.Data.Product
open import Safe.Function using (_∘_; flip)
open import Safe.Relation.Binary
open import Safe.Relation.Binary.Properties.Poset poset
import Safe.Relation.Binary.Properties.BoundedJoinSemilattice as J

-- The dual construction is a bounded join semilattice.

dualIsBoundedJoinSemilattice : IsBoundedJoinSemilattice _≈_ (flip _≤_) _∧_ ⊤
dualIsBoundedJoinSemilattice = record
  { isJoinSemilattice = record
    { isPartialOrder  = invIsPartialOrder
    ; supremum        = infimum
    }
  ; minimum           = maximum
  }

dualBoundedJoinSemilattice : BoundedJoinSemilattice c ℓ₁ ℓ₂
dualBoundedJoinSemilattice = record
  { ⊥                        = ⊤
  ; isBoundedJoinSemilattice = dualIsBoundedJoinSemilattice
  }

open J dualBoundedJoinSemilattice public
