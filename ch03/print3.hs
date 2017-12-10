module Print3 where

myGreeting :: String
myGreeting = "hello" ++ " world"

hello :: String
hello = "hello"

world :: String
world = "world"

main :: IO ()
main = do
    putStrLn myGreeting
    putStrLn secondGreeting
    where secondGreeting =
            concat [hello, " ", world]

myFlipped :: String
myFlipped = (++) "hello" " world"

main2 :: IO ()
main2 = do
    putStrLn myFlipped
    putStrLn secondFlipped
    where secondFlipped =
            (++) hello ((++) " " world)

printBroken :: String -> IO ()
printBroken greeting = putStrLn greeting

main3 :: IO ()
main3 = do
    putStrLn greeting
    printBroken greeting
    where greeting = "omg"
