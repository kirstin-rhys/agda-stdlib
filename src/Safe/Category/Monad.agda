------------------------------------------------------------------------
-- The Agda standard library
--
-- Monads
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



-- Note that currently the monad laws are not included here.
module Safe.Category.Monad where

open import Safe.Function
open import Safe.Category.Monad.Indexed
open import Safe.Data.Unit

RawMonad : ∀ {f} → (Set f → Set f) → Set _
RawMonad M = RawIMonad {I = ⊤} (λ _ _ → M)

RawMonadZero : ∀ {f} → (Set f → Set f) → Set _
RawMonadZero M = RawIMonadZero {I = ⊤} (λ _ _ → M)

RawMonadPlus : ∀ {f} → (Set f → Set f) → Set _
RawMonadPlus M = RawIMonadPlus {I = ⊤} (λ _ _ → M)

module RawMonad {f} {M : Set f → Set f}
                (Mon : RawMonad M) where
  open RawIMonad Mon public

module RawMonadZero {f} {M : Set f → Set f}
                    (Mon : RawMonadZero M) where
  open RawIMonadZero Mon public

module RawMonadPlus {f} {M : Set f → Set f}
                    (Mon : RawMonadPlus M) where
  open RawIMonadPlus Mon public
