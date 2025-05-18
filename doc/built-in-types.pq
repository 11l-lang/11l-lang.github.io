[[[H‘Built-in Types’
]]]H‘Built-in Types’


*‘Bool’
Boolean type. Bool has two possible values: `0B` and `1B` {the main reason for rejection of `true` and `false` {11l is not the only one programming language in which boolean values are not `true` and `false`: for example, PL/I uses `'0'B` and `'1'B`, in Objective-C the pair `YES`/`NO` is used, and in Scheme: `#t` and `#f`} is that keywords do not fit into the base concept of 11l — all root {for example, `L` — is a root keyword, and `break` is a subkeyword} keywords can be shortened to one letter {there is an option to do it with Bool values: take Y as Yes/true and O as nO/false/0, but this is even more ugly than 0B and 1B, and also then language should be renamed to 13l}}. [Like in ‘Boolean algebra’[https://en.wikipedia.org/wiki/Boolean_algebra], in which 0 and 1 are used.]

*‘Int’
Integral type (‘32 or 64’[http://forum.11l-lang.org/threads/size-of-int-built-in-type.1/ ‘Size of Int built-in type 32 bits 64 bits No Int type (use Int32 or Int64 explicitly) What size of Int you think should be?’] bits).
To construct an integer from a string write #(11l)‘Int(s)’.
To construct an integer from a string in radix `base` write #(11l)‘Int(s, radix' base)’.
To construct an integer from an array of bytes write #(11l)‘Int(bytes' b)’ for little-endian, and #(11l)‘Int(bytes_be' b)’ for big-endian.
‘Methods’{
*‘to_bytes’()
Return an array of bytes representing an integer.

*‘bits’(range)
Return bits of an integer corresponding to a giving `range`. (Example: #(11l)‘00AB'CDEF.bits(4 .+ 8)’ gives #(11l)‘D'E’.)
}

*‘Int8’
*‘Int16’
*‘Int32’
*‘Int64’ or *‘Long’[[[
or[http://forum.11l-lang.org/threads/int8-int16-int32-int64-vs-int1-int2-int4-int8.3/ ‘Int8, Int16, Int32, Int64 vs Int1, Int2, Int4, Int8 ‘Int8, Int16, Int32, Int64’ ‘Int1, Int2, Int4, Int8’ What way of the designation of the size of Int/Float do you prefer? Bits or bytes?’]
*‘Int1’
*‘Int2’
*‘Int4’
*‘Int8’]]]
Signed integers.

*‘Byte’
*‘UInt16’
*‘UInt32’
*‘UInt64’ or *‘ULong’
Unsigned integers.

*‘BigInt’
Arbitrary-precision integer.

*‘Float’
Floating-point type (‘32 or 64’[http://forum.11l-lang.org/threads/size-of-float-built-in-type.2/] bits).

*‘Float32’ or *‘SFloat’ [*‘S’ingle-precision *‘float’ing-point]
*‘Float64’[[[
or[http://forum.11l-lang.org/threads/int8-int16-int32-int64-vs-int1-int2-int4-int8.3/]
*‘Float4’/*‘SFloat’
*‘Float8’]]]

*‘Char’
Character.
For example, this code creates a character with code 65:
#(11l)‘
Char(code' 65)
’
To create a character from single-digit integer number write this:
#(11l)‘
Char(digit' i)
’
To create a character from single character string write this:
#(11l)‘
Char(string' s)
’
(This differs from #(11l)‘s[0]’ by throwing an error if length of `s` is greater than 1.)
To create a character from single character string literal write this:
#(11l)‘
Char("\0")
’
‘Members’{
*‘code’
Code of the character.
}
‘Methods’{
*‘is_digit’()
Return true (1B) if character is a digit.

*‘is_alpha’()
Return true (1B) if character is an alphabetic.

*‘is_lowercase’()
Return true (1B) if character is lowercase.

*‘is_uppercase’()
Return true (1B) if character is uppercase.

*‘lowercase’()
Return a copy of the character converted to lowercase.

*‘uppercase’()
Return a copy of the character converted to uppercase.
}

*‘String’
String type. Can be constructed from a ‘string literal’[./../string-literals]. To construct a string from an integer in radix `base` write #(11l)‘String(i, radix' base)’.
~‘Note: in contrast to Python, strings in 11l are mutable (like in C++).’
‘Members’{
*‘len’
Length of the string in characters.
}
‘Methods’{
*‘empty’
Returns true (1B) if the string has no characters; otherwise returns false (0B). (This method is called without parentheses.)

*‘last’
A last character of the string. (This method is called without parentheses.)

*‘starts_with’(prefix)
Return true (1B) if the string starts with the `prefix`, otherwise return false (0B). `prefix` can also be a tuple of prefixes to look for.

*‘ends_with’(suffix)
Return true (1B) if the string ends with the specified `suffix`, otherwise return false (0B). `suffix` can also be a tuple of suffixes to look for.

*‘count’(sub)
Return the number of non-overlapping occurrences of substring `sub`.

*‘is_digit’()
Return true (1B) if all characters in the string are digits and there is at least one character, false (0B) otherwise.

*‘is_alpha’()
Return true (1B) if all characters in the string are alphabetic and there is at least one character, false (0B) otherwise.

*‘find’(sub, start = 0)
Return the lowest index in the string where substring `sub` is found. Search begins at `start`. Return `N`/`null` if `sub` is not found. `sub` can also be a tuple of strings to look for.

*‘findi’(sub, start = 0)
Return the lowest index in the string where substring `sub` is found. Search begins at `start`. Return `-1` if `sub` is not found.

*‘rfind’(sub[, start])
Return the highest index in the string where substring `sub` is found. Search begins at `start` (if `start` is not specified, whole string will be searched). Return `N`/`null` if `sub` is not found.

*‘rfindi’(sub, start, end)
Return the highest index in the string where substring `sub` is found, such that `sub` is contained within `s[start.<end]`. Return `-1` if `sub` is not found.

*‘replace’(old, new)
Return a copy of the string with all occurrences of [[[substring]]] `old` replaced by `new`. `old` can be a regular expression.

*‘lowercase’()
Return a copy of the string with all the cased characters converted to lowercase.

*‘uppercase’()
Return a copy of the string with all the cased characters converted to uppercase.

*‘capitalize’()
Return a copy of the string with its first character capitalized.

*‘zfill’(width)
Return a copy of the string left filled with ASCII '0' digits to make a string of length `width`.

*‘center’(width, fillchar = ‘ ’)
Return centered in a string of length `width`. Padding is done using the specified `fillchar`.

*‘ljust’(width, fillchar = ‘ ’)
Return the string left justified in a string of length `width`. Padding is done using the specified `fillchar`.

*‘rjust’(width, fillchar = ‘ ’)
Return the string right justified in a string of length `width`. Padding is done using the specified `fillchar`.

*‘split’(delim, limit = N, group_delimiters = 0B)
Divides string into substrings based on a delimiter, returning an array of these substrings. `delim` can be a regular expression. `delim` can also be a tuple of characters (example: #(11l)‘s.split((‘ ’, "\t", "\n", "\r"))’). If `limit` is given, at most that number of fields will be returned (if `limit` is 1, the entire string is returned as the only entry in an array). [`limit` argument in 11l is similar to JavaScript, Ruby and PHP, but not Python.]
If `group_delimiters` is `0B`, consecutive delimiters are not grouped together and are deemed to delimit empty strings (for example, `‘1,,2’.split(‘,’)` returns `[‘1’, ‘’, ‘2’]`).
If string is empty, an empty array is returned (like in Ruby, bot not in Python and JavaScript). So `[].join(‘,’).split(‘,’)` returns an empty array, but not `[‘’]`.

*‘split’(delim, ', req)
Divides string into substrings based on a delimiter, returning an array of these substrings. `req` imposes a restriction on the length of returned array. `req` can be an integer, a range, or tuple consisting of integers and/or ranges.

*‘ltrim’(string[, limit])
Return a copy of the string with leading strings removed. At most `limit` strings are removed.

*‘ltrim’(tuple_of_chars[, limit])
Return a copy of the string with leading characters removed. At most `limit` characters are removed.

*‘rtrim’(string[, limit])
Return a copy of the string with trailing strings removed. At most `limit` strings are removed.
Example: #(11l)‘‘1.0.0’.rtrim(‘.0’, 1)’ returns #(11l)‘‘1.0’’.

*‘rtrim’(tuple_of_chars[, limit])
Return a copy of the string with trailing characters removed. At most `limit` characters are removed.
Example: #(11l)‘‘a.,’.rtrim((‘.’, ‘,’))’ returns #(11l)‘‘a’’.

*‘trim’(string)
Return a copy of the string with leading and trailing strings removed.

*‘trim’(tuple_of_chars)
Return a copy of the string with leading and trailing characters removed.

*‘format’(args...)
Perform a string formatting operation. The string on which this method is called can contain literal text or replacement fields starting with `#`. Returns a copy of the string where each replacement field is replaced with the string value of the corresponding argument.
‘Format String Syntax’{
```
replacement_field ::= "#"["<"](width["."precision] | "."[precision])
width     ::= digit+
precision ::= digit+
```

Examples:
T‘
H‘‘Replacement field’ ‘Argument’  ‘Output’      ’
‘‘#‘#4.’’             ‘#‘40’’     ‘#‘  40.’’    ’
‘‘#‘#4’’              ‘#‘4’’      ‘#‘   4’’     ’
‘‘#‘#4’’              ‘#‘1.2’’    ‘#‘ 1.2’’     ’
‘‘#‘#04’’             ‘#‘1.2’’    ‘#‘01.2’’     ’
‘‘#‘#.’’              ‘#‘1.234’’  ‘#‘1.234’’    ’
‘‘#‘#.6’’             ‘#‘1.234’’  ‘#‘1.234000’’ ’
‘‘#‘#2.6’’            ‘#‘1.234’’  ‘#‘ 1.234000’’’
‘‘#‘#2.2’’            ‘#‘1.234’’  ‘#‘ 1.23’’    ’
‘‘#‘#2.2’’            ‘#‘-1.234’’ ‘#‘-1.23’’    ’
‘‘#‘#2’’              ‘#‘1’’      ‘#‘ 1’’       ’
‘‘#‘#5’’              ‘#‘abc’’    ‘#‘  abc’’    ’
‘‘#‘#.’’              ‘#‘abc’’    ‘#‘abc’’      ’
‘‘#‘#<5.’’            ‘#‘abc’’    ‘#‘abc  .’’   ’
‘‘#‘That's like rule ###..’’ ‘#‘1’’ ‘#‘That's like rule #1.’’’
’
}
}

*‘Tuple’
A tuple. For example, a tuple with two items: #(11l)‘(1, 2)’. [Type of this tuple is `(Int, Int)` or `Tuple[Int, Int]` or `IVec2`.]
The elements of tuples consisting of from 2 to 4 elements of the same arithmetic type can be accessed by `x`, `y`, `z`, `w` or `r`, `g`, `b`, `a`.
Arithmetic operations (`+`, `-`, `*`, `/`) on tuples are performed componentwise {for example, `(x1, y1, z1) + (x2, y2, z2)` will give the following tuple: `(x1 + x2, y1 + y2, z1 + z2)` {and `(x, y, z) * 2` will give `(x*2, y*2, z*2)`}}.
~‘Note 1: like ‘in mypy’[https://stackoverflow.com/a/52559625/2692494 <- google:‘mypy list any’], tuples in 11l are heterogeneous, but arrays (analogue of Python's lists) are homogeneous.
Note 2: in contrast to Python, tuples in 11l are mutable (like in C++).’
Tuple with named items/elements: #(11l)‘(name' ‘John’, age' 30)’. [Type of this tuple is `(String name, Int age)` or `Tuple[String name, Int age]`.]

*‘Array’
An array. For example, an array with two items: #(11l)‘[1, 2]’. [Type of this array is `[Int]`[[[ {Why `[Int]` like in Swift, but not `Int[]` like in D: in some cases this is more beautiful, e.g.: #(11l)‘[(Int, Int)]’ vs #(11l)‘(Int, Int)[]’}]controversial statement]] or `Array[Int]`.]
‘Members’{
*‘len’
Length of an array.
}
‘Methods’{
*‘empty’
Returns true (1B) if the array has no elements; otherwise returns false (0B). (This method is called without parentheses.)

*‘last’
A last element of the array. (This method is called without parentheses.)

*‘join’(sep)
Return a string which is the concatenation of the strings in an array. `sep` is the separator between elements.

*‘map’(function)
Applies `function` to every item of an array and return that new array.

*‘filter’(function)
Return a new array consisting of those elements from this array for which `function` returns true (1B).

*‘reduce’([initial,] function)
Apply `function` of two arguments cumulatively to the items of the array, from left to right, so as to reduce the array to a single value. For example, `[1, 2, 3].reduce((x, y) -> x + y)` calculates `((1+2)+3)`. If the optional `initial` is present, it is placed before the items of the array in the calculation, and serves as a default when the array is empty.
[Note that order of the arguments is the same as ‘in Java’[https://docs.oracle.com/javase/tutorial/collections/streams/reduction.html#reduce], ‘in Swift’[https://developer.apple.com/documentation/swift/array/2298686-reduce] and ‘in Rust’[https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.fold], but not in Python.]

*‘append’(new_element)
Appends `new_element` to the end of this array.

*‘append’(arr)
Appends all elements of `arr` to the end of this array.

*‘append’(range)
Append all values of `range` to the end of this array. Example: {
#(11l)‘
V arr = [-1]
arr.append(1..3)
print(arr) // will print [-1, 1, 2, 3]
’
}

*‘arr 0‘[+]’= x’
The same as #(11l)‘arr.append(x)’.

*‘pop’()
Retrieves the last item of this array and also removes it.

*‘pop’(~‘i’)
Retrieves the item at ~‘i’ and also removes it.

*‘pop_fast’(~‘i’)
Retrieves the item at ~‘i’ and also removes it.
This version is much more efficient than *‘pop’(~‘i’) (O(1) instead of O(N)), but does not preserve the order.

*‘index’(x, start = 0)
Return index of the first occurrence of `x` in this array (at or after index `start`). `ValueError` is raised when `x` is not found in this array.

*‘find’(x, start = 0)
Return index of the first occurrence of `x` in this array (at or after index `start`), or `N`/`null` if `x` is not found in this array. `x` can also be a tuple of values to look for.

*‘count’(x)
Return total number of occurrences of `x` in this array.

*‘sort’()
This method sorts the array in place, using only `<` comparisons between items.

*‘sort_range’(range)
This method sorts the specified range of an array in place.

*‘reverse’()
Reverses the items of array in place.
}

*‘Dict’
A dictionary. For example, a dictionary with two items: #(11l)‘[‘key1’ = 1, ‘key2’ = 2]’.
[Type of this dictionary is `[String = Int]` or `Dict[String, Int]`.]
‘Methods’{
*‘empty’
Returns true (1B) if the dictionary has no items; otherwise returns false (0B). (This method is called without parentheses.)

*‘find’(key) -> ValueType?
Finds element with specific key. If no such element is found, `N`/`null` is returned.

*‘get’(key, default) -> ValueType
Return the value for `key` if `key` is in the dictionary, else `default`.

*‘keys’()
Return an array of the dictionary's keys.

*‘values’()
Return an array of the dictionary's values.

*‘filter’(function)
Return an array consisting of those elements of dictionary for which `function` returns true (1B).
}

*‘DefaultDict’
A dictionary, which does not throw an exception when accessing a non-existent key (it inserts a new item with a default value in this case).
For example, a default dictionary with two items: #(11l)‘DefaultDict([‘key1’ = 1, ‘key2’ = 2])’.
[Type of this dictionary is `DefaultDict[String, Int]`.]

*‘Set’
A set. For example, a set with two items: #(11l)‘Set([1, 2])’. [Type of this set is `Set[Int]`.]
‘Methods’{
*‘empty’
Returns true (1B) if the set has no elements; otherwise returns false (0B). (This method is called without parentheses.)

*‘add’(elem)
Add element `elem` to the set.

*‘remove’(elem)
Remove element `elem` from the set. Raises `KeyError` if `elem` is not contained in the set.

*‘clear’()
Remove all elements from the set.

*‘difference’(other)
Return a new set with elements in the set that are not in the `other`.

*‘lower_bound’(key) -> KeyType?
Returns the first element which is not less than the given `key`. If no such element is found, `N`/`null` is returned.

*‘upper_bound’(key) -> KeyType?
Returns the first element which is greater than the given `key`. If no such element is found, `N`/`null` is returned.
}

*‘Deque’
A double-ended queue. For example, a deque with two items: #(11l)‘Deque([1, 2])’. [Type of this deque is `Deque[Int]`.]
‘Methods’{
*‘empty’
Returns true (1B) if the queue has no items; otherwise returns false (0B). (This method is called without parentheses.)

*‘append’(x)
Add `x` to the right side of the deque.

*‘append_left’(x)
Add `x` to the left side of the deque.

*‘clear’()
Remove all elements from the deque leaving it with length 0.

*‘extend’(iterable)
Extend the right side of the deque by appending elements from the iterable argument.

*‘extend_left’(iterable)
Extend the left side of the deque by appending elements from `iterable`.

*‘index’(x, start = 0)
Return the position of `x` in the deque (at or after index `start`). Returns the first match or raises `ValueError` if not found.

*‘insert’(i, x)
Insert `x` into the deque at position `i`.

*‘pop’()
Remove and return an element from the right side of the deque. If no elements are present, raises an `IndexError`.

*‘pop_left’()
Remove and return an element from the left side of the deque. If no elements are present, raises an `IndexError`.

*‘remove’(value)
Remove the first occurrence of `value`. If not found, raises a `ValueError`.
}

*‘File’
A file object.
‘Methods’{
*‘File’(name, encoding = ‘utf-8-sig’)
Open file with the specified name for reading.

*‘File’(name, WRITE, encoding = ‘utf-8’)
Open file with the specified name for writing. If the given file exists, its contents are destroyed.

*‘File’(name, APPEND, encoding = ‘utf-8’)
Open file with the specified name for writing at the end of the file (appending).
~‘Note: only utf-8 and utf-8-sig [UTF-8 with BOM] encodings are supported at the present moment.’

*‘read’() -> String
Read a whole file into a string, and return it.

*‘read’(1) -> Char
Read and return single character from the file.

*‘read_line’(keep_newline = 0B) -> String
Read and return one line from the file. If `keep_newline` argument is true (1B), trailing new-line character is [[[remained/]]]left as is.

*‘read_lines’(keep_newline = 0B) -> Iterator0‘[String]’
[[[Read and return an array of lines from the file.]]]Reads the entire file [[[specified by name]]] as individual lines, and returns those lines [[[in an array]]]as iterator. If `keep_newline` argument is true (1B), trailing new-line characters are [[[remained/]]]left as is.

*‘read_bytes’() -> Array0‘[Byte]’
Read a whole file into an array of bytes, and return it.

*‘read_bytes’(size) -> Array0‘[Byte]’
Read `size` bytes from the file and return them. May throw `UnexpectedEOF`.

*‘read_bytes’(at_most' size) -> Array0‘[Byte]’
[[[Read and return at most `size` bytes from the file.]]]Read [[[up to]]]at most `size` bytes from the file and return them.

*‘write’(s)
Write the string `s` to the file.

*‘write_bytes’(Array0‘[Byte]’ bytes)
Write bytes to the file.

*‘flush’()
Flush the write buffers of the file.
}
