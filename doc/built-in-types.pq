[[[H‘Built-in types’
]]]H‘Built-in types’


*‘Bool’
Boolean type. Bool has two possible values: 0B and 1B {the main reason for rejection of true and false {11l is not the only one programming language in which boolean values are not true and false: for example, in Objective-C the pair YES/NO is used, and in Scheme: #t and #f} is that keywords do not fit into the base concept of 11l — all root {for example, `L` — is a root keyword, and `break` is a subkeyword} keywords can be shortened to one letter {there is an option to do it with Bool values: take Y as Yes/true and O as nO/false/0, but this is even more ugly than 0B and 1B, and also then language should be renamed to 13l}}. [Like in ‘Boolean algebra’[https://en.wikipedia.org/wiki/Boolean_algebra], in which 0 and 1 are used.]

*‘Int’
Integral type (‘32 or 64’[ ‘voting: 1. a. 32, b. 64, c. No Int [only Int32 and Int64]’] bits).

*‘Int8’
*‘Int16’
*‘Int32’
*‘Int64’
or[ ‘voting’]
*‘Int1’
*‘Int2’
*‘Int4’
*‘Int8’

*‘Float’
Floating-point type (‘32 or 64’[ ‘voting’] bits).

*‘Float32’
*‘Float64’
or[ ‘voting’]
*‘Float4’
*‘Float8’

*‘Char’
Character. For example this code creates a character with code 65:
#(11l)‘
Char(code' 65)
’
‘Members’{
*‘code’
Code of the character.
}
‘Methods’{
*‘is_digit’()
Return true (1B) if character is a digit.

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
String type. Can be constructed from a ‘string literal’[./../string-literals].
‘Members’{
*‘len’
Length of the string in characters.
}
‘Methods’{
*‘starts_with’(prefix)
Return true (1B) if the string starts with the `prefix`, otherwise return false (0B). `prefix` can also be a tuple of prefixes to look for.

*‘ends_with’(suffix)
Return true (1B) if the string ends with the specified `suffix`, otherwise return false (0B). `suffix` can also be a tuple of suffixes to look for.

*‘count’(sub)
Return the number of non-overlapping occurrences of substring `sub`.

*‘is_digit’()
Return true (1B) if all characters in the string are digits and there is at least one character, false (0B) otherwise.

*‘find’(sub, start = 0)
Return the lowest index in the string where substring `sub` is found. Search begins at `start`. Return `N`/`null` if `sub` is not found. `sub` can also be a tuple of strings to look for.

*‘findi’(sub, start = 0)
Return the lowest index in the string where substring `sub` is found. Search begins at `start`. Return `-1` if `sub` is not found.

*‘rfind’(sub[, start])
Return the highest index in the string where substring `sub` is found. Search begins at `start` (if `start` is not specified, whole string will be searched). Return `N`/`null` if `sub` is not found.

*‘rfindi’(sub, start, end)
Return the highest index in the string where substring `sub` is found, such that `sub` is contained within `s[start.<end]`. Return `-1` if `sub` is not found.

*‘replace’(old, new)
Return a copy of the string with all occurrences of substring `old` replaced by `new`. `old` can be a regular expression.

*‘lowercase’()
Return a copy of the string with all the cased characters converted to lowercase.

*‘uppercase’()
Return a copy of the string with all the cased characters converted to uppercase.

*‘zfill’(width)
Return a copy of the string left filled with ASCII '0' digits to make a string of length `width`.

*‘split’(delim[, limit])
Divides string into substrings based on a delimiter, returning an array of these substrings. `delim` can be a regular expression. `delim` can also be a tuple of characters (example: #(11l)‘s.split((‘ ’, "\t", "\n", "\r"))’). If `limit` is given, at most that number of fields will be returned (if `limit` is 1, the entire string is returned as the only entry in an array). [`limit` argument in 11l is similar to JavaScript, Ruby and PHP, but not Python.]

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
}

*‘Array’
Array type.
‘Methods’{
}
