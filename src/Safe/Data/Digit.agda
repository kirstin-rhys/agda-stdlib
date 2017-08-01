------------------------------------------------------------------------
-- The Agda standard library
--
-- Digits and digit expansions
------------------------------------------------------------------------

{-# OPTIONS --safe #-}

module Safe.Data.Digit where

open import Safe.Data.Nat

open import Safe.Data.Fin as Fin using (Fin; zero; suc; toℕ)
open import Safe.Data.List.Base

------------------------------------------------------------------------
-- Digits

-- Digit b is the type of digits in base b.

Digit : ℕ → Set
Digit b = Fin b

-- Some specific digit kinds.

Decimal = Digit 10
Bit     = Digit 2

-- Some named digits.

0b : Bit
0b = zero

1b : Bit
1b = suc zero


------------------------------------------------------------------------
-- Digit expansions

-- fromDigits takes a digit expansion of a natural number, starting
-- with the _least_ significant digit, and returns the corresponding
-- natural number.

fromDigits : ∀ {base} → List (Fin base) → ℕ
fromDigits        []       = 0
fromDigits {base} (d ∷ ds) = toℕ d + fromDigits ds * base
