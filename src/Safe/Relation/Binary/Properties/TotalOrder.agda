------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by total orders
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



open import Safe.Relation.Binary
module Safe.Relation.Binary.Properties.TotalOrder
         {t₁ t₂ t₃} (T : TotalOrder t₁ t₂ t₃) where

open Safe.Relation.Binary.TotalOrder T
open import Safe.Relation.Binary.Consequences

decTotalOrder : Decidable _≈_ → DecTotalOrder _ _ _
decTotalOrder ≟ = record
  { isDecTotalOrder = record
      { isTotalOrder = isTotalOrder
      ; _≟_          = ≟
      ; _≤?_         = total+dec⟶dec reflexive antisym total ≟
      }
  }
