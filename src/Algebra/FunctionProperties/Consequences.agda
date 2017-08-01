------------------------------------------------------------------------
-- The Agda standard library
--
-- Relations between properties of functions, such as associativity and
-- commutativity
------------------------------------------------------------------------

open import Relation.Binary using (Setoid)


module Algebra.FunctionProperties.Consequences
  {a ℓ} (S : Setoid a ℓ) where

open import Safe.Algebra.FunctionProperties.Consequences S public
