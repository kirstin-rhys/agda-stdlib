------------------------------------------------------------------------
-- The Agda standard library
--
-- Vectors defined in terms of Data.Star
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Star.Vec where

open import Safe.Data.Star
open import Safe.Data.Star.Nat
open import Safe.Data.Star.Fin using (Fin)
open import Safe.Data.Star.Decoration
open import Safe.Data.Star.Pointer as Pointer hiding (lookup)
open import Safe.Data.Star.List using (List)
open import Safe.Relation.Binary
open import Safe.Relation.Binary.Consequences
open import Safe.Function
open import Safe.Data.Unit

-- The vector type. Vectors are natural numbers decorated with extra
-- information (i.e. elements).

Vec : Set → ℕ → Set
Vec a = All (λ _ → a)

-- Nil and cons.

[] : ∀ {a} → Vec a zero
[] = ε

infixr 5 _∷_

_∷_ : ∀ {a n} → a → Vec a n → Vec a (suc n)
x ∷ xs = ↦ x ◅ xs

-- Projections.

head : ∀ {a n} → Vec a (1# + n) → a
head (↦ x ◅ _) = x

tail : ∀ {a n} → Vec a (1# + n) → Vec a n
tail (↦ _ ◅ xs) = xs

-- Append.

infixr 5 _++_

_++_ : ∀ {a m n} → Vec a m → Vec a n → Vec a (m + n)
_++_ = _◅◅◅_

-- Safe lookup.

lookup : ∀ {a n} → Fin n → Vec a n → a
lookup i xs with Pointer.lookup i xs
... | result _ x = x

------------------------------------------------------------------------
-- Conversions

fromList : ∀ {a} → (xs : List a) → Vec a (length xs)
fromList ε        = []
fromList (x ◅ xs) = x ∷ fromList xs

toList : ∀ {a n} → Vec a n → List a
toList = gmap (const tt) decoration
