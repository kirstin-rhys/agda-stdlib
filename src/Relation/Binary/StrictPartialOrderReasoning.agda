------------------------------------------------------------------------
-- The Agda standard library
--
-- Convenient syntax for "equational reasoning" using a strict partial
-- order
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.StrictPartialOrderReasoning
         {p₁ p₂ p₃} (S : StrictPartialOrder p₁ p₂ p₃) where

open import Safe.Relation.Binary.StrictPartialOrderReasoning S public
