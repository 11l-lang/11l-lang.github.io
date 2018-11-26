[[[H‘Module re’
]]]H‘Module re’


re:‘pattern’
re:(‘pattern’, flags)
Create regular expression.


H(-1)‘Methods’

*‘search’(string)
Scan through `string` looking for the first location where the regular expression produces a match, and return a corresponding match object.

*‘match’(string)
If the whole `string` matches the regular expression, return a corresponding match object.

*‘find_strings’(string)
Return all non-overlapping matches of the regular expression in `string`, as an array of strings.

*‘find_matches’(string)
Return an iterator yielding match objects over all non-overlapping matches for the regular expression in `string`.


H(-1)‘Match object methods’

*‘group’(group = 0) -> String
Returns subgroup of the match. If a `group` argument is zero, the return value is the entire matching string.

*‘start’(group = 0)
*‘end’(group = 0)
Return the indices of the start and end of the substring matched by `group` (or the whole matched substring if `group` argument is zero).
