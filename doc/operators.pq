[[[H‘Operators’
]]]H‘Operators’


[[[http://web.archive.org/web/20180127115004/http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-334.pdf
]]]The following table summarizes all 11l operators in order of precedence from highest to lowest:[[[
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
&x
’ ‘Unary minus
Unary plus
Logical NOT
Bitwise NOT (rationale: {
Operator (-) complements operator XOR (+) and has the following properties:
a(-)b = NOT (a XOR b)
NOT a = 0(-)a = (-)a
a(-)(-)b = a(+)b
a(+)(-)b = a(-)b
(-)(-)a = a

However, binary operator (-) [[[does/]]]is not supported in hardware and used [[[very/]]]extremely rare, [[[so/]]]therefore 11l includes only unary operator (-), which corresponds to bitwise NOT.
})
Prefix decrement
Prefix increment
Address-of’’
‘‘x * y
x / y
x I/ y
x % y
’ ‘Multiplication
Division
Integer division {note that `-5 // 2 = -3` in Python whereas `-5 I/ 2 = -2` in 11l, but this is merely because of performance considerations, and if you know efficient implementation of Python integer division[[[
>[https://stackoverflow.com/questions/3895081/divide-and-get-remainder-at-the-same-time <- google:‘divmod c’]:‘‘this is the code’[http://svn.python.org/projects/python/trunk/Objects/intobject.c] of the Python implementation for integer divmod:...’
]]], please write at the forum[http://forum.11l-lang.org/forums/development.2/]}
Remainder’’
‘‘x + y
x - y’ ‘Addition
Subtraction’’
‘‘x << y
x >> y’ ‘Bitwise left shift
Bitwise right shift’’
‘‘x 0‘[&]’ y’ ‘Bitwise AND (rationale: {
0‘[&]’ looks similar to ‘AND gate’[https://ru.wikipedia.org/wiki/Логические_элементы#Конъюнкция_(логическое_умножение)._Операция_И]:

P‘https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/IEC_AND_label.svg/100px-IEC_AND_label.svg.png’
})’’
‘‘x (+) y’ ‘Bitwise XOR (rationale: {
Symbols (+) look like symbol ⊕, which is used in ‘Boolean algebra’[https://en.wikipedia.org/wiki/Boolean_algebra] for exclusive or operation: Р‘https://wikimedia.org/api/rest_v1/media/math/render/svg/18f7d86510aec2e45bb019abacccd2e772790f8f’.
And although ⊕ is used more often for single-bit values, in Wikipedia it [[[occurs/]]]is sometimes used ‘for pointers’[https://en.wikipedia.org/wiki/XOR_linked_list <- https://ru.wikipedia.org/wiki/XOR-связный_список <- https://habrahabr.ru/post/183462/#comment_6377452 <- google:‘1с xor’] and ‘for arrays of bytes’[https://en.wikipedia.org/wiki/Hash-based_message_authentication_code <- google:‘HMAC’ <- https://www.imperialviolet.org/2017/05/31/skipsha3.html ‘key:        Bytes     array of bytes’].
[Besides, usage of ^ for this operation I [[[think/]]]consider a bad idea (at least this is ‘confusing for novices’[https://stackoverflow.com/questions/11464905/what-is-used-for-in-ruby]).]
})’’
‘‘x 0‘[|]’ y’ ‘Bitwise OR (rationale: {
Symbol | looks like 1 and 0‘[1]’ looks similar to ‘OR gate’[https://ru.wikipedia.org/wiki/Логические_элементы#Дизъюнкция_(логическое_сложение)._Операция_ИЛИ]:

P‘https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/OR_gate_RU.svg/100px-OR_gate_RU.svg.png’
})’’
‘‘x < y, x <= y
x > y, x >= y’ ‘Comparison operators’’
‘‘x..y, x.<y, x.+len
x<.y, x<.<y’ ‘Ranges’’
‘‘x""y and x‘’y’ ‘String concatenation (rationale[./../‘’])’’
‘‘x == y, x != y
e in c, e !in c
e C c, e !C c
’ ‘Comparisons
Including membership tests’’
‘‘x & y’ ‘Logical AND (rationale: {
`&` is used instead of `&&` because:
1. Logical AND is needed much more often than bitwise AND.
2.‘Bitwise AND is almost always used just for [[[flags' set checking]]]check if some flag is set, but this is error-prone {
Consider following C++ code:
#(C++)‘
class Render
{
public:
    static const unsigned F_CAST_SHADOWS = 1 << ...;
};

class Control
{
public:
    unsigned flags;
    static const unsigned F_DISABLED = 1 << ...;
};

void some_func(Control *c)
{
    if (c->flags & Control::F_DISABLED) {
        ...
    }
    if (c->flags & Render::F_CAST_SHADOWS) { // this is wrong, but will be correctly compiled in C++!
        ...
    }
}
’

11l solution:
#(11l)‘
T Control
   T.flags flags
      DISABLED
or:
T Control
   T Flags
      Bool DISABLED
   Flags flags

F some_func(Control c)
   I c.flags.DISABLED
      ...
’
}, [[[and/]]]so [[[I wanted]]]the decision was made to discourage[[[чтобы в сознании стёрлось такое использование `&`]]] from[[[avoid]]] such usage of bitwise AND operator at all.’
Sometimes bitwise AND is used as a modulo (`%`) operation of powers of 2, but if the [[[divisor]]]second operand is constant, then operator `%` should be used instead (`x [&] y = x % (y + 1)`). If operator `%` works for negative numbers like in Python (i.e. e.g. `-1 % 4 = 3`), then [[[it]]]expression `x % (y + 1)` will be compiled to bitwise AND.
})’’
‘‘x | y’ ‘Logical OR’’
‘‘x ? y’ ‘Null coalescing’’
‘‘() -> expr
x -> expr
(x, y) -> expr’ ‘Lambda expression’’
‘‘arr1 0‘[+]’ arr2’ ‘Array concatenation (rationale: {
Because arrays are defined using square brackets: `[1, 2, ...]`.
As this operation is quite expensive, it has dedicated operator.
})’’
‘‘x = ...
x += ...
-= *= /= I/=
%= >>= <<= ^=
0‘[+]= [&]= [|]=’
(+)= ‘’=’ ‘Assignments (right to left associative)’’
’
