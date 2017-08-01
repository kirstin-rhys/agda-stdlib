------------------------------------------------------------------------
-- The Agda standard library
--
-- Properties related to propositional list membership
------------------------------------------------------------------------

open import Data.List
open import Data.List.Any as Any using (here; there)
open import Data.List.Any.Properties
import Data.List.Any.Membership as Membership
open import Data.Product using (∃; _×_; _,_)
open import Function using (flip)
open import Relation.Binary
open import Relation.Binary.InducedPreorders using (InducedPreorder₂)
open import Relation.Binary.List.Pointwise as ListEq
  using () renaming (Rel to ListRel)



module Data.List.Any.Membership.Properties where

open import Safe.Data.List.Any.Membership.Properties public