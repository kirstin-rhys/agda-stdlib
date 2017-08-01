------------------------------------------------------------------------
-- The Agda standard library
--
-- Solver for equations in commutative monoids
--
-- Adapted from Algebra.Monoid-solver
------------------------------------------------------------------------

open import Algebra

open import Data.Fin using (Fin; zero; suc)
open import Data.Maybe as Maybe
  using (Maybe; decToMaybe; From-just; from-just)
open import Data.Nat.Base as ℕ using (ℕ; zero; suc; _+_)
open import Data.Product using (_×_; proj₁; proj₂; uncurry)
open import Data.Vec using (Vec; []; _∷_; lookup; replicate)

open import Function using (_∘_)

import Relation.Binary.EqReasoning   as EqReasoning
import Relation.Binary.Reflection    as Reflection
import Relation.Binary.Vec.Pointwise as Pointwise
import Relation.Nullary.Decidable    as Dec

open import Relation.Binary.PropositionalEquality as P using (_≡_; decSetoid)
open import Relation.Nullary using (Dec)


module Algebra.CommutativeMonoidSolver {m₁ m₂} (M : CommutativeMonoid m₁ m₂) where

open import Safe.Algebra.CommutativeMonoidSolver M public
