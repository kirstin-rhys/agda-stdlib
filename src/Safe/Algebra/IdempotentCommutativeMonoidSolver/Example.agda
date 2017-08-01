------------------------------------------------------------------------
-- The Agda standard library
--
-- An example of how Algebra.IdempotentCommutativeMonoidSolver can be
-- used
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Algebra.IdempotentCommutativeMonoidSolver.Example where

open import Safe.Relation.Binary.PropositionalEquality using (_≡_; refl; cong₂; isEquivalence)

open import Safe.Data.Bool.Base using (Bool; true; false; if_then_else_; not; _∧_; _∨_)
open import Safe.Data.Bool.Properties using (isBooleanAlgebra)

open import Safe.Data.Fin using (zero; suc)
open import Safe.Data.Vec using ([]; _∷_)

open import Safe.Algebra
open import Safe.Algebra.Structures using (module IsBooleanAlgebra; module IsDistributiveLattice; module IsLattice)
open IsBooleanAlgebra isBooleanAlgebra using (∧-comm; ∧-assoc; ∨-comm; ∨-assoc; ∨-∧-distribʳ; isDistributiveLattice; isLattice)

open import Safe.Algebra.Properties.DistributiveLattice (record { isDistributiveLattice = isDistributiveLattice })

∨-icm : IdempotentCommutativeMonoid _ _
∨-icm = record
     { Carrier = Bool
     ; _≈_     = _≡_
     ; _∙_     = _∨_
     ; ε       = false
     ; isIdempotentCommutativeMonoid = record
       { isCommutativeMonoid = record
         { isSemigroup = record
           { isEquivalence = isEquivalence
           ; assoc         = ∨-assoc
           ; ∙-cong        = cong₂ _∨_
           }
         ; identityˡ = λ x → refl
         ; comm      = ∨-comm
         }
       ; idem = ∨-idempotent
       }
     }

open import Safe.Algebra.IdempotentCommutativeMonoidSolver ∨-icm

test : ∀ x y z → (x ∨ y) ∨ (x ∨ z) ≡ (z ∨ y) ∨ x
test a b c = let _∨_ = _⊕_ in
  prove 3 ((x ∨ y) ∨ (x ∨ z)) ((z ∨ y) ∨ x) (a ∷ b ∷ c ∷ [])
  where
  x = var zero
  y = var (suc zero)
  z = var (suc (suc zero))
