------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by decidable total orders
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



open import Safe.Relation.Binary
module Safe.Relation.Binary.Properties.DecTotalOrder
         {d₁ d₂ d₃} (DT : DecTotalOrder d₁ d₂ d₃) where

open Safe.Relation.Binary.DecTotalOrder DT hiding (trans)
import Safe.Relation.Binary.NonStrictToStrict as Conv
open Conv _≈_ _≤_

strictTotalOrder : StrictTotalOrder _ _ _
strictTotalOrder = record
  { isStrictTotalOrder = record
      { isEquivalence = isEquivalence
      ; trans         = trans isPartialOrder
      ; compare       = trichotomous Eq.sym _≟_ antisym total
      }
  }

open StrictTotalOrder strictTotalOrder public
