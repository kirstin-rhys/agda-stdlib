------------------------------------------------------------------------
-- The Agda standard library
--
-- Instantiates the ring solver, using the natural numbers as the
-- coefficient "ring"
------------------------------------------------------------------------

{-# OPTIONS --safe #-}



open import Safe.Algebra
import Safe.Algebra.Operations
open import Safe.Relation.Nullary
module Safe.Algebra.RingSolver.Natural-coefficients
         {r₁ r₂}
         (R : CommutativeSemiring r₁ r₂)
         (dec : let open CommutativeSemiring R
                    open Safe.Algebra.Operations semiring in
                ∀ m n → Dec (m × 1# ≈ n × 1#)) where

import Safe.Algebra.RingSolver
open import Safe.Algebra.RingSolver.AlmostCommutativeRing
open import Safe.Data.Nat.Base as ℕ
open import Safe.Data.Product using (module Σ)
open import Safe.Function
import Safe.Relation.Binary.EqReasoning
import Safe.Relation.Nullary.Decidable as Dec

open CommutativeSemiring R
open Safe.Algebra.Operations semiring
open Safe.Relation.Binary.EqReasoning setoid

private

  -- The coefficient "ring".

  ℕ-ring : RawRing _
  ℕ-ring = record
    { Carrier = ℕ
    ; _+_     = ℕ._+_
    ; _*_     = ℕ._*_
    ; -_      = id
    ; 0#      = 0
    ; 1#      = 1
    }

  -- There is a homomorphism from ℕ to R.
  --
  -- Note that _×′_ is used rather than _×_. If _×_ were used, then
  -- Function.Related.TypeIsomorphisms.test would fail to type-check.

  homomorphism :
    ℕ-ring -Raw-AlmostCommutative⟶ fromCommutativeSemiring R
  homomorphism = record
    { ⟦_⟧    = λ n → n ×′ 1#
    ; +-homo = ×′-homo-+ 1#
    ; *-homo = ×′1-homo-*
    ; -‿homo = λ _ → refl
    ; 0-homo = refl
    ; 1-homo = refl
    }

  -- Equality of certain expressions can be decided.

  dec′ : ∀ m n → Dec (m ×′ 1# ≈ n ×′ 1#)
  dec′ m n = Dec.map′ to from (dec m n)
    where
    to : m × 1# ≈ n × 1# → m ×′ 1# ≈ n ×′ 1#
    to m≈n = begin
      m ×′ 1#  ≈⟨ sym $ ×≈×′ m 1# ⟩
      m ×  1#  ≈⟨ m≈n ⟩
      n ×  1#  ≈⟨ ×≈×′ n 1# ⟩
      n ×′ 1#  ∎

    from : m ×′ 1# ≈ n ×′ 1# → m × 1# ≈ n × 1#
    from m≈n = begin
      m ×  1#  ≈⟨ ×≈×′ m 1# ⟩
      m ×′ 1#  ≈⟨ m≈n ⟩
      n ×′ 1#  ≈⟨ sym $ ×≈×′ n 1# ⟩
      n ×  1#  ∎

-- The instantiation.

open Safe.Algebra.RingSolver _ _ homomorphism dec′ public
