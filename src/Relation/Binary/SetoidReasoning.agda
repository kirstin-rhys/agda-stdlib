------------------------------------------------------------------------
-- The Agda standard library
--
-- Convenient syntax for "equational reasoning" in multiple Setoids
------------------------------------------------------------------------

-- Example use:
--
--   open import Data.Maybe
--   import Relation.Binary.SetoidReasoning as SetR
--
--   begin⟨ S ⟩
--     x
--       ≈⟨ drop-just (begin⟨ setoid S ⟩
--          just x
--            ≈⟨ justx≈mz ⟩
--          mz
--            ≈⟨ mz≈justy ⟩
--          just y ∎) ⟩
--     y
--       ≈⟨ y≈z ⟩
--     z ∎

open import Relation.Binary.EqReasoning as EqR using (_IsRelatedTo_)
open import Relation.Binary
open import Relation.Binary.Core

open Setoid


module Relation.Binary.SetoidReasoning where

open import Safe.Relation.Binary.SetoidReasoning public