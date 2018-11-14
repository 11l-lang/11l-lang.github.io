[[[H‘Comments’
]]]H‘Single line comments’


[[[http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/n4750.pdf page 12]]]The characters `//` or `\\` start a comment, which terminates immediately before the next new-line character.
The characters `\\` are intended to continue a comment from the previous line (example[https://github.com/alextretyak/CopyEdit/blob/master/cut_copy_paste_tests.py#L283]).


H‘Multi-line and inline comments’


The characters `\(`, `\[`, `\{` or `\‘` start a comment, which terminates with the corresponding character `)`, `]`, `}` or `’`. These comments can be nested.
#(11l)‘
\(
this_function_call_is_commented_out()

// Nested comment:
\(
// Please balance all parentheses in your source code:
I ch == "(" // )
   ...
) // end of nested comment
)
this_function_call_is_not_commented_out()
’

[Balancing of all character pairs `()`, `[]`, `{}` and `‘’` is recommended not only for this 11l-style comments to work correctly, but also for correct highlighting of matching parentheses/brackets/braces in the source code editors.]
