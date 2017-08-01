------------------------------------------------------------------------
-- The Agda standard library
--
-- Booleans
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Bool where

open import Safe.Relation.Nullary
open import Safe.Relation.Binary
open import Safe.Relation.Binary.PropositionalEquality as PropEq
  using (_≡_; refl)

------------------------------------------------------------------------
-- The boolean type and some operations

open import Data.Bool.Base public

------------------------------------------------------------------------
-- Some properties

decSetoid : DecSetoid _ _
decSetoid = PropEq.decSetoid _≟_
