------------------------------------------------------------------------
-- The Agda standard library
--
-- Primality
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Nat.Primality where

open import Safe.Data.Empty
open import Safe.Data.Fin as Fin hiding (_+_)
open import Safe.Data.Nat
open import Safe.Data.Nat.Divisibility
open import Safe.Relation.Nullary

-- Definition of primality.

Prime : ℕ → Set
Prime 0             = ⊥
Prime 1             = ⊥
Prime (suc (suc n)) = (i : Fin n) → ¬ (2 + Fin.toℕ i ∣ 2 + n)

