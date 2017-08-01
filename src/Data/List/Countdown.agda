------------------------------------------------------------------------
-- The Agda standard library
--
-- A data structure which keeps track of an upper bound on the number
-- of elements /not/ in a given list
------------------------------------------------------------------------

import Level
open import Relation.Binary


module Data.List.Countdown (D : DecSetoid Level.zero Level.zero) where

open import Safe.Data.List.Countdown D public
