------------------------------------------------------------------------
-- The Agda standard library
--
-- Some derivable properties
------------------------------------------------------------------------

open import Algebra


module Algebra.Properties.AbelianGroup
         {g₁ g₂} (G : AbelianGroup g₁ g₂) where

open import Safe.Algebra.Properties.AbelianGroup G public
