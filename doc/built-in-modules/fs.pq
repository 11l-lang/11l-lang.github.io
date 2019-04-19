[[[H‘Module fs’
]]]H‘Module fs’


fs:*‘get_temp_dir’()
Return the name of the directory used for temporary files.
List of directories is searched to find one which the calling user can create files in. The list is:
1. The directory named by the TMPDIR environment variable.
2. The directory named by the TEMP environment variable.
3. The directory named by the TMP environment variable.
4. As a last resort, the current working directory.

fs:*‘list_dir’(path = ‘.’)
Return a list containing the names of the entries in the directory given by `path`.

fs:*‘walk_dir’(path = ‘.’, (String -> Bool) dir_filter = N, files_only = 1B)
Generate the file and directory names in a directory tree under `path`.
If `files_only` is true (1B), only file names are returned.
If `dir_filter` is given, then it is called for each directory and if `dir_filter` returns false (0B) for a specific directory, then `walk_dir` will not enter that directory.

fs:*‘is_dir’(path)
Return true (1B) if `path` is an existing directory (or a symbolic link pointing to a directory).

fs:*‘is_file’(path)
Return true (1B) if `path` is an existing file (or a symbolic link pointing to a file).
‘Why there is no fs:exists(path) function?’{
Because I think [[[you should express your intention]]]the intention should be expressed more clearly.
Consider this Python code:
#(Python)‘
if not os.path.isfile(out_fname) or os.stat(out_fname).st_mtime < os.stat(in_fname).st_mtime:
    open(out_fname, 'w').write(...)
’
If you replace `os.path.isfile` with `os.path.exists` then this code can work[[[s]]] "ok" (i.e. silently works incorrectly) when `out_fname` is a directory, but with `isfile` the PermissionError is raised in line `open(out_fname, 'w').write(...)`.

So if you really want to check like `os.path.exists` in Python, use more verbose code in 11l:
#(11l)‘
fs:is_file(path) | fs:is_dir(path)
’
or:
#(11l)‘
path. {fs:is_file(.) | fs:is_dir(.)}
’
}

fs:*‘is_symlink’(path)
Return true (1B) if path refers to an existing symbolic link.

fs:*‘file_size’(path)
Return the size of the file, in bytes.

fs:*‘create_dir’(path)
Create a directory named `path`.

fs:*‘create_dirs’(path)
Recursive directory creation function. Like `create_dir()`, but creates all intermediate-level directories needed to contain the leaf directory.

fs:*‘remove_file’(path)
Remove (delete) the file `path`.

fs:*‘remove_dir’(path)
Remove (delete) the directory `path`. Only works when the directory is empty.

fs:*‘remove_all’(p)
Deletes the contents of `p` (if it is a directory) and the contents of all its subdirectories, recursively, then deletes p itself. Symlinks are not followed (symlink is removed, not its target).

fs:*‘rename’(old_p, new_p)
Moves or renames the filesystem object identified by `old_p` to `new_p`.

fs:path:*‘sep’
The character used by the operating system to separate pathname components. This is `/` for POSIX and `\` for Windows.

fs:path:*‘join’(path1, path2)
Join `path1` and `path2`.

fs:path:*‘dir_name’(path)
Return the directory name of pathname `path` (for example: `fs:path:dir_name(‘./a/b’)` = `./a`).

fs:path:*‘base_name’(path)
Return the base name of pathname `path` (for example: `fs:path:base_name(‘./a/b’)` = `b`).

fs:path:*‘absolute’(path)
Return an absolutized version of the pathname `path`.

fs:path:*‘relative’(path, base)
Return a relative filepath to `path` from a `base` directory.

fs:path:*‘split_ext’(path)
Split the pathname `path` into a pair `(root, ext)` such that `root‘’ext == path`, and `ext` is empty or begins with a period and contains at most one period.
