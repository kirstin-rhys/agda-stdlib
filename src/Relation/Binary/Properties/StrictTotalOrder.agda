------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by strict partial orders
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.Properties.StrictTotalOrder
       {s₁ s₂ s₃} (STO : StrictTotalOrder s₁ s₂ s₃)
       where

open import Safe.Relation.Binary.Properties.StrictTotalOrder STO public
