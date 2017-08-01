------------------------------------------------------------------------
-- The Agda standard library
--
-- Implications of nullary relations
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Relation.Nullary.Implication where

open import Safe.Relation.Nullary
open import Safe.Data.Empty

-- Some properties which are preserved by _→_.

infixr 2 _→-dec_

_→-dec_ : ∀ {p q} {P : Set p} {Q : Set q} →
          Dec P → Dec Q → Dec (P → Q)
yes p →-dec no ¬q = no  (λ f → ¬q (f p))
yes p →-dec yes q = yes (λ _ → q)
no ¬p →-dec _     = yes (λ p → ⊥-elim (¬p p))
