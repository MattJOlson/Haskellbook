# Lists

Lists are "lists", but also streams.

```
data [] a = [] | a : [a]
```

List is an ADT; as a whole it's a sum type (built around `|`), but the
second type constructor is a _product_ because it takes two arguments
(the car and the cdr).

## Pattern matching on lists

This is legal:

```
myHead (x:_)  = x
myTail (_:xs) = xs
```

Super, right? But partial, throws on empty lists.

## Syntactic sugar

Ranges: `[1..10] == enumFromTo 1 10`, and
`[1,3..12] == enumFromThenTo 1 3 12`. This works for all types that
implement Enum.

## List comprehensions
[ (expression) | (generator) , (predicate) ]

e.g. 

[x^2 | x <- [1..10] , mod x 2 == 0]
=> [4,16,36,64,100]

[x^y | x <- [1..10], y <- [2, 3], mod (x*y) 2 == 0]
=> [1,4,8,9,16,64,25,36,216,49,64,512,81,100,1000]

## Spines

Basically, the "structure" of a data structure, e.g. the cons cells of a
list.

"Evaluation of a list proceeds down the spine, construction proceeds up
the spine". So for 1 : (2 : (3 : [])), we evaluate 1.. 2.. 3.. [], but
build the structure starting with [], then 3, then 2, then 1. This is
"well, of course" territory but probably has ~implications~ for lazy
evaluation.

How does this even work with infinite lists, then? I guess we have one
cons cell with something in the car, and build the cdr as we go along.
Something something, thunks, probably.

So the "blah" (`enumFromTo 'a' 'z'`) example works as expected with
:sprint, but trying to force the mySquares/myCubes list comprehensions
doesn't work, they all stay at _.

*Ch9ex> :sprint mySquares             
mySquares = _                         
*Ch9ex> take 1 mySquares              
[1]                                   
*Ch9ex> :sprint mySquares             
mySquares = _                         
*Ch9ex> take 2 mySquares              
[1,4]                                 
*Ch9ex> :sprint mySquares             
mySquares = _                         
*Ch9ex> let blah = enumFromTo 'a' 'z' 
*Ch9ex> :sprint blah                  
blah = _                              
*Ch9ex> take 1 blah                   
"a"                                   
*Ch9ex> :sprint blah                  
blah = 'a' : _                        

Spines and values are evaluated differently:
- values are in Weak Head Normal Form (evaluated as far as needed to
  reach a data constructor)
- spines...?

Something about "spine strictness", e.g. pattern matching, which
evaluates the spines right away but doesn't worry about the values until
they're needed. For example, the `length` function fully evaluates the
spine, but doesn't examine any of the values.

Notably, _ doesn't force its value in pattern matching!

"A common mantra for performance sensitive code in Haskell is, 'lazy in
the spine, strict in the leaves.'"
