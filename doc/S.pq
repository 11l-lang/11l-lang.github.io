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

Expression `<expression>` is compared with constant expressions for equality. If a matching expression is found, then corresponding statements are executed. If no matching expression is found, `<default statements>` [if present] are executed.[[[Keyword `else` is also used in Basic, Ruby and Nim.]]]

The `S`/`switch` can be used in expressions:
#(11l)‘
V tag = S prev_char()
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
V tag = S prev_char() {‘*’ {‘b’}; ‘_’ {‘u’}; ‘-’ {‘s’}; ‘~’ {‘i’}}
’
or so:
#(11l)‘
V tag = S prev_char() {‘*’ {‘b’} ‘_’ {‘u’} ‘-’ {‘s’} ‘~’ {‘i’}}
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
