------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by strict partial orders
------------------------------------------------------------------------

{-# OPTIONS --safe #-}

open import Safe.Relation.Binary
module Safe.Relation.Binary.Properties.StrictPartialOrder
       {s₁ s₂ s₃} (SPO : StrictPartialOrder s₁ s₂ s₃) where

open Safe.Relation.Binary.StrictPartialOrder SPO
  renaming (trans to <-trans)
import Safe.Relation.Binary.StrictToNonStrict as Conv
open Conv _≈_ _<_

------------------------------------------------------------------------
-- Strict partial orders can be converted to posets

poset : Poset _ _ _
poset = record
  { isPartialOrder = record
    { isPreorder = record
        { isEquivalence = isEquivalence
        ; reflexive     = reflexive
        ; trans         = trans isEquivalence <-resp-≈ <-trans
        }
    ; antisym = antisym isEquivalence <-trans irrefl
    }
  }

open Poset poset public
