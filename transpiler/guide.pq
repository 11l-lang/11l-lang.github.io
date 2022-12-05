[[[H‘Guide to using the Python → 11l → C++ transpiler’]]]>>‘Т‘‘‘*‘en’’‘ru[./../ru/guide]’’’’
H(1)‘Guide to using the Python → 11l → C++ transpiler’


Here [in this guide] we discuss the features of the Python → 11l → C++ transpiler that must be taken into account when writing Python code, so that the transpiler compiles it correctly.

H‘Integers’

The Python programming language is commonly known to use arbitrary-precision integers. On the one hand, this means the programmer does not have to think about what size of number may be stored in a variable of integer type. On the other hand, however, working with arbitrary-precision numbers is much more expensive and inefficient. Therefore, the Python → 11l → C++ transpiler treats all integer numbers as 32-bit integers (the default in C++). If bigger integers (for example, 64-bit) are required, then you can either explicitly specify the type of the variable as `Int64`, or use the transpiler option `--int64` on the command line (in this case, all integers will be treated as 64-bit rather than 32-bit). An explicit indication of a variable's type looks like this:
#(Python)‘
s : Int64 = 0
’
But Python has no built-in `Int64` type. Therefore, if you want the code to work in Python, you need to add the following line once at the beginning of the program:
#(Python)‘
Int64 = int
’
The Python → 11l → C++ transpiler will understand the Python source code even without that line, however (and if does encounter such a line it will simply ignore it).

If an arbitrary-precision integer is required, then type `BigInt` should be used.

H‘Character variables’

As with 64-bit integers, the Python → 11l → C++ transpiler provides the ability to declare character variables, that is, variables whose value is a single character code. The type for character variables is `Char`. And as with `Int64`, to get code that works in Python you should include this line:
#(Python)‘
Char = str
’
An array of characters can be declared like this:
#(Python)‘
charr : List[Char] = []
’
This can be used both to improve performance and to reduce RAM usage (especially if a very large array of characters is needed, for example).

H‘Creating an empty list/array, dictionary or set’

Unlike Python, containers (such as arrays and sets) in 11l and C++ can only contain elements of a single type (with the exception of tuples, which can contain elements of different types). The type must be known at compile time. Currently, the Python → 11l → C++ transpiler does not try to determine the type of containers from their usage, as is done in some programming languages (e.g. Nemerle[http://nemerle.org/About]), so when you create an empty container, you must specify the type of its elements explicitly.
T‘H‘‘Not supported’ ‘Supported’’
‘‘#(Python)‘l = []’’ ‘#(Python)‘l : List[int] = []’
or
#(Python)‘l = [0] * 0’’’
‘‘#(Python)‘d = {}’’ ‘#(Python)‘d : Dict[str, int] = {}’’’
‘‘#(Python)‘s = set()’’ ‘#(Python)‘s = set() # int’’’
‘‘#(Python)‘dd = collections.defaultdict(int)’’ ‘#(Python)‘dd = collections.defaultdict(int) # str’’’
’
If the type of a `collections.defaultdict` dictionary is a list, then the following notation must be used:
#(Python)‘
dd : DefaultDict[str, List[int]] = collections.defaultdict(list)
’

H‘Creating a non-empty list/array, dictionary or set’

If a container is initialized with elements, then you do not need to specify the type:
#(Python)‘
l = [1, 2, 3]
d = {'a': 1, 'b': 2}
s = {1, 2, 3}
’
Since all elements of a list must be of the same type, a list like this [taken from here[https://www.rosettacode.org/wiki/Sorting_algorithms/Cycle_sort#Python]] will not compile:
#(Python)‘
x = [0, 1, 2, 2, 2, 2, 1, 9, 3.5, 5, 8, 4, 7, 0, 6]
’
To fix it, just specify the type of the first element:
#(Python)‘
x = [float(0), 1, 2, 2, 2, 2, 1, 9, 3.5, 5, 8, 4, 7, 0, 6]
’

H‘Passing a list as an argument to a function’

In Python, when a variable of type list is passed to a function, it can then be changed inside the function. In order to retain the ability to change the variable, the Python → 11l → C++ transpiler requires the type of this argument to be specified explicitly.

Thus, the function declaration `def decompress(compressed)` in ‘the solution to the LZW compression task’[https://www.rosettacode.org/wiki/LZW_compression#Python] needs to specify the argument type:
#(Python)‘
def decompress(compressed : List[int]):
    ...
’
Or like this:
#(Python)‘
def decompress(compressed : list):
    ...
’

H‘Class member variables’

For the Python → 11l → C++ transpiler to successfully compile the code declaring a new class, the types of all the class's member variables must be specified.
T‘H‘‘Will not compile’ ‘Will compile’’
‘‘#(Python)‘
class Error(Exception):
    def __init__(self, message, pos):
        self.message = message
        self.pos = pos


’’ ‘#(Python)‘
class Error(Exception):
    message : str
    pos     : int
    def __init__(self, message, pos):
        self.message = message
        self.pos = pos
’’’
’

H‘String concatenation’

Since the `+` operator cannot be used for string concatenation in 11l (for ‘the reasons set out in the language documentation’[http://11l-lang.org/doc/‘’]), while the language instead uses its own syntax for this operation, the Python → 11l transpiler tries to guess when the `+` operator is being used arithmetically and when it means string concatenation. In cases where it fails to identify string concatenation correctly, an empty string should be added between the operands (so instead of #(Python)‘str1 + str2’ you should write #(Python)‘str1 + '' + str2’), e.g.:
#(Python)‘
aa = ['1', '2']
bb = ['x', 'y']
for a in aa:
    for b in bb:
        print(a + '' + b)
’

However, in practice, in most cases where the Python → 11l transpiler fails to detect string concatenation, adding a type annotation is sufficient. For example, in this code:
#(Python)‘
def rotated(s):
    return s[1:] + s[0]
’
it is sufficient to specify the type of the argument `s`:
#(Python)‘
def rotated(s : str):
    return s[1:] + s[0]
’
(Instead of writing #(Python)‘s[1:] + '' + s[0]’.)
[In future versions of the transpiler, the ability to use `+` for string concatenation in 11l code may depend on the `--max-compat-with-python` option.]

H‘String and character literals’

Since in 11l the expression `"A"` is context-dependent (it could be either a `String` or a `Char`), the type must be specified explicitly in cases where the transpiler misidentifies the type of a string literal, i.e. #(Python)‘str('A')’ or #(Python)‘Char('A')’ should be used. The following Python code will not compile:
#(Python)‘
print(['AF'] + ['A']*5)
’
It must be written like this:
#(Python)‘
print(['AF'] + [str('A')]*5)
’

Also, if you have a variable of type `Char` (#(Python)‘ch : Char’), then to assign a character value to it you must use #(Python)‘ch = Char('*')’ instead of #(Python)‘ch = '*'’.

H‘Multiple initialization’

The Python → 11l → C++ transpiler does not currently support multiple initialization, so instead of #(Python)‘a = b = 0’ you should use:
#(Python)‘
a = 0
b = 0
’
(Multiple assignment (e.g. #(Python)‘a[0] = a[1] = 1’) is however supported, as are the constructs `if a == b == c ...` and `if a < b < c ...`.)

H‘The from ... import ... statement’

The Python → 11l → C++ transpiler does not currently support this statement, so instead of code such as:
#(Python)‘
from math import sqrt
print(sqrt(2))
’
you should use:
#(Python)‘
import math
print(math.sqrt(2))
’

There are cases, however, where `from ... import ...` should be used:
#(Python)‘
from functools import reduce
from functools import cmp_to_key
from itertools import product
from enum import IntEnum
from copy import copy, deepcopy
from typing import List, Tuple, NamedTuple, Dict, DefaultDict, Callable, Set, Optional, IO, TextIO, BinaryIO...
from _11l import *
’

H‘Recursive function calls’

If a function calls itself [recursively], then when it is declared you must explicitly specify the type of the return value (since it cannot be automatically inferred in this case by the C++ compiler).
#(Python)‘
def find(x, y) -> None: # `-> None` here is required
    ...
    find(nx, ny) # because of this call
’

In the case of a recursive call of a local function, you need to specify not only the return type but also the types of all the function's arguments:
#(Python)‘
def fib(n):
    def f(n : int) -> int: # just `def f(n):`
                           # or `def f(n) -> int:` will not work
        if n < 2:
            return n
        return f(n-1) + f(n-2)
    return f(n)
’
This is due to the particular way the C++ compiler works.

H‘Iterating over elements of a dictionary in a for loop’

When you use a `for` loop to iterate over a dictionary, if the Python → 11l transpiler cannot identify that the iterable container is a dictionary then you need to specify explicitly that you want to iterate over the keys rather than key-value pairs:
#(Python)‘
for k in d: # if the type of `d` cannot be determined this will not compile
    print(k)

# In this case, you need to write:
for k in d.keys():
    print(k)
’

H‘Division’

If neither the divisor nor the dividend is a numeric literal, and both are integers, then division is performed according to the rules of C++ and Python 2, not Python 3, i.e. integer division is used. To obtain real-number division, you must use a cast to a real type (i.e. instead `a/b` you need to use `float(a)/b` or `a/float(b)`), or else use transpiler option `--python-division` so that the `/` operation always follows the rules of Python 3.

H‘Remainder of division’

If #(Python)‘a’ could be less than #(Python)‘0’, then instead of #(Python)‘a % b’ you should use:
#(Python)‘
((a % b) + b) % b
’
or
#(Python)‘
r = a % b; if r < 0: r += b
’
This is because `%` in 11l works [for ‘performance reasons’[https://github.com/11l-lang/_11l_to_cpp/blob/8ad1117cadd82589def3229a5ff3574a6e5f5db4/11l_hpp/HandyMathLib/func.h#L162-L167]] as in C++, not as in Python.
Alternatively, you can use transpiler option `--python-remainder`, in which case the `%` operation will work as it does in Python.

H‘The yield statement’

The Python → 11l → C++ transpiler does not currently support this statement, so instead of code such as:
#(Python)‘
def squares(n):
    for i in range(n):
        yield i ** 2
’
you should use:
#(Python)‘
def squares(n):
    r : List[int] = []
    for i in range(n):
        r.append(i ** 2)
    return r
’

H‘Order of evaluation of function arguments’

Unlike Python, C++ unfortunately does not define the order in which arguments are evaluated when they are passed to a function, so it is necessary to watch out for possible incorrect behavior of code that modifies shared variables while passing function parameters.
Here is a line of code from ‘an example implementation of an RPN calculator in Python’[https://www.rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Python]:
#(Python)‘
a.append(b[c](a.pop(),a.pop()))
’
For it to work correctly with the Python → 11l → C++ transpiler, it needs to be rewritten like this:
#(Python)‘
t = a.pop()
a.append(b[c](t, a.pop()))
’

H‘Passing a function as an argument to another function’

Here is some code from the ‘solution to the "Sort using a custom comparator" task’[https://www.rosettacode.org/wiki/Sort_using_a_custom_comparator#Python]:
#(Python)‘
def mykey(x):
    return -len(x), x.upper()
 
print(sorted(strings, key=mykey))
’
It will not compile with the Python → 11l → C++ transpiler, because in the generated C++ code `mykey` is a template function.
You must either specify the types of the function's arguments:
#(Python)‘
def mykey(x : str):
    return -len(x), x.upper()
’
Or use a lambda function:
#(Python)‘
mykey = lambda x: (-len(x), x.upper())
’

H‘The 0‘[... if ... else ... for ...]’ expression’

Code like this [from here[https://codeforces.com/contest/650/submission/16709913]] will not compile:
#(Python)‘
l = [b if char == "w" else 1 for char in input()]
’
Parentheses need to be added:
#(Python)‘
l = [(b if char == "w" else 1) for char in input()]
’

H‘Supported modules’

Currently, the Python → 11l → C++ transpiler partially supports the following built-in Python modules:
. math
. os
. time
. re
. random
. collections (defaultdict, deque and Counter only)
. heapq
. bisect
. array

H‘Practice’

Try fixing this Python code so that it compiles correctly with the Python → 11l → C++ transpiler:
1. ‘Mocha and Hiking’[https://codeforces.com/contest/1559/submission/126421811?locale=en]
2. ‘Mocha and Diana (Easy Version)’[https://codeforces.com/contest/1559/submission/125992428?locale=en]
3. ‘Forbidden Subsequence’[https://codeforces.com/contest/1617/submission/146468818?locale=en]
4. ‘GCD Problem’[https://codeforces.com/contest/1617/submission/142712405?locale=en]
5. ‘Mocha and Red and Blue’[https://codeforces.com/contest/1559/submission/147706575?locale=en]
6. ‘Pretty Permutations’[https://codeforces.com/contest/1541/submission/120613649?locale=en] (hint: {#(Python)‘[2,*n%2*[3],1]’ can be replaced with #(Python)‘[2]+n%2*[3]+[1]’})
7. ‘Playoff Tournament’[https://codeforces.com/contest/1535/submission/118451499?locale=en]
8. ‘Paired Payment’[https://codeforces.com/contest/1486/submission/107889551?locale=en]
[[[
. [https://codeforces.com/contest/1541/submission/120557452] (`a[k]` -> `a[(k+len(a)) % len(a)]` as `k` can be negative)
]]]
!‘To check your solution, open the page for the corresponding problem (under ‘Problem’ in the table), save the input of the example into a file called `input.txt` and then run the following three commands from the command line:
#‘
...11l your_solution.py
python orig_solution.py < input.txt > output_py.txt
your_solution < input.txt > output.txt
’
Then compare the contents of the files `output_py.txt` and `output.txt`.’
