------------------------------------------------------------------------
-- The Agda standard library
--
-- Instantiates the ring solver, using the natural numbers as the
-- coefficient "ring"
------------------------------------------------------------------------

open import Algebra
import Algebra.Operations
open import Relation.Nullary


module Algebra.RingSolver.Natural-coefficients
         {r₁ r₂}
         (R : CommutativeSemiring r₁ r₂)
         (dec : let open CommutativeSemiring R
                    open Algebra.Operations semiring in
                ∀ m n → Dec (m × 1# ≈ n × 1#)) where

open import Safe.Algebra.RingSolver.Natural-coefficients R dec public
