------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by strict partial orders
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.Properties.StrictPartialOrder
       {s₁ s₂ s₃} (SPO : StrictPartialOrder s₁ s₂ s₃) where

open import Safe.Relation.Binary.Properties.StrictPartialOrder SPO public
