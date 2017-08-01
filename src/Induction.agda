------------------------------------------------------------------------
-- The Agda standard library
--
-- An abstraction of various forms of recursion/induction
------------------------------------------------------------------------

-- The idea underlying Induction.* comes from Epigram 1, see Section 4
-- of "The view from the left" by McBride and McKinna.

-- Note: The types in this module can perhaps be easier to understand
-- if they are normalised. Note also that Agda can do the
-- normalisation for you.

module Induction where

open import Safe.Induction public
