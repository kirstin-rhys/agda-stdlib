------------------------------------------------------------------------
-- The Agda standard library
--
-- Substitutions
------------------------------------------------------------------------

-- Uses a variant of Conor McBride's technique from "Type-Preserving
-- Renaming and Substitution".

-- See Data.Fin.Substitution.Example for an example of how this module
-- can be used: a definition of substitution for the untyped
-- λ-calculus.


module Data.Fin.Substitution where

open import Safe.Data.Fin.Substitution public