------------------------------------------------------------------------
-- The Agda standard library
--
-- Universes
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Universe where

open import Safe.Data.Product
open import Safe.Function
open import Safe.Level

-- Universes.

record Universe u e : Set (suc (u ⊔ e)) where
  field
    -- Codes.
    U : Set u

    -- Decoding function.
    El : U → Set e

-- Indexed universes.

record Indexed-universe i u e : Set (suc (i ⊔ u ⊔ e)) where
  field
    -- Index set.
    I : Set i

    -- Codes.
    U : I → Set u

    -- Decoding function.
    El : ∀ {i} → U i → Set e

  -- An indexed universe can be turned into an unindexed one.

  unindexed-universe : Universe (i ⊔ u) e
  unindexed-universe = record
    { U  = ∃ λ i → U i
    ; El = El ∘ proj₂
    }
