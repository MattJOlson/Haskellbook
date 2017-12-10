module TypeFu where

-- ex 1
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = g . f

-- ex 2
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = w . q

-- ex 3
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

-- ex 4
munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w
munge xy ywz = fst . ywz . xy
