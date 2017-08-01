------------------------------------------------------------------------
-- The Agda standard library
--
-- Some derivable properties
------------------------------------------------------------------------

open import Algebra


module Algebra.Properties.BooleanAlgebra
         {b₁ b₂} (B : BooleanAlgebra b₁ b₂)
         where

open import Safe.Algebra.Properties.BooleanAlgebra B public
