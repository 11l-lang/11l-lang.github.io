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
