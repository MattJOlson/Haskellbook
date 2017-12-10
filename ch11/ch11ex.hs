module Ch11ex where

-- 11.6, Early type/data ctor exercises
newtype Price =
    Price Integer deriving (Eq, Show)

newtype Capacity =
    Passengers Integer deriving (Eq, Show)

data Manufacturer =
      Mini
    | Mazda
    | Tata
      deriving (Eq, Show)

data Airline =
      PapuAir
    | CatapultsR'Us
    | TakeYourChancesUnited
      deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline Capacity
             deriving (Eq, Show)

myCar   = Car Mini (Price 14000)
urCar   = Car Mazda (Price 20000)
clownCar= Car Tata (Price 7000)
doge    = Plane PapuAir (Passengers 340)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _           = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

getManu :: Vehicle -> Maybe Manufacturer
getManu (Car m _) = Just m
getManu _         = Nothing

-- 11.11, dicking around with record syntax
data Person = 
    Person {
        name :: String,
        age :: Int
    } deriving (Eq, Show)

-- Showing projections from records
isTrustworthy :: Person -> Bool
isTrustworthy p
    | age p <= 30 = True
    | otherwise   = False

-- 11.13, dicking around with builders
data Cat =
    Kitteh String Integer Bool
    deriving (Eq, Show)

catNamed :: String -> Integer -> Bool -> Cat
catNamed = Kitteh

withAge :: Integer -> (Integer -> Bool -> Cat) -> Bool -> Cat
withAge i k = k i

isGood :: Bool -> (Bool -> Cat) ->  Cat
isGood g k = k g

-- 11.17, binary trees
data BinaryTree a =
      Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
    | b == a = Node left a right
    | b <  a = Node (insert' b left) a right
    | a <  b = Node left a (insert' b right)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree f Leaf = Leaf
mapTree f (Node left a right) = 
    Node (mapTree f left) (f a) (mapTree f right)

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) =
    a : preorder left ++ preorder right

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) =
    inorder left ++ [a] ++ inorder right

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) =
    postorder left ++ postorder right ++ [a]

-- postorder, we'll fold left, then right, then this
cataTree :: (a -> b -> b) -> b -> BinaryTree a -> b
cataTree f z Leaf = z
cataTree f z (Node left a right) =
    f a righted where
    righted = cataTree f lefted right
    lefted  = cataTree f z left

testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

-- 11.18, chapter exercises
