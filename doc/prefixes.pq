[[[H‘Variables' prefixes’
]]]H‘Variables' prefixes’


Prefix `.` is used for type member variables:
#(11l)‘
T Error
   String message

   F (message)
      .message = message
’

Prefix `:` is used for global (or for static [see below]) variables:
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
Additional samples:
#(11l)‘
F f()
   V i = 0
   F g()
      F h()
         print(@@i)
’
>[https://github.com/11l-lang/_11l_to_cpp/blob/8abf2eb24731b5e3b2d41b854914e8f365c3517b/tests/python_to_cpp/pqmarkup.11l#L44]:‘#(11l)‘
      F exit_with_error(message, =pos)
         ...
            I @.instr[t] == "\n"
’’
>[https://rosettacode.org/wiki/Bitmap#11l]:‘#(11l)‘... @@.background ...’’

H(-1)‘Static variables’

#(11l)‘
F fake_random()
   -V seq = [3, 1, 2, 4, 7, 5, 6]
   V :n = 0 //static local variable
   :n = (:n + 1) % seq.len
   R seq[:n]

F f()
   V :n = 0 //static local variable
   F g()
      @:n++
’

H(-1)‘Static member variables’

#(11l)‘
T Type
   :static_type_var1 = 0
   String :static_type_var2
   . -:private_const_static_var = 10

   T SubType
      member = 0

   F :static_type_fn()
      R .:static_type_var2

   F f()
      .:static_type_var1 = 1
      .:static_type_fn() // why not just `.static_type_fn()` - this function is defined as `:static_type_fn()`
      V st = .SubType() // just like `self.SubType` in Python [why not `.:SubType()` - this type is defined as `T SubType`, not `T :SubType`]

print(Type.:static_type_var1)
print(Type.static_type_fn()) // like global functions/types [vs global variables] which do not require `:` prefix
V t = Type.SubType()
’

H(-1)‘Function arguments mutability sign’

#(11l)‘
F tokenize(source, [(Int, Int)] &comments)
   ...

tokenize(‘print()’, &comments) // `&` is necessary here
’
