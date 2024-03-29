[[[H‘Semicolon free grammar and implied line joining’
]]]H‘Semicolon free grammar’


There is no need to use semicolons in 11l to terminate statements[[[phrase ‘terminate statements’ is taken from [https://golang.org/doc/effective_go.html#semicolons]]]] {semicolons can be used to place multiple statements in [[[a single]]]one line, though this is not recommended}. Statements are always terminated by a newline character [[[if the next line has the same indent as a current one, and ]]]if there is no implied line joining occured (see below).


H‘‘Implied’[‘Implied but not implicit, because in 11l there is no explicit line joining, like in Python’] line joining’


Instead of clumsy things like ‘Automatic Semicolon Insertion with overly complex rules’[http://www.ecma-international.org/ecma-262/6.0/index.html#sec-rules-of-automatic-semicolon-insertion] (which also sometimes works incorrectly {
Examples of incorrect work of Automatic Semicolon Insertion:
1.‘This JavaScript code:
#(JavaScript)‘
a = b + c
[d, e] = [e, d]
’
is ~‘not’ transformed by automatic semicolon insertion and so will work like this:
#(JavaScript)‘
a = b + c[d, e] = [e, d]
’
’
2.‘This JavaScript code:
#(JavaScript)‘
return
  "something";
’
just returns [[[nothing/null]]]`undefined` (because semicolon is automatically inserted after `return`), but it is a compile-time error in 11l.’
})[[[,]]] 11l uses in general just 3 simple rules, which are both easy to understand for a human [[[as well as]]]and to implement in a lexical analyser:
1.‘Every line of code which ends with any binary operator [[[should/]]]will be joined with the following/next line of code:
#(11l)‘
I condition1 | // this line will be joined with the following/next line because it ends with a binary operator `|`
  condition2
   some_func()
’
’
2.‘Every line of code which begins with any binary operator [[[should]]]will be joined with the previous line of code: {
Also it is necessary to check that this is not an unary operator:
#(11l)‘
a = b
++i // plus symbol at the beginning here should not be treated as binary `+` operator
’
}
#(11l)‘
some_variable = 2
              + 3 // this line will be joined with the previous line because it begins with a binary operator `+`
’
’
3.‘And ‘like in Python’[https://docs.python.org/3/reference/lexical_analysis.html#implicit-line-joining] expressions in parentheses and square brackets[[[[ or curly braces]]]] can be split over more than one physical line: [{
Perhaps this rule will be abandoned in order to support such code:
#(11l)‘
set_timeout(
            1.0,
            F ()
               alert(‘!’)
            ,
            0
           )
’
Then 3rd rule will be replaced by the following 2 rules:
3. Every line of code which ends with opening/left parenthesis (`(`), square bracket (`[`), or comma (`,`) [[[should/]]]will be joined with the following/next line of code.
4. Every line of code which begins with closing/right parenthesis (`)`) or square bracket (`]`) [[[should]]]will be joined with the previous line of code.
[[[https://www.rosettacode.org/wiki/Ackermann_function#11l]]]}]
#(11l)‘
some_func( // because there is an unclosed parenthesis all following lines will be joined with this one
   argument1,                                                            \\ until parenthesis is closed
   argument2)
’
’

!‘Note: dot (`.`) is not considered as a binary operator because it is also used as a variables' prefix (see ‘Variables' prefixes’[./../prefixes]), and if you want to split member function call over multiple lines, then [[[prepend/]]]precede the dot with[[[/by]]] a backslash:
#(11l)‘
result = obj.method1()
           \.method2()
’’
