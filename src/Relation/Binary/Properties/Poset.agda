------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by posets
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.Properties.Poset
         {p₁ p₂ p₃} (P : Poset p₁ p₂ p₃) where

open import Safe.Relation.Binary.Properties.Poset P public
