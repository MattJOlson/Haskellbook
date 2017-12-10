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
