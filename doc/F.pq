[[[H‘F/fn’
]]]H‘F/fn keyword’


#(11l)‘
F <name>(<arguments>) [-> <return_type>]
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
Each argument is defined as:
0‘[<argument type>] [<qualifier>]<argument name> [= <default value>]’

By default all arguments passed to a function are constant and can not be changed inside a function, but this behaviour can be altered via qualifiers.
‘Qualifiers’{
`=`
Make a local copy of argument. Make it possible to change an argument inside a function. In this case only local copy of argument will be changed.

`&`
Pass an argument by reference. Make it possible to change an argument inside a function.

Example:
#(11l)‘
F f(=i, j)
   i += 1 // this is correct
   j += 1 // but here is an error
’
}


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


Н‘F/fn subkeywords’


`F.destructor`/`fn.destructor` is used to define a destructor:
#(11l)‘
T TypeName
   F.destructor
      print(‘TypeName destructor called’)
’

Subkeywords `virtual.new`, `virtual.override`, `virtual.final` and `virtual.abstract` indicate that this functions is virtual and they specify a "virtual type" of this function.
`virtual.new` means that this is a new virtual function.
[[[https://en.cppreference.com/w/cpp/language/override]]]`virtual.override` ensures that the function is virtual and is overriding a virtual function from a base [[[class/]]]type. The program is ill-formed (a compile-time error is generated) if this is not true.
[[[https://en.cppreference.com/w/cpp/language/final]]]`virtual.final` specifies that a virtual function cannot be overridden in a derived [[[class/]]]type.
[[[https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/abstract-and-sealed-classes-and-class-members]]]`virtual.abstract` subkeyword enables you to create type functions that are incomplete and must be implemented in a derived [[[class/]]]type.
Small example:
#(11l)‘
T Shape
   F.virtual.abstract square() -> Float

T Circle(Shape, Object)
   Float radious
   F.virtual.override square() -> Float
      R pi * radious^2
’

`F.args`/`fn.args` is intended to provide access to the arguments passed to the current function, but it is not implemented yet.
