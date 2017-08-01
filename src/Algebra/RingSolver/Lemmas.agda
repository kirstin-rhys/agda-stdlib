------------------------------------------------------------------------
-- The Agda standard library
--
-- Some boring lemmas used by the ring solver
------------------------------------------------------------------------

-- Note that these proofs use all "almost commutative ring" properties.

open import Algebra
open import Algebra.RingSolver.AlmostCommutativeRing


module Algebra.RingSolver.Lemmas
  {r₁ r₂ r₃}
  (coeff : RawRing r₁)
  (r : AlmostCommutativeRing r₂ r₃)
  (morphism : coeff -Raw-AlmostCommutative⟶ r)
  where

open import Safe.Algebra.RingSolver.Lemmas coeff r morphism
  public
