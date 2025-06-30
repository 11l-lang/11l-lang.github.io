[[[H‘E/else’
]]]H‘E/else keyword’


The `E`/`else` keyword is used only in conjunction with other keywords:
1.‘‘`I`/`if`’[./../I]:
#(11l)‘
I <condition>
   ...
E
   ...
’’
2.‘‘`S`/`switch`’[./../S]:
#(11l)‘
S <expression>
   <constant expression 1>
      <statements 1>
   <constant expression 2>
      <statements 2>
   ...
   E
      <default statements>
’’
3.‘‘`V`/`var`’[./../V]:
#(11l)‘
V& el = map.get(key) E
   print(‘Key <’key‘> is not found!’)
   R
’’
