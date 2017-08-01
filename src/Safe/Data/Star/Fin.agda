------------------------------------------------------------------------
-- The Agda standard library
--
-- Finite sets defined in terms of Data.Star
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Star.Fin where

open import Safe.Data.Star
open import Safe.Data.Star.Nat as ℕ using (ℕ)
open import Safe.Data.Star.Pointer
open import Safe.Data.Unit

-- Finite sets are undecorated pointers into natural numbers.

Fin : ℕ → Set
Fin = Any (λ _ → ⊤) (λ _ → ⊤)

-- "Constructors".

zero : ∀ {n} → Fin (ℕ.suc n)
zero = this tt

suc : ∀ {n} → Fin n → Fin (ℕ.suc n)
suc = that tt
