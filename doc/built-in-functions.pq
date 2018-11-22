[[[H‘Built-in Functions’
]]]H‘Built-in Functions’


*‘print’(object, end = "\n")
Print `object` to stdout followed by `end`.

*‘input’()
The function reads a line from input, converts it to a string (stripping a trailing newline), and returns that.

*‘assert’(expression, message = ‘’)
Raise AssertionError if `expression` evaluates to false.

*‘exit’(message = N)
Terminates the calling process. When `message` is specified it is printed to stderr.

*‘sleep’(secs)
Suspend execution of the calling thread for the given number of seconds. The argument may be a floating point number to indicate a more precise sleep time.

*‘zip’(iterable1, iterable2)
Aggregates elements from `iterable1` and `iterable2`.

*‘sum’(iterable)
Sums the items of an `iterable` and returns the total.

*‘min’(arg1, arg2)
Return the smallest of two arguments.

*‘max’(arg1, arg2)
Return the largest of two arguments.

*‘hex’(x)
Convert an integer number to an uppercase hexadecimal string.

‘Mathematical functions’{
*‘round’(number, ndigits = 0)
Return `number` rounded to `ndigits` precision after the decimal point.

*‘ceil’(x)
Return the ceiling of `x`, the smallest integer greater than or equal to `x`.

*‘floor’(x)
Return the floor of `x`, the largest integer less than or equal to `x`.

*‘trunc’(x)
Return value `x` truncated to an integer.

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
