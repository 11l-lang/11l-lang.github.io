[[[H‘F/fn’
]]]H‘F/fn keyword’


#(11l)‘
F <name>(<arguments>) [-> <return_type>] [X(<exceptions>)]
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
}) or this is a [[[module-default-function/]]]module nameless function, e.g. `os:(command_string)` (see ‘module os documentation’[./../built-in-modules/os]).

`<arguments>`
Comma- or semicolon-separated list of function[[['s]]] arguments. Can be empty.
Each argument is defined as:
0‘[<argument type>] [<qualifier>][<outer name>]<inner name> [= <default value>]’

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

`<return_type>`
`Void` can be used as a return type name to denote that function does not return anything.

`<exceptions>`
Comma-separated list of exceptions of the first kind, which function can throw.


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


H(-1)‘Matching named arguments elision’

This call:
#(11l)‘
my_function(
  my_first_variable' my_first_variable,
  my_second_variable' my_second_variable
)
’
can be shortened to:
#(11l)‘
my_function(
  ' my_first_variable,
  ' my_second_variable
)
’
[Inspired by ‘this thread’[https://discuss.python.org/t/syntactic-sugar-to-encourage-use-of-named-arguments/36217].]


H(-1)‘Outer and inner names of function arguments’

#(11l)‘
F f(outer_name' inner_name = 0)
   R inner_name

f(outer_name' 1)

F f2(String outer_name' inner_name = ‘’)
   ...
’

If no outer argument name is specified, then it is the same as the inner name.


Н‘F/fn subkeywords’


`F.destructor`/`fn.destructor` is used to define a destructor:
#(11l)‘
T TypeName
   F.destructor
      print(‘TypeName destructor called’)
’

Subkeywords `virtual.new`, `virtual.override`, `virtual.final`, `virtual.abstract` and `virtual.assign`[[[impl, implement, set, define, determine и designate, new‘a’[‘abstract’], non_abstract, specific, specify, concrete]]] indicate that this functions is virtual and they specify a "type of virtuality" of this function.
`virtual.new` means that this is a new virtual function.
[[[https://en.cppreference.com/w/cpp/language/override]]]`virtual.override` ensures that the function is virtual and is overriding a virtual function from a base [[[class/]]]type. The program is ill-formed (a compile-time error is generated) if this is not true.
[[[https://en.cppreference.com/w/cpp/language/final]]]`virtual.final` specifies that a virtual function cannot be overridden in a derived [[[class/]]]type.
[[[https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/abstract-and-sealed-classes-and-class-members]]]`virtual.abstract` subkeyword enables you to create type functions that are incomplete and must be implemented in a derived [[[class/]]]type (this implementation should be marked with `virtual.assign`).
Small example:
#(11l)‘
T Shape
   F.virtual.abstract square() -> Float

T Circle(Shape)
   Float radious
   F.virtual.assign square() -> Float
      R math:pi * .radious^2
’

`F.args`/`fn.args` is intended to provide access to the arguments passed to the current function, but it is not implemented yet.

`F.result`/`fn.result` is a special variable that serves as an implicit return variable.[[[https://nim-by-example.github.io/variables/result/ <- google:‘nim result’]]][[[ It is useful for cases when]]]
‘Why `fn.result`?’{
. `result` because there is a `result` special variable in Nim[https://rosettacode.org/wiki/Function_definition#Nim] and Delphi[https://rosettacode.org/wiki/Function_definition#Delphi].
. `fn` because to return a value from a function in some languages (e.g. BASIC[https://rosettacode.org/wiki/Function_definition#BASIC][[[ and]]], Pascal[https://rosettacode.org/wiki/Function_definition#Pascal]), you must assign the value to the function name.[[[https://www.statology.org/vba-function-return/ <- google:‘vba return value’]]]

`F.result`/`fn.result` is longer than `R`/`return` by intent because it should only be used when necessary. `R`/`return` is preferred since functions in 11l [[[by default have]]] do not require specifying the return value type.
}
