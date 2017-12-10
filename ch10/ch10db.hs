module DbExample where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
    [ DbDate (UTCTime
                (fromGregorian 1911 5 1)
                (secondsToDiffTime 34123)),
      DbNumber 9001,
      DbString "Hello, World",
      DbNumber 3,
      DbDate (UTCTime
                (fromGregorian 1921 5 1)
                (secondsToDiffTime 34123))
    ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate [] = []
filterDbDate ((DbDate utc):xs) = utc : filterDbDate xs
filterDbDate (_:xs) = filterDbDate xs

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber [] = []
filterDbNumber ((DbNumber i):xs) = i : filterDbNumber xs
filterDbNumber (_:xs) = filterDbNumber xs

early = UTCTime (fromGregorian 1900 1 1) (secondsToDiffTime 0)

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = (foldr (\c m -> if c < m then m else c) early) 
             . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = (foldr (+) 0) . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb db = (fromIntegral sum) / (fromIntegral count) where
            sum = sumDb db
            count = length $ filterDbNumber db
