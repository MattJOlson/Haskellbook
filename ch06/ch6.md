# Typeclasses

Typeclass polymorphism is "ad-hoc" because "typeclass code is dispatched
by type"; prefer "constrained polymorphism" to "ad-hoc polymorphism".
- uh, ok, w/e that ad-hoc business kinda confused me but I guess it's
  historical

"Typeclasses allow us to generalize over a set of types in order to
define and execute a standard set of features for those types"

Okay, so let's see some typeclass implementations. Here's neat shit for
pair:

```
Prelude> :info (,)
data (,) a b = (,) a b  -- Defined in `GHC.Tuple'
instance (Bounded a, Bounded b) => Bounded (a, b)
  -- Defined in `GHC.Enum'
instance (Eq a, Eq b) => Eq (a, b) -- Defined in `GHC.Classes'
instance Monoid a => Monad ((,) a) -- Defined in `GHC.Base'
instance Functor ((,) a) -- Defined in `GHC.Base'
instance (Ord a, Ord b) => Ord (a, b) -- Defined in `GHC.Classes'
instance (Show a, Show b) => Show (a, b) -- Defined in `GHC.Show'
instance Monoid a => Applicative ((,) a) -- Defined in `GHC.Base'
instance Foldable ((,) a) -- Defined in `Data.Foldable'
instance Traversable ((,) a) -- Defined in `Data.Traversable'
instance (Monoid a, Monoid b) => Monoid (a, b)
  -- Defined in `GHC.Base'
```

That shows some useful patterns, eg `(Eq a, Eq b) => Eq (a, b)` and the
function slicing stuff like `Monoid a => Applicative ((,) a)`. Again,
the syntax all kind of hangs together.

We can magically derive `Eq`, `Ord`, `Bounded`, `Read`, and `Show`.

Never use `Read`. It's partial (`read "blerp" :: Integer` throws).

Typeclasses can't override each others' methods (omg yes they wrote
"methods", what is even real)

...

In `Ord`, ordering for sum types is defined by the order in which the
alternatives are declared. So `Bool = False | True` means `False <
True`, `Maybe a = Nothing | Just a` means `Nothing < Just 10`, etc. This
means I can do weird shit like `max Nothing (Just 10)` and get `Just 10`
but I probably shouldn't.

...

Whoa we're talking about `IO ()`

`main` _only_ produces side effects. Well, ...yeah, I guess

"When you have a value like `IO String` it's more of _a means of
producing_ a `String`, which may involve doing IO"

...

Typeclasses are defined by the methods and values they provide
Typeclass _instances_ are unique pairings of typeclass and type

...

The more general your typeclasses, the more specific you're being about
what you want to do with your function arguments

...

_Typeclass inheritance_ is when one typeclass has a superclass (e.g.
`Num` is a superclass of `Fractional`), and inherits its methods.
Simple, eh? Probably easy for me to get fucked by OO intuition here.

An _instance_ is the definition of how a typeclass works for a given
type. (Maybe has an instance of Monad, f'rex)
