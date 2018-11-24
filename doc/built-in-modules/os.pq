[[[H‘Module os’
]]]H‘Module os’


os:*‘getenv’(name, default = ‘’)
Return the value of the environment variable `name` if it exists, or `default` if it doesn't.

os:*‘setenv’(name, value)
Set the environment variable named `name` to the string `value`.

os:*‘environ’
A mapping object representing the string environment.

os:*‘env_path_sep’
The character conventionally used by the operating system to separate search path components (as in PATH), such as `:` for POSIX or `;` for Windows.
