module Ch9ex where

import Data.Char

myHead :: [a] -> Maybe a
myHead [] = Nothing
myHead (x:_) = Just x

myWords :: String -> [String]
myWords [] = []
myWords s = word : (myWords rest) where
    word = takeWhile (/= ' ') s
    rest = dropWhile (== ' ') $ dropWhile (/= ' ') s

myLines :: String -> [String]
myLines [] = []
myLines s = line : (myLines rest) where
    line = takeWhile (/= '\n') s
    rest = drop 1 $ dropWhile (/= '\n') s
    -- Note that we're splitting \n\n into two lines, but removing all
    --  the space between words in myWords

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (a:as) (b:bs) = (a, b) : (myZip as bs)

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (a:as) (b:bs) = (f a b) : (myZipWith f as bs)

myZip' :: [a] -> [b] -> [(a, b)]
myZip' = myZipWith (,)

selectUpper :: [Char] -> [Char]
selectUpper = filter isUpper

capitalize :: [Char] -> [Char]
capitalize (x:xs) = (toUpper x) : xs

capIt :: [Char] -> [Char]
capIt [] = []
capIt (x:xs) = (toUpper x) : capIt xs

capFirst :: [Char] -> Char
capFirst = toUpper . head

myOr :: [Bool] -> Bool
myOr [] = False
myOr (b:bs) = b || (myOr bs)

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny p (a:as) = (p a) || (myAny p as)

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem p (a:as) = p == a || (myElem p as)

myElem' :: Eq a => a -> [a] -> Bool
myElem' p = any (p ==)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (a:as) = (myReverse as) ++ [a]

squish :: [[a]] -> [a]
squish [] = []
squish (a:as) = a ++ (squish as)

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (a:as) = (f a) ++ (squishMap f as)

squish' :: [[a]] -> [a]
squish' = squishMap id

myMaxBy :: (a -> a -> Ordering) -> [a] -> a
myMaxBy _ [a] = a
myMaxBy o (a:as) = if (o a b) == GT then a else b
    where b = myMaxBy o as

myMax :: (Ord a) => [a] -> a
myMax = myMaxBy compare
