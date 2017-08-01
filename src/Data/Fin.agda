------------------------------------------------------------------------
-- The Agda standard library
--
-- Finite sets
------------------------------------------------------------------------

-- Note that elements of Fin n can be seen as natural numbers in the
-- set {m | m < n}. The notation "m" in comments below refers to this
-- natural number view.


module Data.Fin where

open import Safe.Data.Fin public