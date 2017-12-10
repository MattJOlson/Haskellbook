module EqInstances where

data TisAnInteger =
    TisAn Integer
    deriving Show

instance Eq TisAnInteger where
    (==) (TisAn a) (TisAn b) = a == b

data IntOrString =
    TisAnInt Int
    | TisAString String
    deriving Show

instance Eq IntOrString where
    (==) (TisAnInt i) (TisAnInt j) = i == j
    (==) (TisAString s) (TisAString t) = s == t
    (==) _ _ = False

data Pair a =
    Pair a a
    deriving Show

instance Eq a => Eq (Pair a) where
    (==) (Pair x y) (Pair z w) = x == z && y == w

data Tuple a b =
    Tuple a b
    deriving Show

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple s t) (Tuple u v) = s == u && t == v

data Which a =
    ThisOne a
    | ThatOne a
    deriving Show

instance Eq a => Eq (Which a) where
    (==) (ThisOne a) (ThisOne b) = a == b
    (==) (ThatOne a) (ThatOne b) = a == b
    (==) _ _ = False

data EitherOr a b =
    Hello a
    | Goodbye b
    deriving Show

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello s) (Hello t) = s == t
    (==) (Goodbye s) (Goodbye t) = s == t
    (==) _ _ = False
