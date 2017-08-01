------------------------------------------------------------------------
-- The Agda standard library
--
-- Solver for commutative ring or semiring equalities
------------------------------------------------------------------------

-- Uses ideas from the Coq ring tactic. See "Proving Equalities in a
-- Commutative Ring Done Right in Coq" by Grégoire and Mahboubi. The
-- code below is not optimised like theirs, though (in particular, our
-- Horner normal forms are not sparse).

open import Algebra
open import Algebra.RingSolver.AlmostCommutativeRing

open import Relation.Binary


module Algebra.RingSolver
  {r₁ r₂ r₃}
  (Coeff : RawRing r₁)               -- Coefficient "ring".
  (R : AlmostCommutativeRing r₂ r₃)  -- Main "ring".
  (morphism : Coeff -Raw-AlmostCommutative⟶ R)
  (_coeff≟_ : Decidable (Induced-equivalence morphism))
  where

open import Safe.Algebra.RingSolver Coeff R morphism _coeff≟_
  public
