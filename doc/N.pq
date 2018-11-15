[[[H‘N/null’
]]]H‘N/null keyword’


`N`/`null` represents an absence of any value in Nullable types.

Also `N`/`null` can be used as a function's return type name to denote that function does not return anything:
#(11l)‘
F func(a) -> N
    print(a)

(Int -> N) fptr = n -> func(n)
fptr(1)
’
