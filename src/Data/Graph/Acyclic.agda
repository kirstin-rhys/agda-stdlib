------------------------------------------------------------------------
-- The Agda standard library
--
-- Directed acyclic multigraphs
------------------------------------------------------------------------

-- A representation of DAGs, based on the idea underlying Martin
-- Erwig's FGL. Note that this representation does not aim to be
-- efficient.


module Data.Graph.Acyclic where

open import Safe.Data.Graph.Acyclic public