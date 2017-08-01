------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by preorders
------------------------------------------------------------------------

open import Relation.Binary


module Relation.Binary.Properties.Preorder
         {p₁ p₂ p₃} (P : Preorder p₁ p₂ p₃) where

open import Safe.Relation.Binary.Properties.Preorder P public
