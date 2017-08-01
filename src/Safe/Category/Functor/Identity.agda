------------------------------------------------------------------------
-- The Agda standard library
--
-- The identity functor
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Category.Functor.Identity where

open import Safe.Category.Functor

Identity : ∀ {f} → Set f → Set f
Identity A = A

IdentityFunctor : ∀ {f} → RawFunctor (Identity {f})
IdentityFunctor = record
  { _<$>_ = λ x → x
  }
