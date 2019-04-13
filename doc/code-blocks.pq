[[[Н‘Code blocks’
]]]Н‘Code blocks’


Like a Python, 11l uses whitespace indentation to delimit code blocks:
#(11l)‘
F sum(a, b)
   R a + b
’
[This code defines a function `sum`, which returns a sum of its arguments.]

But 11l also supports explicit blocks designation via curly brackets, which makes it possible to define the same function without indentation:
#(11l)‘
F sum(a, b)
{
R a + b
}
’

or in one line:
#(11l)‘
F sum(a, b) {R a + b}
’

And this style is also supported:
#(11l)‘
F sum(a, b) {
   R a + b
}
’

And this:
#(11l)‘
F sum(a, b) {
R a + b
}
’

And this:
#(11l)‘
F sum(a, b)
{
   R a + b
}
’

‘My thoughts on whitespace indentation to delimit code blocks’{
Whitespace indentation to delimit code blocks gives[[[/delivers]]] much more than just [[[deliverance from/]]]getting rid of small syntactic -‘sugar’[[[rubbish/]]][[[verbalism/]]]noise [in the form of semicolons, and begin/end keywords or curly [[[braces]]]brackets]. But many [[[developers/]]]programmers [[[are]]] still do not get it.
Consider this sample from Nemerle programming language documentation:
>[https://github.com/rsdn/nemerle/wiki/The-basics-(tutorial)#Rewriting_Line_Counter_without_the_loop]:‘
In Nemerle the if expression always need to have the else clause. It's done this way to avoid stupid bugs with dangling-else:
#(11l)‘
// C#, misleading indentation hides real code meaning
if (foo)
   if (bar)
     m1 ();
else
   m2 ();
’
If you do not want the `else` clause, use `when` expression, as seen in the example.’

Most likely, the developers of Nemerle just ‘[[[get]]][[[ripped off]]]took this behaviour from Haskell or Standard ML’[https://semitwist.com/articles/article/view/nemerle-s-when-bad-idea-easily-solved ‘The mandatory 'else' is Nemerle's functional language inheritance showing’] without understanding the reason[[[s]]] of that "stupid bug with dangling-else". But reason is not wrong `if` [allowing an absence of `else` clause], and even is not forgotten curly brackets. The reason is divergence in perception of this code by human and with compiler. Human perceives block boundaries via indentation, and compiler via [subtle for human] symbols. That is what *‘the root of the problem is a compiler and a human see [this] code differently’.
And the solution to this problem is [[[the]]] delimiting code blocks via whitespace indentation.
[[[Therefore I am surprised by people which complains on whitespace indentation to delimit code blocks and 
]]]
>[http://compiler.su/dvukhmernyj-sintaksis-python.php]:‘выражения `for операторы цикла :`, `if условное выражение :`, `else :` заканчиваются двоеточием, без которого можно обойтись.
(statements `for ... :`, `if condition :`, `else :` ends with a colon, which is not very necessary.)’
I agree.
Essentially, this colon in Python has no purpose because there are statements (if, [[[switch, ]]]for/while, class, etc.), which always require a new scope block, and a new line with a larger indentation level is quite sufficient.
‘By the way, the history of the [[[emergence/]]]appearance of this colon is quite interesting.’{
>[http://python-history.blogspot.com/2011/07/karin-dewar-indentation-and-colon.html ‘Karin Dewar, Indentation and the Colon’]:‘
In 1978, in a design session in a mansion in Jabłonna (Poland), Robert Dewar, Peter King, Jack Schwartz and Lambert were comparing various alternative proposed syntaxes for B[[[, by comparing (buggy) bubble sort implementations written down in each alternative]]]... Since they couldn't agree, Robert Dewar's wife was called from her room and asked for her opinion[[[, like a modern-day Paris asked to compare the beauty of Hera, Athena, and Aphrodite]]]... But after the first version was explained to her, she remarked: "You mean, in the line where it says: 'FOR i ... ', that it has to be done for the lines that follow; not just for that line?!" And here the scientists realized that the misunderstanding would have been avoided if there had been a colon at the end of that line.
’
That is, scientists, the developers of a programming language, heeded the words of someone who has no relation to programming. Did they want to simplify learning language for novices? But a programmer remains a novice only a short time at the beginning of his career, but observing and typing [[[of]]] excess colons will have to continue.[[[ Не думаю, что так уж сложно [[[будет ]]]привыкнуть к их отсутствию...]]]
}
The only useful application of colon is one-line if's (`if condition: statement`) and loops, but [[[this can be [[[cured/]]]achieved with]]]a good alternative to this is additional curly brackets around a statement (`if condition {statement}`, like in Rust) or parens around a condition (`if (condition) statement`).
}
