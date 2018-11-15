[[[H‘Operators’
]]]H‘Operators’


[[[http://web.archive.org/web/20180127115004/http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-334.pdf
]]]The following table summarizes all operators in order of precedence from highest to lowest:[[[
Credits to:
. [https://docs.python.org/3/reference/expressions.html#operator-precedence]
. [http://web.archive.org/web/20180127115004/http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-334.pdf]
. [https://en.cppreference.com/w/cpp/language/operator_precedence]
. [https://ru.cppreference.com/w/cpp/language/operator_precedence]
. [https://msdn.microsoft.com/en-us/library/126fe14k.aspx]
. [https://msdn.microsoft.com/ru-ru/library/126fe14k.aspx]
. [https://wiki.dlang.org/Operator_precedence]
]]]
T‘‘
‘x.y
module:f
0‘a[x]’
f(x)
x--
x++
’
‘Member access
Module function or variable access
Subscript
Function call
Postfix decrement
Postfix increment’’
‘‘^’ ‘Power operator (right to left associative)’’
‘‘-x
+x
!x
(-)x
--x
++x
’ ‘Unary minus
Unary plus
Logical NOT
Bitwise NOT (rationale: {

})
Prefix decrement
Prefix increment’’
‘‘x * y
x / y
x I/ y
x % y
’ ‘Multiplication
Division
Integer division
Remainder’’
‘‘x + y
x - y’ ‘Addition
Subtraction’’
‘‘x << y
x >> y’ ‘Bitwise left shift
Bitwise right shift’’
‘‘x 0‘[&]’ y’ ‘Bitwise AND (rationale: {

})’’
‘‘x (+) y’ ‘Bitwise XOR (rationale: {

})’’
‘‘x 0‘[|]’ y’ ‘Bitwise OR (rationale: {

})’’
‘‘x < y, x <= y
x > y, x >= y’ ‘Comparison operators’’
‘‘x..y, x.<y
x<.y, x<.<y’ ‘Ranges’’
‘‘x""y and x‘’y’ ‘String concatenation’’
‘‘x == y, x != y
e in c, e !in c
e C c, e !C c
’ ‘Comparisons
Including membership tests’’
‘‘x & y’ ‘Logical AND’’
‘‘x | y’ ‘Logical OR’’
‘‘x ? y’ ‘Null coalescing operator’’
‘‘() -> expr
x -> expr
(x, y) -> expr’ ‘Lambda expression’’
‘‘arr1 0‘[+]’ arr2’ ‘Array concatenation’’
‘‘x = ...
x += ...
-= *= /= I/=
%= >>= <<= ^=
0‘[+]= [&]= [|]=’
(+)= ‘’=’ ‘Assignments (right to left associative)’’
’
