------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties of functions, such as associativity and commutativity
------------------------------------------------------------------------

-- These properties can (for instance) be used to define algebraic
-- structures.

open import Level
open import Relation.Binary
open import Data.Sum

-- The properties are specified using the following relation as
-- "equality".


module Algebra.FunctionProperties
         {a ℓ} {A : Set a} (_≈_ : Rel A ℓ) where

open import Safe.Algebra.FunctionProperties _≈_ public
