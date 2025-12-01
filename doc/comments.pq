[[[H‘Comments’
]]]H‘Single line comments’


[[[http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/n4750.pdf page 12]]]The characters `//` or `\\` start a comment, which terminates immediately before the next new-line character.
The characters `\\` are intended to continue a comment from the previous line (example[https://github.com/11l-lang/_11l_to_cpp/blob/e1009187effb2aa7fa08bf14f8b6a8c4a9314e47/tokenizer.py#L505][[[https://github.com/alextretyak/CopyEdit/blob/master/cut_copy_paste_tests.py#L283]]]).


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

When commenting a lot of code, you can[[[#red# should do this automatically]]] use extra brackets to [[[view/]]]notice end of comment better:
#(11l)‘
\[[[
... a lot of code ...
]]]
’
[[[This idea came to me when I noticed that end of multi-line comment is very hard/difficult to notice:
L(fname) fs:walk_dir(‘.’, dir_filter' d -> d[0] != ‘.’)
   I fname != ‘.\bc_files_recursively.exe’
      print(fname)
      \(V bs = File(fname).read_bytes()
      L(&b) bs
         b = (-)b
      File(fname, ‘w’).write_bytes(bs))
]]]

Н‘Commenting compound statements’


The `\` character before a keyword disables the entire block of code corresponding to that compound statement:
#(11l)‘
\I 2 > 1
   print(‘This text will not be printed’)
’
