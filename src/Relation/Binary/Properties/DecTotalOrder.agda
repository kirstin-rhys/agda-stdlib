------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by decidable total orders
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.Properties.DecTotalOrder
         {d₁ d₂ d₃} (DT : DecTotalOrder d₁ d₂ d₃) where

open import Safe.Relation.Binary.Properties.DecTotalOrder DT public
