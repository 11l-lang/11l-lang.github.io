[[[H‘V/var’
]]]H‘V/var keyword’


[[[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var]]]The #(11l)‘V’/#(11l)‘var’ statement declares a variable initializing it to a value.
#(11l)‘
V variable_name = value
’

You can declare more than one variable at a time with a tuple assignment:
#(11l)‘
F get_row_column() // this is a function returning a tuple
   ...
   R (row, col)
...
V (row, col) = get_row_column() // analogous code: `V rc = get_row_column(); V row = rc[0]; V col = rc[1]`
’

Partial declaration is also [[[acceptable/]]]possible:
#(11l)‘
(V row2, col) = get_row_column() // `col` has already been declared, `row2` is declared here
’
or:
#(11l)‘
(row, V col2) = get_row_column() // `row` has already been declared, `col2` is declared here
’

To declare and initialize to some value multiple variables at once use this notation ({however this is not supported now [{why write about this unsupported feature here in the documentation? because when preparing the implementation of a full-fledged compiler to have an idea of all the required features (including those transpiler 11l → C++ doesn't support)}]}):
#(11l)‘
V a = V b = 0
’

To declare a constant "variable" use #(11l)‘-V’/#(11l)‘-var’:
#(11l)‘
-V constant_name = value
’
[{On the one hand, `-` means constancy, and on the other hand it means negation[https://en.wikipedia.org/wiki/Additive_inverse ‘This number is also known as the opposite (number), sign change, and negation.’] (<not variable> is <constant>).}]

To reduce the amount of #(11l)‘V’/#(11l)‘var’ keywords you can use a new scope. For example, this code:
#(11l)‘
-V
   n_rows = 10
   n_cols = 10
   grid_size = n_rows * n_cols
   min_words = 25
’
is equivalent to this:
#(11l)‘
-V n_rows = 10
-V n_cols = 10
-V grid_size = n_rows * n_cols
-V min_words = 25
’

H(-1)‘`V?` and `V&`’

#(11l)‘
V? i = ‘str’.find(‘s’)

F print_set(DefaultDict[Int, Set[Int]] &map; key)
   V& s = map[key] // `V s = map[key]` is forbidden (but you can write `V s = copy(map[key])`)
’

H(-1)‘`I V`’

#(11l)‘
I (V&? sheep = Sheep?(animal)) != N
   print(sheep.some_sheep_prop)
’
can be shortened {
#(11l)‘I -V sheep = Sheep?(animal)’ is redundant also because if `animal` is of type `-Animal`, then `sheep` will be const anyway [like with `auto&` in C++ — `const auto&` is not needed in such case].
} to:
#(11l)‘
I V sheep = Sheep?(animal)
   ...
’
because there is no hidden copying and sharing in 11l.

And like in Swift {
>[https://stackoverflow.com/questions/25828301/how-is-swift-if-let-evaluated <- google:‘swift "if let"’]:‘you can write:
#‘
if let name = optionalName {
’
but not
#‘
if (let name = optionalName) {
’
’[[[}}]]]} #(11l)‘I (V sheep = Sheep?(animal)) {...}’ is forbidden.

However, in 11l this is also possible:
#(11l)‘
I T(animal) == Sheep // or `I T(animal) >= Sheep`
   print(animal.some_sheep_prop)
’

Also note this:
#(11l)‘
I V v = ... // `v` is like a constant reference, so
   v = ...  // this is forbidden

// And if you want `v = ...` then:
I V& v = ...   // write this
I V v = copy(...) // or this
’
[This may seems strange, but there is a similar behaviour in other parts of 11l: `L(el)` vs `L(&el)`, and function arguments (which are immutable ‘by default’/‘without qualifiers’).
However, despite of `v = ...` is forbidden, you can call mutable methods of `v` (for the sake of convenience).]

H(-1)‘`V E`’

Instead of:
#(11l)‘
V&? el = map.get(key)
I el == N
   print(‘Key <’key‘> is not found!’)
   R
’
[[[you can]]]it is better to write:
#(11l)‘
V& el = map.get(key) E
   print(‘Key <’key‘> is not found!’)
   R
’
[[[
Alternative syntax:
#(11l)‘
V& el = map.get(key)
E
   print(‘Key <’key‘> is not found!’)
   R
’
]]]This syntax is[[[/was]]] inspired by `guard let` {however, there is no analogue of `guard <condition>` in 11l, because you can write just `I !(<condition>)`} in Swift, but it is also a [[[very ]]]logical enough, because
#(11l)‘
V& el = map.get(key)!
’
is the same as:
#(11l)‘
V& el = map.get(key) E
   X.throw NullPointerException()
’
