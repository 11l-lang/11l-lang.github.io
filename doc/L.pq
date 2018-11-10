﻿[[[
Credits/thanks to:
. [https://doc.rust-lang.org/1.7.0/book/loops.html <- google:‘rust do while’]
. [https://trizen.gitbooks.io/sidef-lang/content/syntax_and_semantics/constructs/while.html]
]]]H(1)‘L/loop keyword’


H‘1. The infinite loop.’

```
L
   print("\a")
```


H‘2. A "while" loop.’

```
L <expression>
   ...
```

Keep executing a loop body as long the given expression is true.


H‘3. Loop a particular number of times.’

```
L <number>
   ...
```

Example:
```
L 3
   print("ABC")
```
will print "ABC" 3 times.

~‘Notice: only numeric literals/constants are considered so far as `<number>` {if you want to iterate [[[from 0 to ]]]an arbitrary number of times, you can use ranges, for example: `L 1..number`}.’


H‘4. A "for in" loop.’

```
L(item) <iterable>
   ...
```

Examples:
`L(x) 1..10 {print(x)}` will print 1 through 10.
`L(c) "str" {print(c)}` will print "s", "t" and "r".
`L(n) [9,7] {print(n)}` will print 9 and 7.


H(1)‘L/loop subkeywords’