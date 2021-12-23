[[[H‘Module f (formatted string literals)’
]]]H‘Module f (formatted string literals)’


Format strings contain “replacement fields” surrounded by curly braces `{}`. Anything that is not contained in braces is considered literal text, which is copied unchanged to the output. If you need to include a brace character in the literal text, it can be escaped by doubling: `{{` and `}}`.

Example: #(11l)‘f:‘{2+2:03}’’ gives #(11l)‘‘004’’.

```
replacement_field ::=  "{" [field_name] [":" format_spec] "}"
format_spec ::= ["<"](width["."precision] | "."[precision])
width       ::= digit+
precision   ::= digit+
```

In 11l all fields by default are right-aligned regardless of their type {in Python only numbers are right-aligned by default}. `<` forces the field to be left-aligned.

Preceding the ~‘width’ field by a zero (`0`) character enables zero-padding.

There are no types (like `f` in Python).[[[

And of course, you can omit the format specifier: #(11l)‘f:‘id = {id}’’.
]]]
