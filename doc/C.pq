[[[H‘C/in’
]]]H‘C/in keyword’


#(11l)‘element C container’ evaluates to true/1B if `element` is *‘c’ontained in the `container`.
#(11l)‘element !C container’ evaluates to true/1B if `element` is not *‘c’ontained in the `container`.

You can shorten condition #(11l)‘a == b | a == c’ using `C`/`in` this way:
#(11l)‘
a C (b, c)
’

Also note that this code:
#(11l)‘
I source[i] C ‘a’..‘z’ | source[i] C ‘A’..‘Z’ | source[i] C ‘0’..‘9’ | source[i] == ‘_’
   ...
’
can be shortened to:
#(11l)‘
I source[i] C (‘a’..‘z’, ‘A’..‘Z’, ‘0’..‘9’, ‘_’)
   ...
’
