[[[H‘X/exception’
]]]H‘X/exception keyword’


In 11l, there are two [types/]kinds of exceptions:
1.‘Non-fatal/‘cheap’[‘in terms of the cost of raising an exception; if an exception is raised very rarely, it is better to use the second kind of exception (since the first kind of exception adds a small constant overhead to each call to the function that may raise it, namely, it adds a check on the type of the returned value—normal value or exception)’] exceptions. Mandatory to be caught in source code, the compiler must check that all such exceptions are caught.
They must be specified in exception specifications. The behavior is similar to checked exceptions ‘in Java’[https://habr.com/ru/companies/golovachcourses/articles/225585/], and the implementation is similar to errors in Rust and Swift - i.e. just as an extra [hidden] return value in a function.’
2. Fatal/expensive exceptions whose absence cannot be guaranteed and cannot be checked at compile time. The behavior is similar to how exceptions are implemented in the most popular programming languages (C++, Python, C#, unchecked exceptions in Java).

Exceptions of the first kind use the syntax #(11l)‘X <exception_object>’ for throwing and #(11l)‘X.handle <exception_type>’ for handling.
Exceptions of the second kind use the syntax #(11l)‘X.throw <exception_object>’ for throwing and #(11l)‘X.try’/#(11l)‘X.catch’ for handling.

An example of an exception of the first kind:
#(11l)‘
T StopIteration {}

T RangeIterator
   Int start, stop

   F (start, stop)
      .start = start - 1
      .stop  = stop

   F __next__() X(StopIteration)
      .start++
      I .start == .stop
         X StopIteration()
      R .start

V it = RangeIterator(1, 10)
L
   V next = it.__next__()
   X.handle StopIteration
      L.break
   print(next)
’
(Note that code generating exceptions of the first kind need not be enclosed in the #(11l)‘X.try’ block {the compiler will try to match the #(11l)‘X.handle’ handler following the call to the function potentially generating the exception}, since such exceptions are guaranteed to be handled.)

An example of an exception of the second kind:
#(11l)‘
T Error
   String message
   F (message)
      .message = message

X.try
   print(‘1’)
   X.throw Error(‘error message’)
   print(‘never printed string’)
X.catch Error e
   print(‘Error: ’e.message)
’
This code will print:
```
1
Error: error message
```
