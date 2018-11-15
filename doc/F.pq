[[[H‘F/fn’
]]]H‘F/fn keyword’


#(11l)‘
F <name>(<arguments>)
   <body>
’

`<name>`
Name of the function. Can be empty if it is a constructor (when [[[new ]]]function defined inside type definition, example: {
#(11l)‘
T Person
   String name
   Int age

   F (name, age)
      .name = name
      .age  = age
’
}) or this is a module-default-function, e.g. `os:(command_string)` (see ‘module os documentation’[./modules/os]).

`<arguments>`
Comma-separated list of function's arguments. Can be empty.
Each argument defined as:
0‘[<argument type>] <argument name> [= <default value>]’


H(-1)‘Named arguments’

#(11l)‘
F sqlen(x = 0, y = 0, z = 0)
   R x*x + y*y + z*z

print(sqlen(z' 3)) // equivalent to print(sqlen(0, 0, 3))
’


H(-1)‘Named-only [or keyword-only] arguments’

#(11l)‘
F to_html(instr, ohd = 0B, ', habr_html = 0B)
   ...

to_html(s, 0B, 1B) // this is wrong
to_html(s, 0B, habr_html' 1B) // this is correct
to_html(s, habr_html' 1B) // and this is correct
’
