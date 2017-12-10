module Exercises where

stringId :: String -> String
stringId s = s

nthChar :: Int -> String -> String
nthChar n s = take 1 $ drop (n-1) s

dropNine :: String -> String
dropNine = drop 9
