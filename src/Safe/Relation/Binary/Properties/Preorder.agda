------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties satisfied by preorders
------------------------------------------------------------------------

{-# OPTIONS --safe #-}

open import Safe.Relation.Binary
module Safe.Relation.Binary.Properties.Preorder
         {p₁ p₂ p₃} (P : Preorder p₁ p₂ p₃) where

open import Safe.Function
open import Safe.Data.Product as Prod

open Safe.Relation.Binary.Preorder P

-- The inverse relation is also a preorder.

invIsPreorder : IsPreorder _≈_ (flip _∼_)
invIsPreorder = record
  { isEquivalence = isEquivalence
  ; reflexive     = reflexive ∘ Eq.sym
  ; trans         = flip trans
  }

invPreorder : Preorder p₁ p₂ p₃
invPreorder = record { isPreorder = invIsPreorder }

------------------------------------------------------------------------
-- For every preorder there is an induced equivalence

InducedEquivalence : Setoid _ _
InducedEquivalence = record
  { _≈_           = λ x y → x ∼ y × y ∼ x
  ; isEquivalence = record
    { refl  = (refl , refl)
    ; sym   = swap
    ; trans = Prod.zip trans (flip trans)
    }
  }
