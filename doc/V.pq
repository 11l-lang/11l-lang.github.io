[[[H‘V/var’
]]]H‘V/var keyword’


[[[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var]]]The `V`/`var` statement declares a variable initializing it to a value.
#(11l)‘
V variable_name = value
’

You can declare more than one variable at a time with a tuple assignment:
#(11l)‘
F get_row_column() // this is a function returning a tuple
   ...
   R (row, col)
...
V (row, col) = get_row_column() // analogous code: `V rc = get_row_column(); V row = rc[0]; V col = rc[1]`
’

Partial declaration is also [[[acceptable/]]]possible:
#(11l)‘
(V row2, col) = get_row_column() // `col` has already been declared, `row2` is declared here
’
or:
#(11l)‘
(row, V col2) = get_row_column() // `row` has already been declared, `col2` is declared here
’
