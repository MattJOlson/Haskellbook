#chapter 4, datatypes

Data declarations are how types are defined

## Term level vs type level

Term level: Code literals (`Nothing`, `Just Integer`, `[Char]`, etc)

Type level: I guess stuff like `Maybe a` and `Bool`
-- what about `Just a` as part of the definiton of `Maybe a`? Probably
type level
-- guessing `Just a` is to `Maybe a` as `Just 1` is to `Maybe Integer`

Example:

`data Mood = Blah | Woot`

- `Mood` is the type constructor
-- Type constructors show up in type declarations
- `Blah` and `Woot` are data constructors
-- I also hear "value constructors", or is that shit I just made up?
-- Same thing according to wiki.haskell.org
- Whole thing is a _data declaration_

More on type-level vs term-level
- :k <type ctor> works, :k <data ctor> and :k <name> fail
- :t <type ctor> fails, :t <data ctor> and :t <name> work

Okay this is interesting

:k Monad and :k Functor are
(* -> *) -> Constraint

:k Monoid and :k Num are
* -> Constraint

:k IO is
* -> *

## Back to types.

So another thing back to types. `<const> :: <type>` is yer standard cast

Comparison ops are what you'd expect, with `/=` instead of `<>` or `!-`
for not-equals.

Okay this is cool

```
Prelude> :t if True then "Truthin" else "Falsin"
if True then "Truthin" else "Falsin" :: [Char]
```

Okay, tuples. Product types. Thing.

"You must supply BOTH arguments to construct a value" -- challenge
fucking accepted mofo

```
Prelude> :k (,)
(,) :: * -> * -> *
```

Okay I don't have this one down just yet. But, ambitions!

```
Prelude> :t (,) 23
(,) 23 :: Num a => b -> (a, b)
```

Wait wut

```
Prelude> :t length
length :: Foldable t => t a -> Int
```

Why does `length` return an `Int` instead of an `Integer`, or some
typeclass like `Integral`? Probably perf

`/` is for `Fractional`s, `div` is for Integrals

*Def:* A _typeclass_ is a set of operations defined wrt a polymorphic
type. When a type has an instance of a typeclass, values of that type
can be used in the standard operations defined for that typeclass

Typeclasses are unique pairings of class and instance, so if Foo has an
instance of Eq, it has _only one_ instance of Eq.
- How does this jibe with + and * as monoids on Int?

Data constructors can take arguments, like functions

```
type Name = String

-- Cats don't answer to their names, apparently?
data Pet = Cat | Dog Name
```

Here `Pet` is the type constructor, and `Cat` and `Dog a` are the data
constructors.

The data declaration `data Foo = <data ctors>` declares a new type,
`type Foo = Bar` is a type alias.

Parametric polymorphism is unconstraned, e.g. `id :: a -> a`
Constrained polymorphism is e.g. `isEqual :: Eq a => a -> a -> Bool`

I'm not sure why we make this distinction, yet.

## Named things

### Term level
(where values live, where code executes)
- functions
- term-level variables
- data constructors

### Type level
(where type inference happens)
- type variables
- type constructors
- typeclasses

### Program level
- modules


