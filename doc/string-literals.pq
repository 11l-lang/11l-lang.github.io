[[[H‘String literals’
]]]H‘Conventional string literals’


Conventional string literals are enclosed in double quotes (`"`).
They support the same escape sequences as in C++ programming language (`\n`, `\t`, etc.).


H‘Raw string literals’


Raw string literals are enclosed in paired single quotation marks: characters `‘` and `’`.
How to type [[[paired single quotation marks]]]this symbols see here[http://pqmarkup.org].

If raw string should contains unpaired single quotation marks, then balancing of raw string should be performed like as for raw HTML in pq markup (see ‘Advanced formatting. Raw HTML’[http://pqmarkup.org/syntax]).
For example, there is a string [[[‘]]]`don’t`.
It contains unpaired closing single quotation mark. Let's add a balancing opening single quotation mark at the beginning of the string: С(080)‘‘[[[’]]]’[[[‘]]]don’t.
Enclose that balanced string in single quotation marks: С(080)‘‘[[[’]]]’‘don’tС(080)‘[[[‘]]]’’.
Now we need to somehow show to the parser that single quotation mark at the beginning of the string is not a part of the raw string [it is needed only for balancing]. For this purpose typewriter apostrophe `'` is used: one apostrophe absorbs one single quotation mark. In our case one apostrophe should be added at the beginning of the string: #‘'‘‘don’t’’.
[[[This/]]]Any balanced string (e.g. #(11l)‘'‘‘don’t’’) can be put inside another raw strings as is:
#‘‘text = '‘‘don’t’’’.


H‘Indented[[[[https://github.com/JuliaLang/julia/issues/70 <- google:‘multiline string literals julia’]]]] multi-line string literals’


Like in such languages as Swift[https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html] and Julia[https://docs.julialang.org/en/v1/manual/strings/#Triple-Quoted-String-Literals] multi-line string literals in 11l can be indented to match the surrounding code.
[Note, that in Swift and Julia they work slightly differently: {
#(Python)‘
"""
hello
"""
’
is equivalent to #(Python)‘"hello"’ in Swift[[[ and]]], but to #(Python)‘"hello\n"’ in Julia.
}]

Just prepend string literal with `|`:
#(11l)‘
V str = |‘First line.
          Second line.’
’
This is equivalent to
#(11l)‘
V str = "First line.\nSecond line."
’
