[[[H‘S/switch’
]]]H‘S/switch keyword’


#(11l)‘
S <expression>
   <constant expression 1>
      <statements 1>
   <constant expression 2>
      <statements 2>
   ...
   [E
      <default statements>]
’

Expression #(11l)‘<expression>’ is compared with constant expressions for equality. If a matching expression is found, then corresponding statements are executed. If no matching expression is found, #(11l)‘<default statements>’ [if present] are executed.[[[Keyword #(11l)‘else’ is also used in Basic, Pascal, Ruby, Kotlin, Nim and CoffeeScript.]]]

The #(11l)‘S’/#(11l)‘switch’ can be used in expressions:
#(11l)‘
V tag = S prevc
           ‘*’
              ‘b’
           ‘_’
              ‘u’
           ‘-’
              ‘s’
           ‘~’
              ‘i’
’
Or in one line. So:
#(11l)‘
V tag = S prevc {‘*’ {‘b’}; ‘_’ {‘u’}; ‘-’ {‘s’}; ‘~’ {‘i’}}
’
or so:
#(11l)‘
V tag = S prevc {‘*’ {‘b’} ‘_’ {‘u’} ‘-’ {‘s’} ‘~’ {‘i’}}
’

If you have a very long switch, which does not fit on the screen, you can add comment[[[s]]] for each "case":
#(11l)‘
S message
   WM_CREATE // case
      ...
   WM_DESTROY // case
      ...
   WM_KEYDOWN // case
      ...
   ...
   E // case
      ...
’
‘Or this way’{
#(11l)‘
S message
   \(case) WM_CREATE // create window
      ...
   \(case) WM_DESTROY // destroy window
      ...
   \(case) WM_KEYDOWN // key pressed
      ...
   ...
   \(case) E
      ...
’
}

H(-1)‘`S!`’
[[[
>[https://wiki.freepascal.org/Case <- https://wiki.freepascal.org/Case/ru <- google:‘pascal case statement’]:‘
Originally, standard Pascal also set the constraint, that ~‘all possible’ values of the selector have to have a corresponding match. This is no longer the case with modern compilers.’
]]]
You can [[[write #(11l)‘S!’/#(11l)‘switch!’ instead of]]][[[append/]]]put `!` right after #(11l)‘S’/#(11l)‘switch’ keyword to enforce a compile-time constraint that ~‘all possible’ values of the selector #(11l)‘<expression>’ have to have a corresponding match.
