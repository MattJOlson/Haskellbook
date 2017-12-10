module Reverse where

rvrs :: String -> String
rvrs s = 
    let len = length s - 1
        lst = take 1 $ drop len s
        fst = take len s
    in case s of 
        [] -> []
        _  -> lst ++ rvrs fst

main :: IO ()
main = print $ rvrs "Curry is awesome!"
