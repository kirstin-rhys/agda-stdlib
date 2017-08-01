------------------------------------------------------------------------
-- The Agda standard library
--
-- An irrelevant version of ⊥-elim
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Empty.Irrelevant where

open import Safe.Data.Empty hiding (⊥-elim)

⊥-elim : ∀ {w} {Whatever : Set w} → .⊥ → Whatever
⊥-elim ()
