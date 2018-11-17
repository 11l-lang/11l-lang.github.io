[[[H‘R/return’
]]]H‘R/return keyword’


[[[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/return]]]The `R`/`return` statement ends function execution and specifies a value to be returned to the function caller.

This code defines a function sum, which returns a sum of its arguments:
#(11l)‘
F sum(a, b)
   R a + b
’

The `R`/`return` statement can be used to return early from the function:
#(11l)‘
F f(a)
   if (a == 0)
      R
   ...
’
