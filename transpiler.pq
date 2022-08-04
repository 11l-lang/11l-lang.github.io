[[[H‘The Python → 11l → C++ transpiler’]]]
><‘Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Python_logo_and_wordmark.svg/250px-Python_logo_and_wordmark.svg.png’Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/U%2B2192.svg/100px-U%2B2192.svg.png’Р‘https://avatars1.githubusercontent.com/u/22068453?s=150’Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/U%2B2192.svg/100px-U%2B2192.svg.png’Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/125px-ISO_C%2B%2B_Logo.svg.png’’


The Python → 11l → C++ transpiler is a union of 2 transpilers:
1. The Python → 11l transpiler, which translates Python code into 11l.
2. The 11l → C++ transpiler, which translates 11l code into C++ [which is then compiled into machine code].

In a sense, the 11l programming language acts as an intermediate language, but since it is very similar and close to the Python language (albeit semantically, not syntactically), it is generally not required to study it specifically.

Also it should be noted that this transpiler generates a human-readable code, which simplifies debugging of the [[[written/]]]generated program.

><‘T‘‘‘><‘‘Performance’{

<>‘Here is the results for ‘pqmarkup to HTML converter’[https://sourceforge.net/p/pqmarkup/code/ci/default/tree/pqmarkup.py <- https://sourceforge.net/p/pqmarkup/code/ <- https://bitbucket.org/pqmarkup/pqmarkup] (as an input data the source of ‘this article’[https://habr.ru/post/348218/] is taken):
P‘https://gist.githubusercontent.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/da5d89013d3915dd2f4f14d011007d4adfea0e02/chart2.png’
(Shed Skin is not listed here because it does not support nested functions.)
[‘Here is an archive’[https://gist.github.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/e6cb2f07446ef4a19a3d6cdc1f8c483287ef1308/perf_tests.7z] with testing program used (Python 3.6 or higher is required, and following Python packages: pywin32, cython).]

[[[And ]]]This is the results for a ‘Prime number’[https://translate.google.com/translate?hl=&sl=ru&tl=en&u=https://informatics.msk.ru/mod/statements/view.php?chapterid=973] problem (with K = 1000000):
P‘./chart_prime.png’
‘Here is a corresponding Python source code’{
#(Python)‘
import math

k = int(input())
n = k * 17
primes = [True] * n
primes[0] = primes[1] = False

for i in range(2, int(math.sqrt(n)) + 1):
    if not primes[i]:
        continue
    for j in range(i * i, n, i):
        primes[j] = False

for i in range(n):
    if primes[i]:
        if k == 1:
            print(i)
            break
        k -= 1
’
}

And this code {
#(Python)‘
def is_right_triangle(x1, y1, x2, y2):
    a = x1**2 + y1**2
    b = x2**2 + y2**2
    c = (x2 - x1)**2 + (y2 - y1)**2
    return (a + b == c) or (b + c == a) or (c + a == b)

LIMIT = 51
ans = 0
for x1 in range(LIMIT):
    for y1 in range(LIMIT):
        for x2 in range(LIMIT):
            for y2 in range(LIMIT):
                # For uniqueness, ensure that (x1,y1) has a larger angle than (x2,y2)
                if y2 * x1 < y1 * x2 and is_right_triangle(x1, y1, x2, y2):
                    ans += 1
print(ans)
’

(Based on ‘this solution’[https://github.com/nayuki/Project-Euler-solutions/blob/master/python/p091.py?ts=4].)

} for solving ‘problem #91 of the Project Euler’[https://projecteuler.net/problem=91] is ~500 times faster (the Python → 11l → C++ transpiler vs CPython):
P‘./chart_pe91.png’
’
}’’’’

T‘‘‘><‘*‘[[[Install/]]]Download’

<>‘Here is the latest version of the Python → 11l → C++ transpiler: _‘11l.tar.xz[https://bitbucket.org/11l-lang/11l/downloads/11l.tar.xz]’ [‘source code repos’[https://github.com/11l-lang]].

Usage:
1. Unpack archive to whatever directory you [[[like/]]]want.
2. Open Terminal/cmd[[[ and change the current directory to the directory where archive was unpacked]]].
3.‘Run command:
`<path_to_unpacked_archive_files>\11l <source_python_or_11l_file>` on Windows, or
`<path_to_unpacked_archive_files>/11l <source_python_or_11l_file>` on Linux.’

!‘Having problems with [[[compiling/]]]transpiling your Python [[[or 11l ]]]program? Please read ‘this guide’[./guide].
And if you haven't found a solution there, then ‘write [[[on/]]]at the forum’[http://forum.11l-lang.org/forums/help.3/].’’
’’’’’
