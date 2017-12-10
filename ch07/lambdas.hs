module Lambdas where

addOneIfOdd :: Integral a => a -> a
addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = \x -> x + 1

addFive :: (Num a, Ord a) => a -> a -> a
addFive = \x y -> (if y < x then y else x) + 5

mFlip :: (a -> a -> b) -> (a -> a -> b)
mFlip f x y = f y x

interleave :: (a, b) -> (c, d) -> ((a, c), (b, d))
interleave (a, b) (c, d) = ((a, c), (b, d))

k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1+2))
k3 = k (3, True)

f :: (a, b, c)
  -> (d, e, f)
  -> ((a, d), (c, f))
f (a, _, c) (d, _, f) = ((a, d), (c, f))

functionC :: Ord a => a -> a -> a
functionC x y =
    case xg of
        True -> x
        False -> y
    where xg = y < x

ifEvenAdd2 :: Integral a => a -> a
ifEvenAdd2 n =
    case e of
        True -> n+2
        False -> n
    where e = even n 

nums :: (Num a, Ord a) => a -> a
nums x =
    case c of
        LT -> -1
        EQ -> 0
        GT -> 1
    where c = compare x 0

nifty = "Oh cool, this \
        \is a string literal"

dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10

oneIsOne = dodgy 1
oneIsTwo = (flip dodgy) 2

pal xs
    | xs == reverse xs = True
    | otherwise        = False

react x
    | y == True = "woot"
    | otherwise = "aww"
    where y = pal x
