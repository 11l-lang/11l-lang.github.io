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

~‘Notice: only numeric literals/constants are considered so far as `<number>` {if you want to iterate [[[from 0 to ]]]an arbitrary number of times, you can use ranges, for example: #(11l)‘L 1..number’}.’


H(-1)‘4. A "for in" loop.’

#(11l)‘
L(item) <iterable>
   ...
’

Examples:
#(11l)‘L(x) 1..10 {print(x)}’ will print 1 through 10.
#(11l)‘L(c) "str" {print(c)}’ will print "s", "t" and "r".
#(11l)‘L(n) [9,7] {print(n)}’ will print 9 and 7.


H‘L/loop subkeywords’
