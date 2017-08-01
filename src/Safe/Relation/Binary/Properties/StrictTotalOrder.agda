------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by strict partial orders
------------------------------------------------------------------------

{-# OPTIONS --safe #-}

open import Safe.Relation.Binary
module Safe.Relation.Binary.Properties.StrictTotalOrder
       {s₁ s₂ s₃} (STO : StrictTotalOrder s₁ s₂ s₃)
       where

open Safe.Relation.Binary.StrictTotalOrder STO
import Safe.Relation.Binary.StrictToNonStrict as Conv
open Conv _≈_ _<_
import Safe.Relation.Binary.Properties.StrictPartialOrder as SPO
open import Safe.Relation.Binary.Consequences

------------------------------------------------------------------------
-- Strict total orders can be converted to decidable total orders

decTotalOrder : DecTotalOrder _ _ _
decTotalOrder = record
  { isDecTotalOrder = record
    { isTotalOrder = record
      { isPartialOrder = SPO.isPartialOrder strictPartialOrder
      ; total          = total compare
      }
    ; _≟_  = _≟_
    ; _≤?_ = decidable' compare
    }
  }

open DecTotalOrder decTotalOrder public
