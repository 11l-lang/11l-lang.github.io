[[[H‘I/if’
]]]H‘I/if keyword’


T‘‘‘#(11l)‘
I <condition>
   ...




’’
‘#(11l)‘
I <condition>
   ...
E
   ...


’’
‘#(11l)‘
I <condition1>
   ...
E I <condition2>
   ...


’’
‘#(11l)‘
I <condition1>
   ...
E I <condition2>
   ...
E
   ...
’’
’’

Two consecutive keywords #(11l)‘E’/#(11l)‘else’ and #(11l)‘I’/#(11l)‘if’ are treated especially[[[like in CoffeeScript and Genie]]], so there is no need for a separate/additional keyword like #(Python)‘elif’ in Python or *‘C(008)‘#‘elsif’’’ in Ruby.

Also #(11l)‘I’/#(11l)‘if’ and #(11l)‘E’/#(11l)‘else’ can be used in expressions similarly to ternary operator `?:` from C:
#(11l)‘
sign = I x < 0 {-1} E I x > 0 {1} E 0 // 11l
’
#(C)‘
sign =  x < 0 ? -1  :  x > 0 ? 1 : 0; // C
’


Н‘I/if subkeywords’


#(11l)‘
I.unlikely <condition>
   ...
’
is used as a sign to the compiler that condition in most of the cases will be false.

This affects the generation of machine code as follows:
1. The body of the #(11l)‘I’/#(11l)‘if’ statement is moved to a separate (“cold”) area of ​​the code segment or[‘this depends on the compilation options (moving to a separate area has both advantages and disadvantages - it leads to more bloated jmps)’] to the end of the function after all the “hot” code.
2.‘If the body of the #(11l)‘I’/#(11l)‘if’ statement consists of a single function call, then that call is not inlined.
‘Example:’{
#(11l)‘
T String
   ...
   F append_char(c)
      I.unlikely .len == .capacity
         .reserve_(.len + 1)
      .data[.len++] = c
’}’
3.‘The space on the stack for local variables inside the body of the #(11l)‘I’/#(11l)‘if’ statement is allocated not at the ‘beginning of the function’/‘moment of entry into the function’, but at the beginning of the body of the #(11l)‘I’/#(11l)‘if’ statement itself.
‘Example:’{
#(11l)‘
F f()
   [Byte, max_len' 16] barr
   I.unlikely ...
      [Byte, max_len' 1024] big_arr
      ...
’
When entering [at the start of execution] the function #(11l)‘f’, 16 bytes [not 1040] will be allocated on the stack. The space for #(11l)‘big_arr’ [1024 bytes] will be allocated only if the condition after #(11l)‘I.unlikely’ is met. And it will be freed immediately after the body of this statement is completed.
}’

#(11l)‘
I.likely <condition>
   ...
’
is used as a sign to the compiler that condition in most of the cases will be true.

Affects the generation of machine code only if there is an #(11l)‘E’/#(11l)‘else’ branch, the code in which is marked "unlikely".
