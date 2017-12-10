# Recursion

"Recursion is self-referential composition" -- oooh, good one.

```
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0 where
    go n   d   count
     | n < d = (count, n)
     | otherwise = go (n - d) d (count + 1)
```

"Common Haskell idiom, a `go` function". Basically an inner function
with an accumulating variable to get to tail recursion, I guess.

So wow, that was a quick chapter.
