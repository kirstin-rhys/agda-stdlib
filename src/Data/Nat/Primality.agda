------------------------------------------------------------------------
-- The Agda standard library
--
-- Primality
------------------------------------------------------------------------


module Data.Nat.Primality where

open import Safe.Data.Nat.Primality public

open import Safe.Data.Nat
open import Data.Nat.Divisibility
open import Safe.Data.Fin.Dec
open import Safe.Relation.Nullary
open import Safe.Relation.Nullary.Decidable
open import Safe.Relation.Nullary.Negation
open import Safe.Relation.Unary

-- Decision procedure for primality.

prime? : Decidable Prime
prime? 0             = no λ()
prime? 1             = no λ()
prime? (suc (suc n)) = all? λ _ → ¬? (_ ∣? _)

private

  -- Example: 2 is prime.

  2-is-prime : Prime 2
  2-is-prime = from-yes (prime? 2)
