module Data.Picture where

import Prelude
-- import Data.Foldable (foldl)

import Global as Global
import Math as Math

gcd :: Int -> Int -> Int
gcd n 0 = n
gcd 0 m = m
gcd n m | n > m     = gcd (n - m) m
        | otherwise = gcd n (m - n)


factorial :: Int -> Int
factorial 0 = 1
factorial n = n * (factorial (n - 1))
