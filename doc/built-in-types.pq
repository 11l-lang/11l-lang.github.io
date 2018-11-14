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

*‘String’
String type.
