[[[H‘X/exception’
]]]H‘X/exception keyword’


In 11l, there are two [types/]kinds of exceptions:
1.‘Non-fatal/‘cheap’[‘in terms of the cost of raising an exception; if an exception is raised very rarely, it is better to use the second kind of exception (since the first kind of exception adds a small constant overhead to each call to the function that may raise it, namely, it adds a check on the type of the returned value—normal value or exception)’] exceptions. Mandatory to be caught in source code, the compiler must check that all such exceptions are caught.
They must be specified in exception specifications. The behavior is similar to checked exceptions ‘in Java’[https://habr.com/ru/companies/golovachcourses/articles/225585/], and the implementation is similar to errors in Rust and Swift - i.e. just as an extra [hidden] return value in a function.’
2. Fatal/expensive exceptions whose absence cannot be guaranteed and cannot be checked at compile time. The behavior is similar to how exceptions are implemented in the most popular programming languages (C++, Python, C#, unchecked exceptions in Java).

Exceptions of the first kind use the syntax #(11l)‘X <exception_object>’ for throwing and #(11l)‘X.handle <exception_type>’ for handling.
Exceptions of the second kind use the syntax #(11l)‘X.throw <exception_object>’ for throwing and #(11l)‘X.try’/#(11l)‘X.catch’ for handling.

‘Why `X.handle`?’{
>‘Exception Handling for C++’[https://www.stroustrup.com/except89.pdf <- google:‘"the design and evolution of c++" "void f() throw (e1, e2)"’]:‘Similarly, we chose `catch` in preference to `handle` because `handle` is a commonly used C identifier.’
[[[And ]]]Unlike C++ [[[or/]]]and [[[any/]]]most other programming languages, subkeywords in 11l can be anything.
}

An example of an exception of the *‘first kind’:
#(11l)‘
T StopIteration {}

T RangeIterator
   Int cur, end

   F (start, end)
      .cur = start
      .end = end

   F __next__() X(StopIteration)
      I .cur >= .end
         X StopIteration()
      R .cur++

V it = RangeIterator(1, 10)
L
   V i = it.__next__()
   X.handle StopIteration
      L.break
   print(i)
’

Note that code generating exceptions of the first kind *‘need not be’ enclosed in the #(11l)‘X.try’ block {[[[the compiler will try to match the #(11l)‘X.handle’ handler following]]]the exception handler must be located immediately after the call to the function potentially generating the exception}, since such exceptions are guaranteed to be handled.
However, it *‘can be’ enclosed in the #(11l)‘X.try’ block if necessary:
#(11l)‘
F circles_from_p1p2r(p1, p2, r) X(Error)
   I r == 0.0
      X Error(‘radius of zero’)
   I p1 == p2
      X Error(‘coincident points gives infinite number of Circles’)
   ...
   R (c1, c2)

L(p1, p2, r) [((0.1234, 0.9876), (0.8765, 0.2345), 2.0),
              ...
              ((0.1234, 0.9876), (0.1234, 0.9876), 0.0)]
   print("Through points:\n  #.,\n  #.\n  and radius #.6\nYou can construct the following circles:".format(p1, p2, r))
   X.try
      V (c1, c2) = circles_from_p1p2r(p1, p2, r)
      print("  #.\n  #.\n".format(c1, c2))
   X.handle Error v
      print("  ERROR: #.\n".format(v.msg))
’
(‘Full code.’[https://rosettacode.org/wiki/Circles_of_given_radius_through_two_points#11l])

Exceptions of the first kind are good for returning from recursive functions:
#(11l)‘
F walk_maze(m, n, &cell, indx) X(PercolatedException)
   cell[n][m] = indx
   I n < :nn - 1 & cell[n + 1][m] == :NOT_VISITED
      walk_maze(m, n + 1, &cell, indx)
   E I n == :nn - 1
      X PercolatedException((m, indx))
   I m & cell[n][m - 1] == :NOT_VISITED
      walk_maze(m - 1, n, &cell, indx)
   I m < :M - 1 & cell[n][m + 1] == :NOT_VISITED
      walk_maze(m + 1, n, &cell, indx)
   I n & cell[n - 1][m] == :NOT_VISITED
      walk_maze(m, n - 1, &cell, indx)

F check_from_top(&cell) -> (Int, Int)?
   V (n, walk_index) = (0, 1)
   L(m) 0 .< :M
      I cell[n][m] == :NOT_VISITED
         walk_index++
         walk_maze(m, n, &cell, walk_index)
         X.handle PercolatedException ex
            R ex.t
   R N
’
(‘Full code.’[https://rosettacode.org/wiki/Percolation/Site_percolation#11l])

An example of an exception of the *‘second kind’:
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
