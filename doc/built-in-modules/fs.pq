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

fs:*‘is_directory’(path)
Return true (1B) if `path` is an existing directory (or a symbolic link pointing to a directory).

fs:*‘create_directory’(path)
Create a directory named `path`.

fs:*‘create_directories’(path)
Recursive directory creation function. Like `create_directory()`, but creates all intermediate-level directories needed to contain the leaf directory.

fs:*‘remove(p)’
The file or empty directory identified by the path `p` is deleted. Symlinks are not followed (symlink is removed, not its target).

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
