# Haskellbook ch5: Types

System F -- typed lambda calculus, dates back to 1970s

## Function type
Let's understand `(->)` -- this is the type constructor for functions

```
Prelude> :info (->)
data (->) t1 t2         -- Defined in `GHC.Prim'
infixr 0 `(->)`
instance Monad ((->) r) -- Defined in `GHC.Base'
instance Functor ((->) r) -- Defined in `GHC.Base'
instance Applicative ((->) a) -- Defined in `GHC.Base'
instance Monoid b => Monoid (a -> b) -- Defined in `GHC.Base'
```

Functions are values; `->` has no type constructors

`->` is right-associative, although function application is
left-associative.

`a -> b -> c` == `a -> (b -> c)`, as you'd expect with currying.
- Oh, maybe this is why the `Monoid` instance up there puts a monoidal
  constraint on the second argument to `->`!

    "The association here is not to control precedence or order of
    evaluation; it only serves to group the parameters into argument and
    result" -- true only b/c Haskell is lazy?

Functions cannot care about (fully) polymorphic types:

`length :: Foldable t => t a -> Int` -- `length` cannot care about the
elements in its argument, can't do anything with them, can't compute
anything on them.

In a constrained type signature, nothing to the left of `=>` shows up at
term level.

Application is evaluation; the only way to evaluate something is to
apply it, and application is _left_-associative.

Yeah yeah yeah, partial application.

`undefined` is sort of like F#'s `failwith`, in that it lets you
type-check things you haven't implemented yet

```
Prelude> let f :: a -> a -> a -> a ; f = undefined
Prelude> :t f
f :: a -> a -> a -> a
Prelude> :t f 'f'
f 'f' :: Char -> Char -> Char
```

Constrained polymorphism as "ad-hoc" polymorphism; wat?

In a function that's parametrically polymorphic on `a`, _nothing can be
done with that `a`_. Compare/contrast constrained `Num a => a`, which
brings operations along for the ride. Consider the type of `>>=`:

```
Prelude> :t (>>=)
(>>=) :: Monad m => m a -> (a -> m b) -> m b
```

Here `m` is constrained, so bind can do stuff with `m`'s monad-ness, but
`a` and `b` are unconstrained (bind is parametrically polymorphic over
them), so bind can't operate on them. (That's what the second argument
is for!)

Typeclasses reduce the number of values that can inhabit a parameter
while bringing along operations on those values.

Typeclasses are additive; an `Int` brings along operations on `Num` and
`Integral` for the ride.

Numeric literals are polymorphic! 10 is a `Num t => t`, 6.3 is a
`Fractional t => t`, until they get used in more concrete math. So
constants can be polymorphic too (until they eventually get evaluated).

## Type inference
Damas name-checked! Haskell's type inference is extended DHM.

Inferred type signatures are most useful while writing code, once a
chunk's done add the type sig explicitly.

Types can be declared locally in `let` and `where` blocks, although why
you'd want to can be somewhat obscure


