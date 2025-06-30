[[[H‘I/if’
]]]H‘I/if keyword’


T‘‘‘#(11l)‘
I <condition>
   ...




’’
‘#(11l)‘
I <condition>
   ...
E
   ...


’’
‘#(11l)‘
I <condition1>
   ...
E I <condition2>
   ...


’’
‘#(11l)‘
I <condition1>
   ...
E I <condition2>
   ...
E
   ...
’’
’’

Two consecutive keywords `E`/`else` and `I`/`if` are treated especially[[[like in CoffeeScript and Genie]]], so there is no need for a separate/additional keyword like `elif` in Python or `elsif` in Ruby.

Also `I`/`if` and `E`/`else` can be used in expressions similarly to ternary operator `?:` from C:
#(11l)‘
sign = I x < 0 {-1} E I x > 0 {1} E 0 // 11l
’
#(C)‘
sign =  x < 0 ? -1  :  x > 0 ? 1 : 0; // C
’


Н‘I/if subkeywords’


#(11l)‘
I.likely <condition>
   ...
’
is used as a sign to the compiler that condition in most of the cases will be true.

And similarly:
#(11l)‘
I.unlikely <condition>
   ...
’
is used as a sign to the compiler that condition in most of the cases will be false.

~‘Note: at the present moment performance increase when using this subkeywords is negligible, so their usage is not recommended.’
