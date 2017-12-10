module Print1 where

main :: IO ()
main = print "Hello, world"

main2 :: IO ()
main2 = do
    putStrLn "Count to four for me!"
    putStr "One, two, "
    putStr "three, and"
    putStrLn " four!"

