------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by total orders
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.Properties.TotalOrder
         {t₁ t₂ t₃} (T : TotalOrder t₁ t₂ t₃) where

open import Safe.Relation.Binary.Properties.TotalOrder T public
