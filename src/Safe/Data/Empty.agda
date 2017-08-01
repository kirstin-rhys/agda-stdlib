------------------------------------------------------------------------
-- The Agda standard library
--
-- Empty type
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Empty where

open import Safe.Level

data ⊥ : Set where

{-# FOREIGN GHC data AgdaEmpty #-}
{-# COMPILE GHC ⊥ = data MAlonzo.Code.Data.Empty.AgdaEmpty () #-}

⊥-elim : ∀ {w} {Whatever : Set w} → ⊥ → Whatever
⊥-elim ()
