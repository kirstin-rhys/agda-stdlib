------------------------------------------------------------------------
-- The Agda standard library
--
-- Application of substitutions to lists, along with various lemmas
------------------------------------------------------------------------

-- This module illustrates how Data.Fin.Substitution.Lemmas.AppLemmas
-- can be used.

open import Safe.Data.Fin.Substitution.Lemmas

module Data.Fin.Substitution.List {T} (lemmas₄ : Lemmas₄ T) where

open import Safe.Data.Fin.Substitution.List lemmas₄ public
