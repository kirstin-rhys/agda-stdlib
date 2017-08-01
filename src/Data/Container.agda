------------------------------------------------------------------------
-- The Agda standard library
--
-- Containers, based on the work of Abbott and others
------------------------------------------------------------------------


module Data.Container where

open import Safe.Data.Container public

open import Data.M

ν : ∀ {ℓ} → Container ℓ → Set ℓ
ν C = M (Shape C) (Position C)
