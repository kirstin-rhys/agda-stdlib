------------------------------------------------------------------------
-- The Agda standard library
--
-- The free monad construction on indexed containers
------------------------------------------------------------------------

{-# OPTIONS --safe #-}


module Safe.Data.Container.Indexed.FreeMonad where

open import Safe.Level
open import Safe.Function hiding (const)
open import Safe.Category.Monad.Predicate
open import Safe.Data.Container.Indexed hiding (_∈_)
open import Safe.Data.Container.Indexed.Combinator hiding (id; _∘_)
open import Safe.Data.Empty
open import Safe.Data.Sum using (inj₁; inj₂)
open import Safe.Data.Product
open import Safe.Data.W.Indexed
open import Safe.Relation.Unary
open import Safe.Relation.Unary.PredicateTransformer
open import Safe.Relation.Binary.PropositionalEquality

------------------------------------------------------------------------

infixl 9 _⋆C_
infix  9 _⋆_

_⋆C_ : ∀ {i o c r} {I : Set i} {O : Set o} →
       Container I O c r → Pred O c → Container I O _ _
C ⋆C X = const X ⊎ C

_⋆_ : ∀ {ℓ} {O : Set ℓ} → Container O O ℓ ℓ → Pt O ℓ
C ⋆ X = μ (C ⋆C X)

pattern returnP x = (inj₁ x , _)
pattern doP c k   = (inj₂ c , k)

do : ∀ {ℓ} {O : Set ℓ} {C : Container O O ℓ ℓ} {X} →
     ⟦ C ⟧ (C ⋆ X) ⊆ C ⋆ X
do (c , k) = sup (doP c k)

rawPMonad : ∀ {ℓ} {O : Set ℓ} {C : Container O O ℓ ℓ} →
            RawPMonad {ℓ = ℓ} (_⋆_ C)
rawPMonad {C = C} = record
  { return? = return
  ; _=<?_  = _=<<_
  }
  where
  return : ∀ {X} → X ⊆ C ⋆ X
  return x = sup (inj₁ x , ⊥-elim ∘ lower)

  _=<<_ : ∀ {X Y} → X ⊆ C ⋆ Y → C ⋆ X ⊆ C ⋆ Y
  f =<< sup (returnP x) = f x
  f =<< sup (doP c k)   = do (c , λ r → f =<< k r)

leaf : ∀ {ℓ} {O : Set ℓ} {C : Container O O ℓ ℓ} {X : Pred O ℓ} →
       ⟦ C ⟧ X ⊆ C ⋆ X
leaf (c , k) = do (c , return? ∘ k)
  where
  open RawPMonad rawPMonad

generic : ∀ {ℓ} {O : Set ℓ} {C : Container O O ℓ ℓ} {o}
          (c : Command C o) →
          o ∈ C ⋆ (⋃[ r ∶ Response C c ] ｛ next C c r ｝)
generic c = do (c , λ r → return? (r , refl))
  where
  open RawPMonad rawPMonad
