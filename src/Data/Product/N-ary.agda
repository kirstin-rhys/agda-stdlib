------------------------------------------------------------------------
-- The Agda standard library
--
-- N-ary products
------------------------------------------------------------------------

-- Vectors (as in Data.Vec) also represent n-ary products, so what is
-- the point of this module? The n-ary products below are intended to
-- be used with a fixed n, in which case the nil constructor can be
-- avoided: pairs are represented as pairs (x , y), not as triples
-- (x , y , unit).


module Data.Product.N-ary where

open import Safe.Data.Product.N-ary public