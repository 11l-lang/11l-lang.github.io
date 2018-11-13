[[[H‘I/if and E/else’
]]]H‘Keywords I/if and E/else’


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

Two consecutive keywords E/else and I/if are treated especially, so there is no need for a separate/additional keyword like elif in Python or elsif in Ruby.

Also I/if and E/else can be ussed in expressions similarly to ternary operator `?:` from C:
#(11l)‘
sign = I x < 0 {-1} E I x > 0 {1} E 0
’


Н‘I/if subkeywords’


#(11l)‘
I.likely <condition>
   ...
’
is used as sign to the compiler that condition in most of the cases will be true.

And similarly:
#(11l)‘
I.unlikely <condition>
   ...
’
is used as sign to the compiler that condition in most of the cases will be false.

~‘Notice: at the present moment performance increase when using this subkeywords is negligible, so their usage is not recommended.’
