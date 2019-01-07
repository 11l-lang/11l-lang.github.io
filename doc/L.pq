[[[H‘L/loop’
Credits/thanks to:
. [https://doc.rust-lang.org/1.7.0/book/loops.html <- google:‘rust do while’]
. [https://trizen.gitbooks.io/sidef-lang/content/syntax_and_semantics/constructs/while.html]
]]]H‘L/loop keyword’


There are 4 forms of loops in 11l.


H(-1)‘1. The infinite loop.’

#(11l)‘
L
   print("\a")
   sleep(1)
’


H(-1)‘2. A "while" loop.’

#(11l)‘
L <expression>
   ...
’

Keep executing a loop body as long the given expression is true.


H(-1)‘3. Loop a particular number of times.’

#(11l)‘
L <number>
   ...
’

Example:
#(11l)‘
L 3
   print("ABC")
’
will print "ABC" 3 times.

~‘Note: only [[[numeric]]]integer literals/constants are considered so far as `<number>` {if you want to iterate [[[from 0 to ]]]an arbitrary number of times, you can use ranges, for example: #(11l)‘L 1..number’}.’


H(-1)‘4. A "for in" loop.’

#(11l)‘
L(item) <iterable>
   ...
’

Examples:
#(11l)‘L(x) 1..10 {print(x)}’ will print `1` through `10`.
#(11l)‘L(c) "str" {print(c)}’ will print `"s"`, `"t"` and `"r"`.
#(11l)‘L(n) [9,7] {print(n)}’ will print `9` and `7`.
#(11l)‘L(k, v) [‘k’ = 1] {print(k‘=’v)}’ will print `k=1`.


H‘L/loop subkeywords’


[[[[[[https://trizen.gitbooks.io/sidef-lang/content/syntax_and_semantics/constructs/break.html]]]The `L.break`/`loop.break` statement is used to exit early from loops.
]]][[[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/break]]]The `L.break`/`loop.break` statement terminates the current loop.
[[[https://doc.rust-lang.org/1.7.0/book/loops.html]]][[[You may also encounter situations where you have nested loops and need to specify which one your break[[[ or continue]]] statement is for.
Like most other languages, by]]]By default[[[ a]]] `L.break`/`loop.break`[[[ or continue]]][[[ in 11l]]] will apply to innermost loop. In a situation where you would like to a break[[[ or continue]]] for one of the outer loops, you can specify which loop the break[[[ or continue]]] statement applies to:
#(11l)‘
L(y) 0..10
   L(x) 0..10
      I a[y][x] == 1
         L(y).break
’
Or you can use `^L.break`, `^^L.break`, etc.


[[[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/continue]]]The `L.continue`/`loop.continue` statement terminates execution of the statements in the current iteration of the current[[[ or labeled]]] loop, and continues execution of the loop with the next iteration.


Statements under `L.was_no_break`/`loop.was_no_break` are executed only when loop was successfully finished without `L.break`/`loop.break` (just like ‘else in Python’[http://book.pythontips.com/en/latest/for_-_else.html#else-clause <- google:‘python else for’ <- https://www.rosettacode.org/wiki/ABC_Problem#Python:_Iterative.2C_with_tests]):
#(11l)‘
L(test) tests
   I !test.ok()
      L.break

   L.was_no_break
      print(‘All tests are ok!’)
’


`L.index`/`loop.index` can be used to get[[[/obtain]]] the index of the current iteration of loop.


`L.next`/`loop.next` support now is limited to check if there is a next element in iterating container or current element is the last one.
`L.prev`/`loop.prev` is not supported now.
