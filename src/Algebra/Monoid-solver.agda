------------------------------------------------------------------------
-- The Agda standard library
--
-- Solver for monoid equalities
------------------------------------------------------------------------

open import Algebra


module Algebra.Monoid-solver {m₁ m₂} (M : Monoid m₁ m₂) where

open import Safe.Algebra.Monoid-solver M public
