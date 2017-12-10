# Haskellbook chapter 2

Oops, need `stack setup` first

REPL: `stack ghci`
- god that takes forever to load

`:load file.hs` does what you expect
`:m` returns to `Prelude` context

"reducible expressions are also called _redexes_", this seems to be
relevant jargon but why/where? Context?

REPL: `let <fn def'n>` vs. bare `<fn def'n>` in source

Function names start lowercase; snake case is fine but no kebab case

"Haskell doesn’t evaluate everything to canonical or normal form by
default. Instead, it only evaluates to weak head normal form (WHNF) by
default"

123123 / 123 works, as does (/) 123123 123, but 123123 `(/)` 123 doesn't
work, weird

"If a function's name is alphanumeric, it is prefix by default"

"Not all prefix functions can be made infix" -- only dyadic ones?

"If a function's name is a symbol, it is infix by default"

Yes, Virginia, exponentiation is not associative

"Parse error on <subsequent line>" can indicate an indent-offsides
failure

`quot` and `rem`, and `div` and `mod`, are often used and kind of
important. They have laws on p70; circle back and sort that shit out.
They're obviously paired up, let's see if there's an obv difference:

```
(quot x y)*y + (rem x y) == x

(div x y)*y + (mod x y) == x
```

Okay, so probably want to pair them. What's the difference?

`div/mod` rounds down, `quot/rem` rounds towards zero. So that's a
potential footgun maybe.

Unary - for negation is less of a special snowflake than usual, yey

`$` causes everything to its right to be evaluated first, obviating
parentheses. We basically have `f $ a = f a`, so I guess `a` gets
evaluated before `f` is applied, which is good I guess.

Partial evaluation(?) of expressions, like `(*30)` or `(2+)`, is called
sectioning. Woot?

`let` introduces an expression (`let blort in ...`)
`where` is bound to a surrounding construct (`module foo where ...`)

So you can have:

`ferp x = let ark = x + 2 in print ark`
`ferp x = print ark where ark = x + 2`
