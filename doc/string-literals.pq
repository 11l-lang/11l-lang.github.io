[[[H‘String literals’
]]]H‘Conventional string literals’


Conventional string literals are enclosed in double quotes (`"`).
They support the same escape sequences as in C++ programming language (`\n`, `\t`, etc.).


H‘Raw string literals’


Raw string literals are enclosed in paired single quotation marks: characters `‘` and `’`.
How to type [[[paired single quotation marks]]]this symbols see here[http://pqmarkup.org].
!‘[[[#rec##audio#[REC_0002947.wav]]]]Alternatively, if you still have difficulty typing these characters, you can type the digraphs `'"` and `"'` instead of the paired single quotes. Note, however, these digraphs are not part of the 11l language. They exist only for ease of typing, and they will be replaced by `‘` and `’` in your source 11l file at the lexical analysis stage.’

If raw string should contains unpaired single quotation marks, then balancing of raw string should be performed like as for raw HTML in pq markup (see ‘Advanced formatting. Raw HTML’[http://pqmarkup.org/syntax]).
For example, there is a string [[[‘]]]`don’t`.
It contains unpaired closing single quotation mark. Let's add a balancing opening single quotation mark at the beginning of the string: '‘<code>’'С(080)‘‘[[[’]]]’[[[‘]]]don’t'‘</code>’'.
Enclose that balanced string in single quotation marks: '‘<code>’'С(080)‘‘[[[’]]]’‘don’tС(080)‘[[[‘]]]’’'‘</code>’'.
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


H‘Zero indented multi-line string literals’


T‘H‘‘Python’ ‘11l’’
‘><‘pqmarkup.py[https://sourceforge.net/p/pqmarkup/code/ci/b9c7c147afedf42549fc1eab09dfa9b31340b03e/tree/pqmarkup.py#l756]’ -’
‘‘#(Python)‘
if args_output_html_document:
    args_outfile.write('''\
<html>
<head>
...
''')
’’ ‘#(11l)‘
I args_output_html_document
   args_outfile.write(\/‘
<html>
<head>
...
’)
’’’
‘><‘cut_copy_paste_tests.py[https://github.com/alextretyak/CopyEdit/blob/87b0adc0c46ffa349ce879b42f3aacd8d575b71e/cut_copy_paste_tests.py#L12]’ -’
‘‘#(Python)‘
...:
        tests = """\
(1)
1. Select THIS
...
"""
’’ ‘#(11l)‘
...
      V tests = \/‘
(1)
1. Select THIS
...
’
’’’
’

Note that `\/"..."` makes no sense, as you can write:
#(11l)‘
tests = "\
...
"
’
And `\/‘...’` is needed, as there is no `"""..."""` in 11l, but multi-line string literals often need inner double[[[ or single]]] quotes.
