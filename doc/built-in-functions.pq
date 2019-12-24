[[[H‘Built-in Functions’
]]]H‘Built-in Functions’


*‘print’(object = ‘’, end = "\n")
Print `object` to stdout followed by `end`.

*‘input’([prompt])
If the `prompt` argument is present, it is written to standard output without a trailing newline. The function then reads a line from input, converts it to a string (stripping a trailing newline), and returns that.

*‘assert’(expression, message = ‘’)
Raise AssertionError if `expression` evaluates to false.

*‘exit’(message = N)
Terminates the calling process. When `message` is specified it is printed to stderr.

*‘sleep’(secs)
Suspend execution of the calling thread for the given number of seconds. The argument may be a floating point number to indicate a more precise sleep time.

*‘swap’(&a, &b)
Exchanges the values of the two arguments. Equivalent to `(a, b) = (b, a)`.

*‘zip’(iterable1, iterable2)
Aggregates elements from `iterable1` and `iterable2`.

*‘all’(iterable)
Return true (1B) if all elements of the `iterable` are true (or if the `iterable` is empty).

*‘any’(iterable)
Return true (1B) if any element of the `iterable` is true. If the `iterable` is empty, return false (0B).[[[
Why `sum(arr)`, `product(arr)`, `all(arr)`, `any(arr)` etc., but `arr.filter(...)`, `arr.map(...)`, `arr.reduce(...)`?
Because I dislike empty parentheses [e.g. `arr.sum()`].]]]

*‘cart_product’(iterable1, iterable2)
Cartesian product of input iterables.

*‘multiloop’(iterable1, iterable2 [,iterable3], function)
This function is roughly equivalent to the following code: {
#(11l)‘
F multiloop(iterable1, iterable2, function)
   V r = []
   L(el1) iterable1
      L(el2) iterable2
         r [+]= function(el1, el2)
   R r
’}

*‘multiloop_filtered’(iterable1, iterable2 [,iterable3], filter_function, function)
This function is roughly equivalent to the following code: {
#(11l)‘
F multiloop_filtered(iterable1, iterable2, filter_function, function)
   V r = []
   L(el1) iterable1
      L(el2) iterable2
         I filter_function(el1, el2)
            r [+]= function(el1, el2)
   R r
’}

*‘sum’(iterable)
Sums the items of an `iterable` and returns the total.

*‘product’(iterable)
Multiplies the items of an `iterable` and returns the total.

*‘sorted’(iterable, key = N, reverse = 0B)
Return a new sorted array from the items in `iterable`.
`key` specifies a function of one argument that is used to extract a comparison key from each element of `iterable`.
`reverse` is a boolean value. If set to true (1B), then the elements of `iterable` are sorted as if each comparison were reversed.

*‘min’(arg1, arg2)
Return the smallest of two arguments.
*‘min’(iterable)
Return the smallest item of `iterable`.

*‘max’(arg1, arg2)
Return the largest of two arguments.
*‘max’(iterable)
Return the largest item of `iterable`.

*‘hex’(x)
Convert an integer number to an uppercase hexadecimal string.

*‘bin’(x)
Convert an integer number to a binary string.

*‘rotl’(value, shift)
Rotate the `value` left by `shift` bits.

*‘rotr’(value, shift)
Rotate the `value` right by `shift` bits.

‘Mathematical functions’{
*‘round’(number, ndigits = 0)
Return `number` rounded to `ndigits` precision after the decimal point.

*‘ceil’(x)
Return the ceiling of `x`, the smallest integer greater than or equal to `x`.

*‘floor’(x)
Return the floor of `x`, the largest integer less than or equal to `x`.

*‘trunc’(x)
Return value `x` truncated to an integer.

*‘wrap’(x, min_val, max_val)
[[[(]]]Wraps x at range '‘[’'min_val, max_val)'‘<!--]-->’'. Returns `mod(x - min_val, max_val - min_val) + min_val`.

*‘abs’(x)
Return the absolute value of a number.

*‘exp’(x)
Return e raised to the power `x`, where e = 2.718281… is the base of natural logarithms.

*‘log’(x[, base])
With one argument, return the natural logarithm of `x` (to base e).
With two arguments, return the logarithm of `x` to the given `base`, calculated as `log(x)/log(base)`.

*‘log2’(x)
Return the base-2 logarithm of `x`.

*‘log10’(x)
Return the base-10 logarithm of `x`.

*‘pow’(x, y)
Return `x` raised to the power `y`.
Using built-in `^` operator is recommended instead of this function.

*‘sqrt’(x)
Return the square root of `x`.

*‘acos’(x)
Return the arc cosine of `x`, in radians.

*‘asin’(x)
Return the arc sine of `x`, in radians.

*‘atan’(x)
Return the arc tangent of `x`, in radians.

*‘atan2’(x, y)
Return `atan(y / x)`, in radians. The result is between `-pi` and `pi`.

*‘cos’(x)
Return the cosine of `x` radians.

*‘sin’(x)
Return the sine of `x` radians.

*‘tan’(x)
Return the tangent of `x` radians.

*‘degrees’(x)
Convert angle `x` from radians to degrees.

*‘radians’(x)
Convert angle `x` from degrees to radians.
}
