------------------------------------------------------------------------
-- The Agda standard library
--
-- Digits and digit expansions
------------------------------------------------------------------------


module Data.Digit where

open import Safe.Data.Digit public

open import Data.Char.Base using (Char)
open import Safe.Data.Nat
open import Data.Nat.DivMod
open import Safe.Data.Nat.Properties
open SemiringSolver
open ≤-Reasoning
open import Safe.Data.Fin as Fin using (Fin; zero; suc; toℕ)
open import Safe.Data.List.Base
open import Safe.Data.Vec as Vec using (Vec; _∷_; [])
open import Safe.Data.Product
open import Safe.Induction.Nat using (<′-rec; <′-Rec)
open import Safe.Function
open import Safe.Relation.Nullary.Decidable
open import Safe.Relation.Binary.PropositionalEquality as P using (_≡_; refl)

------------------------------------------------------------------------
-- Showing digits

-- The characters used to show the first 16 digits.

digitChars : Vec Char 16
digitChars =
  '0' ∷ '1' ∷ '2' ∷ '3' ∷ '4' ∷ '5' ∷ '6' ∷ '7' ∷ '8' ∷ '9' ∷
  'a' ∷ 'b' ∷ 'c' ∷ 'd' ∷ 'e' ∷ 'f' ∷ []

-- showDigit shows digits in base ≤ 16.

showDigit : ∀ {base} {base≤16 : True (base ≤? 16)} →
            Digit base → Char
showDigit {base≤16 = base≤16} d =
  Vec.lookup (Fin.inject≤ d (toWitness base≤16)) digitChars

------------------------------------------------------------------------
-- A boring lemma

private

  lem : ∀ x k r → 2 + x ≤′ r + (1 + x) * (2 + k)
  lem x k r = ≤⇒≤′ $ begin
    2 + x
      ≤⟨ m≤m+n _ _ ⟩
    2 + x + (x + (1 + x) * k + r)
      ≡⟨ solve 3 (λ x r k → con 2 :+ x :+ (x :+ (con 1 :+ x) :* k :+ r)
                              :=
                            r :+ (con 1 :+ x) :* (con 2 :+ k))
                 refl x r k ⟩
    r + (1 + x) * (2 + k)
      ∎

-- toDigits b n yields the digits of n, in base b, starting with the
-- _least_ significant digit.
--
-- Note that the list of digits is always non-empty.

toDigits : (base : ℕ) {base≥2 : True (2 ≤? base)} (n : ℕ) →
           ∃ λ (ds : List (Fin base)) → fromDigits ds ≡ n
toDigits zero       {base≥2 = ()} _
toDigits (suc zero) {base≥2 = ()} _
toDigits (suc (suc k)) n = <′-rec Pred helper n
  where
  base = suc (suc k)
  Pred = λ n → ∃ λ ds → fromDigits ds ≡ n

  cons : ∀ {m} (r : Fin base) → Pred m → Pred (toℕ r + m * base)
  cons r (ds , eq) = (r ∷ ds , P.cong (λ i → toℕ r + i * base) eq)

  helper : ∀ n → <′-Rec Pred n → Pred n
  helper n                       rec with n divMod base
  helper .(toℕ r + 0     * base) rec | result zero    r refl = ([ r ] , refl)
  helper .(toℕ r + suc x * base) rec | result (suc x) r refl =
    cons r (rec (suc x) (lem (pred (suc x)) k (toℕ r)))
