------------------------------------------------------------------------
-- The Agda standard library
--
-- Some defined operations (multiplication by natural number and
-- exponentiation)
------------------------------------------------------------------------

open import Algebra


module Algebra.Operations {s₁ s₂} (S : Semiring s₁ s₂) where

open import Safe.Algebra.Operations S public
