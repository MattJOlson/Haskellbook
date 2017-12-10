module TopOrLocal where

topLevelFunction :: Integer -> Integer
topLevelFunction x =
    x + woot + topLevelInteger
    where woot = 10

topLevelInteger :: Integer
topLevelInteger = 5

anotherTLF x topLevelInteger =
    x + woot + topLevelInteger
    where woot = 10

-- ex3
area d = pi * r * r
    where r = d / 2
