[[[H‘Module f (formatted string literals)’
]]]H‘Module f (formatted string literals)’


Example: #(11l)‘f:‘{2+2:03}’’ gives `‘004’`.

```
format_spec ::= ["<"](width["."precision] | "."[precision])
width       ::= digit+
precision   ::= digit+
```

In 11l all fields by default are right-aligned regardless of their type {in Python only numbers are right-aligned by default}. `"<"` forces the field to be left-aligned.

Preceding the ~‘width’ field by a zero (`'0'`) character enables zero-padding.

There are no types (like `f` in Python).

