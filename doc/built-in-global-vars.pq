[[[H‘Built-in global variables’
]]]H‘Built-in global variables’


*‘:stdin’
*‘:stdout’
*‘:stderr’
File objects used for standard input, output and errors:
. `:stdin` is used for all interactive input (including calls to `input()`);
. `:stdout` is used for the output of `print()`;
. error messages go to `:stderr`.

*‘:argv’
The [[[list/]]]array of command-line arguments[[[ passed to an executable]]]. `:argv[0]` is the executable name.
It can be accessed only when there is a `:start:` marker present in the source code.
(`:start:` marker is an analogue of Python's #(Python)‘if __name__ == '__main__'’ and is used to denote code which shouldn't be executed when this source file is imported from another source file (see ‘this example’[https://www.rosettacode.org/wiki/Modulinos#11l]).)
