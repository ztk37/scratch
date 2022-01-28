module Scratch.Abstract.Result where

data Result e a = Err e | Ok a
  deriving (Eq, Show)