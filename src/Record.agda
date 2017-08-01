------------------------------------------------------------------------
-- The Agda standard library
--
-- Record types with manifest fields and "with", based on Randy
-- Pollack's "Dependently Typed Records in Type Theory"
------------------------------------------------------------------------

-- For an example of how this module can be used, see README.Record.

open import Relation.Binary
open import Relation.Binary.PropositionalEquality
open import Relation.Nullary.Decidable

-- The module is parametrised by the type of labels, which should come
-- with decidable equality.

module Record (Label : Set) (_≟_ : Decidable (_≡_ {A = Label})) where

open import Safe.Record Label _≟_ public
