[[[H‘Variables' prefixes’
]]]H‘Variables' prefixes’


Prefix `.` is used for type variables:
#(11l)‘
T Error
   String message

   F Error(message)
      .message = message
’

Prefix `:` is used for global variables:
#(11l)‘
A global_var = 0

F global_func()
   :global_var++
’

Prefix `@` is used for *‘‘ca’[‘symbol @ looks similar to characters Ca’]’ptured variables:
#(11l)‘
F global_func()
   A i = 0

   F local_func()
      @i++
’