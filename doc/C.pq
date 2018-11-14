[[[H‘C/in’
]]]H‘C/in keyword’


#(11l)‘element C container’ evaluates to true/1B if `element` is *‘c’ontained in the `container`.
#(11l)‘element !C container’ evaluates to false/0B if `element` is not *‘c’ontained in the `container`.

Note that this code:
#(11l)‘
I source[i] C ‘a’..‘z’ | source[i] C ‘A’..‘Z’ | source[i] C ‘0’..‘9’ | source[i] == ‘_’
   ...
’
can be shortened to:
#(11l)‘
I source[i] C (‘a’..‘z’, ‘A’..‘Z’, ‘0’..‘9’, ‘_’)
   ...
’
