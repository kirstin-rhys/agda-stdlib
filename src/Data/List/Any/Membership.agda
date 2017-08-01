------------------------------------------------------------------------
-- The Agda standard library
--
-- List membership and some related definitions
------------------------------------------------------------------------

open import Relation.Binary hiding (Decidable)


module Data.List.Any.Membership {c ℓ} (S : Setoid c ℓ) where

open import Safe.Data.List.Any.Membership S public
