module Ch7ex where

tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
          d     = xLast `mod` 10

tensDigit' :: Integral a => a -> a
tensDigit' x = d
    where (_, to) = x `divMod` 100
          d       = to `div` 10

hunsDigit :: Integral a => a -> a
hunsDigit x = d
    where (big, _) = x `divMod` 100
          d        = big `mod` 10

foldBool :: a -> a -> Bool -> a
foldBool p q which =
    case which of
        True -> p
        False -> q

foldBool' :: a -> a -> Bool -> a
foldBool' p q which
    | which == True = p
    | otherwise     = q

g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)
