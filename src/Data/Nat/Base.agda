------------------------------------------------------------------------
-- The Agda standard library
--
-- Natural numbers, basic types and operations
------------------------------------------------------------------------


module Data.Nat.Base where

import Relation.Binary.PropositionalEquality.TrustMe as TrustMe
open import Safe.Data.Nat.Base public

erase : ∀ {m n} → m ≤″ n → m ≤″ n
erase (less-than-or-equal eq) = less-than-or-equal (TrustMe.erase eq)
