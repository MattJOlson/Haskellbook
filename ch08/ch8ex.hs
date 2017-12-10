module Ch8ex where

import Data.List (intersperse)

mc91 :: Integral a => a -> a
mc91 n
    | 100 < n   = n - 10
    | otherwise = mc91 . mc91 $ n + 11

digitWord :: Int -> String
digitWord n = case n of
    0 -> "zero"
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"
    _ -> "omg onoz"

digits :: Int -> [Int]
digits n = go n [] where
    go k ds
        -- says "digits", nothing about sign
        | k < 0     = go (negate k) ds
        | k < 10    = k:ds
        | otherwise = go d (m:ds)
        where (d,m) = k `divMod` 10

numberWords :: Int -> String
numberWords = concat . intersperse "-" . map digitWord . digits
