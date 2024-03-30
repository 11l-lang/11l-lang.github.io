[[[H‘Integer literals’
]]]H‘Integer literals’

[[[Inspired by ‘this page’[https://trizen.gitbooks.io/sidef-lang/content/programming_tasks/L/Literals/Integer.html]]]]
#(11l)‘
print(255)        // decimal literal
print(0000'00FF)  // hexadecimal literal
print(00'FF)      // short hexadecimal literal
print(F'F)        // ultrashort (single-byte) hexadecimal literal
print(377o)       // octal literal
print(1111'1111b) // binary literal
print(255'000)    // decimal literal
print(1'00000000) // special hexadecimal literal
’
Output:
`
255
255
255
255
255
255
255000
4294967296
`

Note that digit separator `'` is necessary [[[only ]]]for hexadecimal literals.
[[‘’][[[I know that ]]]Someone [[[may/]]]might want to put in code a credit card number (like 1234'5678'9012'3456, which is hexadecimal (but not decimal!) literal in 11l), but how frequently this is really needed in practice?]

Why `'` instead of `_` — there [[[might/]]]may be a valid [[[variable name]]]identifier (e.g. [[[`FFFF_FFFF` or ]]]the name of the enumerator[[[[https://en.cppreference.com/w/cpp/language/enum]:‘the name of the enumerator’]]] `C0_FE`).

*‘Long-suffix (character `L`)’
If provided, the literal is of type `Long`.
