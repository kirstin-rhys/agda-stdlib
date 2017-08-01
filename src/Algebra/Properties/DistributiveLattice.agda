------------------------------------------------------------------------
-- The Agda standard library
--
-- Some derivable properties
------------------------------------------------------------------------

open import Algebra


module Algebra.Properties.DistributiveLattice
         {dl₁ dl₂} (DL : DistributiveLattice dl₁ dl₂)
         where

open import Safe.Algebra.Properties.DistributiveLattice DL
         public
