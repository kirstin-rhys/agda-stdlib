------------------------------------------------------------------------
-- The Agda standard library
--
-- Boolean algebra expressions
------------------------------------------------------------------------

open import Algebra


module Algebra.Properties.BooleanAlgebra.Expression
  {b} (B : BooleanAlgebra b b)
  where

open import Safe.Algebra.Properties.BooleanAlgebra.Expression B public
