------------------------------------------------------------------------
-- The Agda standard library
--
-- Convenient syntax for "equational reasoning" using a strict partial
-- order
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



open import Safe.Relation.Binary
module Safe.Relation.Binary.StrictPartialOrderReasoning
         {p₁ p₂ p₃} (S : StrictPartialOrder p₁ p₂ p₃) where

import Safe.Relation.Binary.PreorderReasoning as PreR
import Safe.Relation.Binary.Properties.StrictPartialOrder as SPO
open PreR (SPO.preorder S) public
open import Safe.Data.Sum

_<⟨_⟩_ : ∀ x {y z} → _ → y IsRelatedTo z → x IsRelatedTo z
x <⟨ x∼y ⟩ y∼z = x ∼⟨ inj₁ x∼y ⟩ y∼z

infixr 2 _<⟨_⟩_
