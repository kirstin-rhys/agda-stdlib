------------------------------------------------------------------------
-- The Agda standard library
--
-- Instantiates the ring solver with two copies of the same ring with
-- decidable equality
------------------------------------------------------------------------

open import Algebra.RingSolver.AlmostCommutativeRing
open import Relation.Binary


module Algebra.RingSolver.Simple
         {r₁ r₂} (R : AlmostCommutativeRing r₁ r₂)
         (_≟_ : Decidable (AlmostCommutativeRing._≈_ R))
         where

open import Safe.Algebra.RingSolver.Simple R _≟_ public
