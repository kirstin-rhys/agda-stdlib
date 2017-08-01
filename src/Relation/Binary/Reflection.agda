------------------------------------------------------------------------
-- The Agda standard library
--
-- Helpers intended to ease the development of "tactics" which use
-- proof by reflection
------------------------------------------------------------------------

open import Data.Fin
open import Data.Nat
open import Data.Vec as Vec
open import Function
open import Function.Equality using (_⟨$⟩_)
open import Function.Equivalence using (module Equivalence)
open import Level
open import Relation.Binary
import Relation.Binary.PropositionalEquality as P

-- Think of the parameters as follows:
--
-- * Expr:    A representation of code.
-- * var:     The Expr type should support a notion of variables.
-- * ⟦_⟧:     Computes the semantics of an expression. Takes an
--            environment mapping variables to something.
-- * ⟦_⇓⟧:    Computes the semantics of the normal form of the
--            expression.
-- * correct: Normalisation preserves the semantics.
--
-- Given these parameters two "tactics" are returned, prove and solve.
--
-- For an example of the use of this module, see Algebra.RingSolver.

module Relation.Binary.Reflection
         {e a s}
         {Expr : ℕ → Set e} {A : Set a}
         (Sem : Setoid a s)
         (var : ∀ {n} → Fin n → Expr n)
         (⟦_⟧ ⟦_⇓⟧ : ∀ {n} → Expr n → Vec A n → Setoid.Carrier Sem)
         (correct : ∀ {n} (e : Expr n) ρ →
                    ⟦ e ⇓⟧ ρ ⟨ Setoid._≈_ Sem ⟩ ⟦ e ⟧ ρ)
         where

open import Safe.Function.Equivalence using (module Equivalence)
open import Level
open import Relation.Binary
import Relation.Binary.PropositionalEquality as P

-- Think of the parameters as follows:
--
-- * Expr:    A representation of code.
-- * var:     The Expr type should support a notion of variables.
-- * ⟦_⟧:     Computes the semantics of an expression. Takes an
--            environment mapping variables to something.
-- * ⟦_⇓⟧:    Computes the semantics of the normal form of the
--            expression.
-- * correct: Normalisation preserves the semantics.
--
-- Given these parameters two "tactics" are returned, prove and solve.
--
-- For an example of the use of this module, see Algebra.RingSolver.

open import Safe.Relation.Binary.Reflection Sem var ⟦_⟧ ⟦_⇓⟧ correct
         public
