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

Expression `<expression>` is compared with constant expressions for equality. If a matching expression is found, then corresponding statements are executed. If no matching expression is found, `<default statements>` [if present] are executed.

The `S`/`switch` can be used in expressions:
#(11l)‘
A tag = S prev_char()
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
A tag = S prev_char() {‘*’ {‘b’}; ‘_’ {‘u’}; ‘-’ {‘s’}; ‘~’ {‘i’}}
’
or so:
#(11l)‘
A tag = S prev_char() {‘*’ {‘b’} ‘_’ {‘u’} ‘-’ {‘s’} ‘~’ {‘i’}}
’
