{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

-- Num a => a
e1a = (* 9) 6

-- Num a => (a, String)
e1b = head [(1, "doge"), (2, "kitteh")]

-- (Integer, String)
e1c = head [(1 :: Integer, "doge"), (2, "kitteh")]

-- Bool
e1d  = if False then True else False

-- Int
e1e = length [1, 2, 3, 4, 5]

-- Bool
e1f = (length [1, 2, 3, 4]) > (length "FOOBAR")

x = 5
y = x+5

w = y*10 -- Num a => a
z y = y*10 -- Num a => a -> a
f = 4 / y -- Fractional a => a

s = "Julie"
t = " <3 "
u = "Haskell"
v = s ++ t ++ u

bignum a = (^) 5 $ 10
wahoo = bignum $ 10

x' = print
y' = print "woohoo"
z' = x' "hello world"

functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y =
    if (y < x) then True else False

functionS :: (a, b) -> b
functionS (a, b) = b

ts_i :: a -> a
ts_i x = x

ts_c :: a -> b -> a
ts_c x y = x

ts_c' :: a -> b -> b
ts_c' x y = y

ts_r :: [a] -> [a]
ts_r = reverse

ts_co :: (b -> c) -> (a -> b) -> a -> c
ts_co f g = f . g

ts_a :: (a -> c) -> a -> a
ts_a = ts_c'

ts_a' :: (a -> b) -> a -> b
ts_a' f x = f x 
