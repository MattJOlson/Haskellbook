# Haskellbook ch3: Strings

A `String` is a `[Char]`

Okay, interesting;
    `print :: Show a => a -> IO ()`
    `putStrLn :: String -> IO ()`
Both result in a trailing `\n` maybe because of String's `Show` instance

First intuitions with kinds:
```
> :kind String
String :: *
> :kind IO
IO :: * -> *
> :kind IO ()
IO () :: *
> :kind print
<interactive>:1:1: error: Not in scope: type variable `print'
```

Whoop whoop, first instance of `Foldable t` replacing `[]`

```
*TopOrLocal> [1, 2] ++ [3.0, 4.0]
[1.0,2.0,3.0,4.0]
*TopOrLocal> :t [1, 2]
[1, 2] :: Num t => [t]
*TopOrLocal> :t [3.0, 4.0]
[3.0, 4.0] :: Fractional t => [t]
*TopOrLocal> :t [1, 2] ++ [3.0, 4.0]
[1, 2] ++ [3.0, 4.0] :: Fractional a => [a]
*TopOrLocal>
```

So `head` and `tail` throw on empty lists (`tail "F" -> ""`), but `take`
and `drop` work as expected.

The indexer op `!!` has the index on the right, which I guess is inline
more or less with `[]`.

Okay, I don't know how to kill a runaway recursive loop in ghci right
now. Guess I'll figure that out later!
