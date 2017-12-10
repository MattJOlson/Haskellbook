module Cipher where

import Data.Char

rotateUpper :: Int -> Char -> Char
rotateUpper n c = chr $ (ord 'A' +) $ flip mod 26 $ n + (ord c - ord 'A')

rotateLower :: Int -> Char -> Char
rotateLower n c = chr $ (ord 'a' +) $ flip mod 26 $ n + (ord c - ord 'a')

caesar :: Int -> [Char] -> [Char]
caesar _ [] = []
caesar n (a:as)
    | isUpper a = rotateUpper n a : caesar n as
    | isLower a = rotateLower n a : caesar n as
    | otherwise =               a : caesar n as

unCaesar :: Int -> [Char] -> [Char]
unCaesar n = caesar (-n)
