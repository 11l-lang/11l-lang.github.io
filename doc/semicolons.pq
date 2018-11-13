[[[H‘Semicolon free grammar and implied line joining’
]]]H‘Semicolon free grammar’


H‘Implied line joining’


Instead of clumsy things like ‘Automatic Semicolon Insertion with overly complex rules’[http://www.ecma-international.org/ecma-262/6.0/index.html#sec-rules-of-automatic-semicolon-insertion], 11l uses in general just 3 simple rules, which are both easy to understand for a human [[[as well as]]]and to implement in lexical analyser:
1.‘Every line of code which ends with any binary operator should be joined with the following line of code:
#(11l)‘
I condition1 | //  this line will be joined with the following line because it ends with a binary operator `|`
  condition2
   some_func()
’
’
2.‘Every line of code which begins with any binary operator should be joined with the previous line of code:
#(11l)‘
some_variable = 2
              + 3 // this line will be joined with the previous line because it begins with a binary operator `+`
’
’
3.‘And ‘like in Python’[https://docs.python.org/3/reference/lexical_analysis.html#implicit-line-joining] expressions in parentheses, square brackets or curly braces can be split over more than one physical line:
#(11l)‘
some_func( // because there is an unclosed parenthesis all following lines will be joined with this one
   argument1,                                                            \\ until parenthesis is closed
   argument2)
’
’
