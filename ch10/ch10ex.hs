module Ch10Ex where

import Data.Char

fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs

-- Review, section 1
stops = "pbtdkg"
vowels = "aeiou"

allStopVowelStops :: [(Char,Char,Char)]
allStopVowelStops = [(s,v,s') | s <- stops, v <- vowels, s' <- stops]

onlyPStarts :: [(Char,Char,Char)]
onlyPStarts = filter (\(s,_,_) -> s == 'p') allStopVowelStops

isVowel = (flip elem) vowels

-- Folds, pointfree
myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
--myAny f xs = foldr (||) False $ map f xs
--myAny f = foldr (||) False . map f
myAny = (foldr (||) False .) . map

myElem :: Eq a => a -> [a] -> Bool
--myElem a = any (== a)
myElem = any . (==)

myElem' :: Eq a => a -> [a] -> Bool
--myElem' a = foldr (\x b -> (x == a) || b) False
--myElem' a = foldr (\x -> ((x == a) ||)) False
--myElem' a = foldr ((||) . (== a)) False
myElem' = (foldr (||) False .) . map . (==) -- just inlined myAny

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
--myMap f as = foldr ((:) . f) [] as
--myMap f = foldr ((:) . f) []
myMap = flip foldr [] . ((:) .)

myFilter :: (a -> Bool) -> [a] -> [a]
--myFilter f as = foldr (\x bs -> if f x then x:bs else bs) [] as
myFilter f = foldr (\x -> if f x then (x:) else id) []

squish :: [[a]] -> [a]
--squish as = foldr (++) [] as
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
--squishMap f as = foldr (\a bs -> f a ++ bs) [] as
--squishMap f = foldr (\a -> (f a ++)) []
--squishMap f = foldr ((++) . f) []
squishMap = flip foldr [] . ((++) . )

squish' :: [[a]] -> [a]
squish' = squishMap id

myMaxBy :: (a -> a -> Ordering) -> [a] -> a
myMaxBy cmp (a:as) = foldl (\g x -> if cmp g x == GT then g else x) a as
