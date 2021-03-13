[[[H‘Variables' prefixes’
]]]H‘Variables' prefixes’


Prefix `.` is used for type variables:
#(11l)‘
T Error
   String message

   F (message)
      .message = message
’

Prefix `:` is used for global variables:
#(11l)‘
V global_var = 0

F global_func()
   :global_var++
’

Prefixes `@` and `@=` are used for *‘‘ca’[‘symbol @ looks similar to characters Ca’]’ptured variables:
#(11l)‘
F global_func()
   V i = 0

   F local_func()
      @i++ // `i` is captured by reference

F get_f(a)
   F f(b)
      R @=a + b // `a` is captured by copy
   R f
’
