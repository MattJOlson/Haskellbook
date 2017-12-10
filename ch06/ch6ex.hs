module Ch6Ex where

import Data.List (sort)

data Rocks = Rocks String deriving (Eq, Ord, Show)

data Yeah = Yeah Bool deriving (Eq, Ord, Show)

data Papu = Papu Rocks Yeah deriving (Eq, Ord, Show)

truth = Papu (Rocks "chomskydoz")
             (Yeah True)

equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p' < p

i :: Num a => a
i = 1

f :: RealFrac a => a
f = 1.0

freud :: Ord a => a -> a
freud x = x

freud' :: Int -> Int
freud' x = x

myX = 1 :: Int
sigmund :: a -> Int
sigmund x = myX

jung :: [Int] -> Int
jung xs = head (sort xs)

young :: Ord a => [a] -> a
young xs = head (sort xs)

mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (mySort xs)

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk pred foo ref = ref == (pred foo)

arith :: Num b
         => (a -> b)
         -> Integer
         -> a
         -> b
arith gen i base = (fromInteger i) + (gen base)
