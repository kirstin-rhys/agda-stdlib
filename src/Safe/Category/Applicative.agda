------------------------------------------------------------------------
-- The Agda standard library
--
-- Applicative functors
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



-- Note that currently the applicative functor laws are not included
-- here.
module Safe.Category.Applicative where

open import Safe.Data.Unit
open import Safe.Category.Applicative.Indexed

RawApplicative : ∀ {f} → (Set f → Set f) → Set _
RawApplicative F = RawIApplicative {I = ⊤} (λ _ _ → F)

module RawApplicative {f} {F : Set f → Set f}
                      (app : RawApplicative F) where
  open RawIApplicative app public
