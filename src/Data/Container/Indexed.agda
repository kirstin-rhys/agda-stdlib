------------------------------------------------------------------------
-- The Agda standard library
--
-- Indexed containers aka interaction structures aka polynomial
-- functors. The notation and presentation here is closest to that of
-- Hancock and Hyvernat in "Programming interfaces and basic topology"
-- (2006/9).
--
------------------------------------------------------------------------


module Data.Container.Indexed where

open import Safe.Data.Container.Indexed public

open import Relation.Unary
open import Data.M.Indexed

ν : ∀ {o c r} {O : Set o} → Container O O c r → Pred O _
ν = M
