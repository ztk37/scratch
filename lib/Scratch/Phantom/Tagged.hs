module Scratch.Phantom.Tagged where

data Tagged tag a = Tagged
    { unTagged :: a
    } deriving (Eq, Show)