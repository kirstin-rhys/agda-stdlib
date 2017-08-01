------------------------------------------------------------------------
-- The Agda standard library
--
-- Induced preorders
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.InducedPreorders
         {s₁ s₂}
         (S : Setoid s₁ s₂)  -- The underlying equality.
         where

open import Safe.Relation.Binary.InducedPreorders S public
