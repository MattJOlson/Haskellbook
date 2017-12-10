# Functional patterns

## Binding values to variables
- applying a function binds its parameters to variables
- `let` expressions create scope, syntax:

bindExp x =
    let y = 5 in
    "the arg was " ++ show x ++
    " and y was " ++ show y

(more generally, `let <bindings> in <block>`)

- `y` is only in scope inside the let block
- declare an `x` in the let block and it'll shadow the argument

## Pattern matching
- patterns are matched/dispatched against values or data constructors,
  NOT against types
- first match wins, make your top pattern the most specific
- use `-Wall` to make non-exhaustive matches a compile-time warning
  (wait, how do I make it an error? Oh nice, `-Werror`)

### Digression on `newtype`
"`newtype` is a special case of `data` that allows only one constructor
and only one field." ok then

Back to pattern matching. Note that this works on tuples (probably
because of data constructor shit)

```
interleave :: (a, b) -> (c, d) -> ((a, c), (b, d))
interleave (a, b) (c, d) = ((a, c), (b, d))
```

## Case expressions

Whee, look at where clauses

```
react x =
  case y of
    True -> "woot"
    False -> "aww"
  where y = x == reverse x
```

## HOFs
When declaring a function as a parameter, remember that -> associates to
the right, so parenthesize to the left

`a -> b -> c ->d` is `a -> (b -> (c -> d))`, not `((a -> b) -> c) -> d`

This is pretty obvious now that I write it out, but seems worth making
explicit.

## Guard clauses

Guards, like cases and patterns, evaluate sequentially -- most specific
first pls.

Guard clauses can have `where` clauses chained off of them just like
case expressions.

## Composition

($) has higher precedence than (.), so we can do 
`negate . sum $ [1, 2, 3]` rather than `(negate . sum) $ [1, 2, 3]`.

Incidentally, F#'s `|>` is `flip ($)`. Probably more useful in a strict
language than a lazy one, might try it anyway.

Why bother using (.) rather than nesting parens? Composition, natch.

```
take 5 . filter odd . enumFrom$ 3
```

Basically everything in the dot-chain left of the `$` composes into a
function that takes the stuff right of the `$` as args.

## Pointfree style

See above; when composing several methods, leaving off the args _can_
make things easier to read. Not much meat in this section, probably a
thing I'm going to have to learn from practice.
