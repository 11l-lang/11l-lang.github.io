[[[H‘11l Programming Language’
]]]>>‘\/‘‘(Эта страница на русском\This page in Russian)’[./ru]’’

><‘'‘<table><tr><td style="border: 0; padding: 0">’'
\/‘\/‘\/‘\/‘\/‘
```
    ████
      ██
      ██
      ██
      ██
      ██
      ██
  ██████████
```
’’’’’
'‘<td style="border: 0; padding: 0">’'
\/‘\/‘\/‘\/‘\/‘
```
    ████
      ██
      ██
      ██
      ██
      ██
      ██
  ██████████
```
’’’’’
'‘<td style="border: 0; padding: 0">’'
\/‘\/‘\/‘\/‘\/‘
C(5)‘```
    ████
      ██
      ██
      ██
      ██
      ██
      ██
  ██████████
```’
’’’’’
'‘</table>’'’
[[[><‘H‘About’’]]]

11‘l’[‘‘l’ [[[means/]]]stands for ‘litterae’ in Latin, ‘logos’ in Greek [meaning ‘word’], or ‘letters’ in English’] [[[— ]]]is a [semi-esoteric] [[[‘very high-level’[https://en.wikipedia.org/wiki/Very_high-level_programming_language]]this term is unclear]][[[high-level/]]]compiled [[[universal/]]]general-purpose programming language, [[[at the same time providing]]]which provides a simple and direct mapping to hardware and [[[aims/]
>[https://en.wikipedia.org/wiki/Lua_(programming_language) <- [./c.txt:‘правда не на JS, а на Lua и C++’]]:‘
In general, Lua strives to provide simple, flexible meta-features...’
]]strives to[[[/at]]] follow[[[ing]]] a zero-overhead principle, like C++ (unused language features do not add ‘run-time overhead’[‘excess computation time, oftentimes combined with the additional length of a compiled machine code’]). 11l is statically typed, but [[[smells]]]feels very much like a dynamically typed language (e.g. Python)[[[ or even scripting language]]].
The design of 11l is aimed to achieve as much conciseness as possible[[[, and to reconsider all programming language elements]]].
Also 11l tries to combine [[[expressiveness/]]]a good code readability of Python {and ‘as Python’[https://stackoverflow.com/a/3965129/2692494]: good 11l is often close to good pseudocode} [[[and/]]]with speed/performance of C++ {
>[https://www.stroustrup.com/quotes.html <- https://en.wikipedia.org/wiki/C++][-1]:‘C++ semantics is much cleaner than its syntax.’
>[-1]:‘Within C++, there is a much smaller and cleaner language struggling to get out’
And 11l tries to be such a ‘smaller and cleaner language’.
}.

The evident distinction of 11l from all other existing programming languages is its keywords are organized in a tree, not just a list.
There are 11 keywords at the root of that tree, and each word can be written as [[[its first]]]one letter. [Short one-letter keywords look odd at first sight, but it's just a matter of habit.]
‘Tree of all 11l keywords [including few not implemented yet][[[.]]]’{
```
── C/in
── I/if ──┬── likely
          └── unlikely
── E/else
── F/fn ──┬── args
          ├── result
          ├── destructor
          └── virtual ──┬── new
                        ├── override
                        ├── final
                        ├── abstract
                        └── assign
── L/loop ──┬── continue
            ├── break
            ├── remove_current_element_and_continue
            ├── remove_current_element_and_break
            ├── on_continue
            ├── on_break
            ├── was_no_break
            ├── index
            ├── first_iteration
            ├── last_iteration
            ├── next
            └── prev
── N/null
── R/return
── S/switch ──┬── break
              └── fallthrough
── T/type ──┬── base
            ├── enum
            └── interface
── V/var
── X/exception ──┬── handle
                 ├── throw
                 ├── try
                 ├── catch
                 └── try_end
```
}


><‘‘Samples’{
T‘><‘‘Python’ ‘11l’ ‘C++’’
‘‘[[[
while True:
    if instr[i] == "[":
        nesting_level += 1
    elif instr[i] == "]":
        nesting_level -= 1
        if nesting_level == 0:
            break
    i += 1
]http://highlight.hohli.com/]https://tohtml.com:]'‘<pre style='color:#000000;background:#ffffff;'><span style='color:#0000FF'>while</span> <span style='color:#074726; '>True</span><span style='color:#808030; '>:</span>
    <span style='color:#0000FF'>if</span> instr<span style='color:#808030; '>[</span>i<span style='color:#808030; '>]</span> <span style='color:#44aadd; '>==</span> <span style='color:#800000; '>"["</span><span style='color:#808030; '>:</span>
        nesting_level <span style='color:#44aadd; '>+</span><span style='color:#808030; '>=</span> <span style='color:#008c00; '>1</span>
    <span style='color:#0000FF'>elif</span> instr<span style='color:#808030; '>[</span>i<span style='color:#808030; '>]</span> <span style='color:#44aadd; '>==</span> <span style='color:#800000; '>"]"</span><span style='color:#808030; '>:</span>
        nesting_level <span style='color:#44aadd; '>-</span><span style='color:#808030; '>=</span> <span style='color:#008c00; '>1</span>
        <span style='color:#0000FF'>if</span> nesting_level <span style='color:#44aadd; '>==</span> <span style='color:#008c00; '>0</span><span style='color:#808030; '>:</span>
            <span style='color:#0000FF'>break</span>
    i <span style='color:#44aadd; '>+</span><span style='color:#808030; '>=</span> <span style='color:#008c00; '>1</span>
</pre>’'’
‘Р‘https://raw.githubusercontent.com/alextretyak/3/master/codesample.png’’
‘[[[
while (true) {
    switch (instr[i]) {
    case '[':
        nesting_level++;
        break;
    case ']':
        if (--nesting_level == 0)
            goto break_;
        break;
    }
    i++;
    ...
}
break_:
]]]'‘<pre style='color:#000000;background:#ffffff;'><span style='color:#0000FF'>while</span> <span style='color:#808030; '>(</span><span style='color:#0000FF'>true</span><span style='color:#808030; '>)</span> <span style='color:#800080; '>{</span>
    <span style='color:#0000FF'>switch</span> <span style='color:#808030; '>(</span>instr<span style='color:#808030; '>[</span>i<span style='color:#808030; '>]</span><span style='color:#808030; '>)</span> <span style='color:#800080; '>{</span>
    <span style='color:#0000FF'>case </span><span style='color:#800000; '>'['</span><span style='color:#e34adc; '>:</span>
        nesting_level<span style='color:#808030; '>+</span><span style='color:#808030; '>+</span><span style='color:#800080; '>;</span>
        <span style='color:#0000FF'>break</span><span style='color:#800080; '>;</span>
    <span style='color:#0000FF'>case </span><span style='color:#800000; '>']'</span><span style='color:#e34adc; '>:</span>
        <span style='color:#0000FF'>if</span> <span style='color:#808030; '>(</span><span style='color:#808030; '>-</span><span style='color:#808030; '>-</span>nesting_level <span style='color:#808030; '>=</span><span style='color:#808030; '>=</span> <span style='color:#008c00; '>0</span><span style='color:#808030; '>)</span>
            <span style='color:#0000FF; '>goto</span> <span style='color:#e34adc; '>break_</span><span style='color:#800080; '>;</span>
        <span style='color:#0000FF'>break</span><span style='color:#800080; '>;</span>
    <span style='color:#800080; '>}</span>
    i<span style='color:#808030; '>+</span><span style='color:#808030; '>+</span><span style='color:#800080; '>;</span>
    ...
}
<span style='color:#e34adc; '>break_</span>:
</pre>’'’’’
T‘><‘‘Python’ ‘11l’’
‘‘#(Python)‘
was_break = False
for i in range(1, len(self.children), 2):
    if self.children[i].token.value(source) in ('E', 'И', 'else', 'иначе'):
        res += char_or_str(self.children[i+1], char_val)
        was_break = True
        break
    res += 'a == ' + char_or_str(self.children[i], char_key) \
           + ' ? ' + char_or_str(self.children[i+1], char_val) + ' : '
if not was_break: # or else:
    res += 'throw KeyError(a)'

...

for child in self.children:
    res += child.to_str()
    if child is not self.children[-1]:
        res += ', '

...

for line_number, line in enumerate(file.readlines(), 1):
    print(str(line_number) + '. ' + line.rstrip("\n"))


...

while i < len(source) and ('0' <= source[i] <= '9'
                        or 'a' <= source[i] <= 'f'
                        or 'A' <= source[i] <= 'F' or source[i] == '_'):
    i += 1

...

load64(state[8*(x+5*y):8*(x+5*y)+8])

...

elif i_next_str(":‘") and instr[find_ending_pair_quote(i+2)+1: # ’
                                find_ending_pair_quote(i+2)+2] == '<':
    ...
...

if i+1 < len(source) and source[i+1] == '\\':
    ...
...

if source[lexem_start:lexem_start+3] == '(.)':
    i += 2
    category = Token.Category.NAME

...

if token.category in (Token.Category.NUMERIC_LITERAL,
                      Token.Category.STRING_LITERAL):
    key = '(literal)'
elif token.category == Token.Category.NAME:
    key = '(name)'
elif token.category == Token.Category.CONSTANT:
    key = '(constant)'
elif token.category in (Token.Category.STATEMENT_SEPARATOR,
                        Token.Category.DEDENT):
    key = ';'
else:
    key = token.value(source)

...

import csv
for row in csv.reader(open('data.csv', newline = '', encoding = 'utf-8')):
    ...
’’ ‘#(11l)‘

L(i) (1 .< .children.len).step(2)
   I .children[i].token.value(source) C (‘E’, ‘И’, ‘else’, ‘иначе’)
      res ‘’= char_or_str(.children[i+1], char_val)
      L.break
   res ‘’= ‘a == ’char_or_str(.children[i], char_key)‘ ? ’
                ‘’char_or_str(.children[i+1], char_val)‘ : ’

L.was_no_break
   res ‘’= ‘throw KeyError(a)’

...

L(child) .children
   res ‘’= child.to_str()
   I !L.last_iteration
      res ‘’= ‘, ’

...

L(line) file.read_lines()
   V line_number = L.index + 1
   print(line_number‘. ’line)

...


L i < source.len & source[i] C (‘0’..‘9’, ‘a’..‘f’, ‘A’..‘F’, ‘_’)
   i++


...

load64(state[8*(x+5*y) .+ 8])

...

E I i_next_str(":‘") & // ’
    instr[find_ending_pair_quote(i+2)+1 .+ 1] == ‘<’
   ...
...

I source[i+1.+1] == ‘\’
   ...
...

I source[lexem_start .+ 3] == ‘(.)’
   i += 2
   category = NAME

...

V key = S token.category
   NUMERIC_LITERAL, STRING_LITERAL
      ‘(literal)’
   NAME
      ‘(name)’
   CONSTANT
      ‘(constant)’
   STATEMENT_SEPARATOR, DEDENT
      ‘;’
   E
      token.value(source)


...


L(row) csv:read(‘data.csv’)
   ...
’’’’
T‘‘‘#(Python)‘

main_window.pos.x = 10
main_window.pos.y = 20

...

width = active_window.rect.right - active_window.rect.left

...

infile.seek(8, os.SEEK_CUR)

...

dot_pos = token.value(source).find('.')
if dot_pos == -1:
    dot_pos = len(token.value(source))
’’
‘#(11l)‘
main_window.pos.
   .x = 10
   .y = 20

...

V width = active_window.rect. {.right - .left}

...

infile. .seek(.tell() + 8)

...

V dot_pos = token.value(source). {.find(‘.’) ? .len}


’’’’
T‘‘‘Python:
#(Python)‘
import os

for root, dirs, files in os.walk('.'):
    dirs[:] = [d for d in dirs if d[0] != '.'] # exclude hidden folders (e.g. `.hg`)
    for name in files:
        if name.endswith(('.py', '.txt')):
            file_bytes = open(os.path.join(root, name), 'rb').read()
            if b"\r" in file_bytes or b"\t" in file_bytes:
                print(R"Unallowed character (\r or \t) found in file '" + os.path.join(root, name)[2:] + "'")
’
’’‘‘11l:
#(11l)‘
L(fname) fs:walk_dir(‘.’, dir_filter' d -> d[0] != ‘.’)
   I fname.ends_with((‘.py’, ‘.txt’)) & File(fname).read_bytes().find(("\r".code, "\t".code)) != N
      print(‘Unallowed character (\r or \t) found in file '’fname[2..]‘'’)
’
’’’
‘informatics.msk.ru’{
‘Intersecting line segments’[https://translate.google.com/translate?hl=&sl=ru&tl=en&u=https://informatics.msk.ru/mod/statements/view.php?chapterid=280]:
T‘><‘‘Python’ ‘11l’’
‘‘#(Python)‘
(p1x, p1y, p2x, p2y) = map(int, input().split())
(m1x, m1y, m2x, m2y) = map(int, input().split())

def point_belongs_to_segment(px, py, sx, sy, ex, ey):
    return (ex - sx)*(py - sy) - (ey - sy)*(px - sx) == 0 \
       and (sx - px)*(ex - px) + (sy - py)*(ey - py) <= 0

def cross(v0x, v0y, v1x, v1y):
    return v0x * v1y - v0y * v1x


if point_belongs_to_segment(p1x, p1y, m1x, m1y, m2x, m2y) or \
   point_belongs_to_segment(p2x, p2y, m1x, m1y, m2x, m2y) or \
   point_belongs_to_segment(m1x, m1y, p1x, p1y, p2x, p2y) or \
   point_belongs_to_segment(m2x, m2y, p1x, p1y, p2x, p2y) or \
   (cross(p2x - p1x, p2y - p1y, m2x - p1x, m2y - p1y)
  * cross(p2x - p1x, p2y - p1y, m1x - p1x, m1y - p1y) < 0 and
    cross(m2x - m1x, m2y - m1y, p1x - m1x, p1y - m1y)
  * cross(m2x - m1x, m2y - m1y, p2x - m1x, p2y - m1y) < 0):
    print('YES')
else:
    print('NO')
’’ ‘#(11l)‘
V (p1x, p1y, p2x, p2y) = input().split(‘ ’).map(Int)
V (m1x, m1y, m2x, m2y) = input().split(‘ ’).map(Int)
V p1 = (p1x, p1y)
V p2 = (p2x, p2y)
V m1 = (m1x, m1y)
V m2 = (m2x, m2y)

F point_belongs_to_segment(p, s, e)
   R cross(e - s, p - s) == 0
     & dot(s - p, e - p) <= 0

I point_belongs_to_segment(p1, m1, m2) |
  point_belongs_to_segment(p2, m1, m2) |
  point_belongs_to_segment(m1, p1, p2) |
  point_belongs_to_segment(m2, p1, p2) |
  (cross(p2 - p1, m2 - p1)
 * cross(p2 - p1, m1 - p1) < 0 &
   cross(m2 - m1, p1 - m1)
 * cross(m2 - m1, p2 - m1) < 0)
   print(‘YES’)
E
   print(‘NO’)
’’’
’
‘Build a square’[https://translate.google.com/translate?hl=&sl=ru&tl=en&u=https://informatics.msk.ru/mod/statements/view.php?chapterid=1349]:
T‘><‘‘Python’ ‘11l’’
‘‘#(Python)‘
(ax, ay, bx, by) = map(int, input().split())

abx = bx - ax
aby = by - ay

perp_abx = -aby
perp_aby = abx

acx = (abx + perp_abx) / 2
acy = (aby + perp_aby) / 2

adx = (abx - perp_abx) / 2
ady = (aby - perp_aby) / 2

print(ax + acx, ay + acy, ax + adx, ay + ady)
’’ ‘#(11l)‘
V (ax, ay, bx, by) = input().split(‘ ’).map(Int)
V a = (ax, ay)
V b = (bx, by)
V ab = b - a

V perp_ab = perp(ab)


V ac = (ab + perp_ab) / 2


V ad = (ab - perp_ab) / 2

print_elements(a + ac, end' ‘ ’)
print_elements(a + ad)
’’’
’
}
‘Rosetta Code’{
‘Benford's law’[https://www.rosettacode.org/wiki/Benford%27s_law]:
T‘‘
‘#(11l)‘
F get_fibs()
   V a = 1.0
   V b = 1.0
   [Float] r
   L 1000
      r [+]= a
      (a, b) = (b, a + b)
   R r

F benford(seq)
   V freqs = [(0.0, 0.0)] * 9
   V seq_len = 0
   L(d) seq
      I d != 0
         freqs[String(d)[0].code - ‘1’.code][1]++
         seq_len++

   L(&f) freqs
      f = (log10(1.0 + 1.0 / (L.index + 1)), f[1] / seq_len)
   R freqs

print(‘#9 #9 #9’.format(‘Actual’, ‘Expected’, ‘Deviation’))

L(p) benford(get_fibs())
   print(‘#.: #2.2% | #2.2% | #.4%’.format(L.index + 1, p[1] * 100, p[0] * 100, abs(p[1] - p[0]) * 100))’
’’’
‘Caesar cipher’[https://www.rosettacode.org/wiki/Caesar_cipher]:
T‘‘
‘#(11l)‘
F caesar(string, =key, decode = 0B)
   I decode
      key = 26 - key

   V r = ‘ ’ * string.len
   L(c) string
      r[L.index] = S c
                      ‘a’..‘z’
                         Char(code' (c.code - ‘a’.code + key) % 26 + ‘a’.code)
                      ‘A’..‘Z’
                         Char(code' (c.code - ‘A’.code + key) % 26 + ‘A’.code)
                      E
                         c
   R r’
’’’
‘Gaussian elimination’[https://www.rosettacode.org/wiki/Gaussian_elimination]:
T‘
><‘‘C’ ‘11l’’
‘‘#(C)‘
void swap_row(double *a, double *b, int r1, int r2, int n)
{
    double tmp, *p1, *p2;
    int i;

    if (r1 == r2) return;
    for (i = 0; i < n; i++) {
        p1 = mat_elem(a, r1, i, n);
        p2 = mat_elem(a, r2, i, n);
        tmp = *p1, *p1 = *p2, *p2 = tmp;
    }
    tmp = b[r1], b[r1] = b[r2], b[r2] = tmp;
}

...
’’ ‘#(11l)‘
F swap_row(&a, &b, r1, r2)
   I r1 != r2
      swap(&a[r1], &a[r2])
      swap(&b[r1], &b[r2])










...
’’’
’
‘Loops/Nested’[https://www.rosettacode.org/wiki/Loops/Nested]:
T‘‘
‘#(11l)‘
[[Int]] mat
L 10
   mat [+]= (1..10).map(x -> random:(1..20))

L(row) mat
   L(el) row
      print(el, end' ‘ ’)
      I el == 20
         L(row).break
’
’’’
‘100 doors’[https://www.rosettacode.org/wiki/100_doors#11l] | ‘Visualize a tree’[https://www.rosettacode.org/wiki/Visualize_a_tree#11l] | ‘Execute Brain****’[https://www.rosettacode.org/wiki/Execute_Brain****#11l]
‘Simple moving average’[https://www.rosettacode.org/wiki/Averages/Simple_moving_average#11l] | ‘Align columns’[https://www.rosettacode.org/wiki/Align_columns#11l] | ‘*‘Arithmetic evaluation’’[https://www.rosettacode.org/wiki/Arithmetic_evaluation#11l]
‘Comma quibbling’[https://www.rosettacode.org/wiki/Comma_quibbling#11l] | ‘Constrained random points on a circle’[https://www.rosettacode.org/wiki/Constrained_random_points_on_a_circle#11l] | CRC-32[https://www.rosettacode.org/wiki/CRC-32#11l]
‘Diversity prediction theorem’[https://www.rosettacode.org/wiki/Diversity_prediction_theorem#11l] | ‘Equilibrium index’[https://www.rosettacode.org/wiki/Equilibrium_index#11l] | ‘Fibonacci n-step number sequences’[https://www.rosettacode.org/wiki/Fibonacci_n-step_number_sequences#11l]
‘Find the intersection of a line with a plane’[https://www.rosettacode.org/wiki/Find_the_intersection_of_a_line_with_a_plane#11l] | ‘Find the last Sunday of each month’[https://www.rosettacode.org/wiki/Find_the_last_Sunday_of_each_month#11l]
‘Find the missing permutation’[https://www.rosettacode.org/wiki/Find_the_missing_permutation#11l] | ‘*‘Largest number divisible by its digits’’[https://www.rosettacode.org/wiki/Largest_number_divisible_by_its_digits#11l] | Menu[https://www.rosettacode.org/wiki/Menu#11l] | Modulinos[https://www.rosettacode.org/wiki/Modulinos#11l]
‘*‘Multifactorial’’[https://www.rosettacode.org/wiki/Multifactorial#11l] | JSON[https://www.rosettacode.org/wiki/JSON#11l] | ‘Palindrome dates’[https://www.rosettacode.org/wiki/Palindrome_dates#11l] | ‘Pangram checker’[https://www.rosettacode.org/wiki/Pangram_checker#11l] | ‘Prime conspiracy’[https://www.rosettacode.org/wiki/Prime_conspiracy#11l]
‘Pseudo-random numbers/Splitmix64’[https://www.rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64#11l] | ‘*‘_‘Ramer-Douglas-Peucker line simplification’’’[https://www.rosettacode.org/wiki/Ramer-Douglas-Peucker_line_simplification#11l ‘`...` in `append(RDP(l[:x+1], ε), RDP(l[x:], ε)[1:]...)`’]
‘Resistance calculator’[https://www.rosettacode.org/wiki/Resistance_calculator#11l] | ‘Resistor mesh’[https://www.rosettacode.org/wiki/Resistor_mesh#11l] | ‘*‘Sort a list of object identifiers’’[https://www.rosettacode.org/wiki/Sort_a_list_of_object_identifiers#11l]
‘URL decoding’[https://www.rosettacode.org/wiki/URL_decoding#11l] | ‘URL encoding’[https://www.rosettacode.org/wiki/URL_encoding#11l] | ‘UTF-8 encode and decode’[https://www.rosettacode.org/wiki/UTF-8_encode_and_decode#11l] | ‘*‘Word frequency’’[https://www.rosettacode.org/wiki/Word_frequency#11l]
‘Left factorials’[https://www.rosettacode.org/wiki/Left_factorials#11l] | ‘Successive prime differences’[https://www.rosettacode.org/wiki/Successive_prime_differences#11l] | Eertree[https://www.rosettacode.org/wiki/Eertree#11l] | ‘*‘Generator/Exponential’’[https://www.rosettacode.org/wiki/Generator/Exponential#11l]
‘Huffman coding’[https://www.rosettacode.org/wiki/Huffman_coding#11l] | ‘*‘_‘Inverted index’’’[https://www.rosettacode.org/wiki/Inverted_index#11l ‘`string[][string]`, `canFind`’] | ‘*‘_‘Poker hand analyser’’’[https://www.rosettacode.org/wiki/Poker_hand_analyser#11l ‘`release`, `countUntil`, `pure nothrow @safe @nogc`’] | ‘*‘_‘Patience sort’’’[https://www.rosettacode.org/wiki/Sorting_algorithms/Patience_sort#11l ‘`val minPile = ...` -> `V& minPile = ...`, `lastIndex`, `contentToString`, `val` vs `var`’] | Sudoku[https://www.rosettacode.org/wiki/Sudoku#11l]
Tic-tac-toe[https://www.rosettacode.org/wiki/Tic-tac-toe#11l] | Vector[https://www.rosettacode.org/wiki/Vector#11l] | ‘Calkin-Wilf sequence’[https://www.rosettacode.org/wiki/Calkin-Wilf_sequence#11l] | ‘Canonicalize CIDR’[https://www.rosettacode.org/wiki/Canonicalize_CIDR#11l] | ‘Change e letters to i in words’[https://www.rosettacode.org/wiki/Change_e_letters_to_i_in_words#11l]
‘Closures/Value capture’[https://www.rosettacode.org/wiki/Closures/Value_capture#11l] | ‘*‘Combinations with repetitions’’[https://www.rosettacode.org/wiki/Combinations_with_repetitions#11l] | ‘_‘Decision tables’’[https://www.rosettacode.org/wiki/Decision_tables#11l ‘`"  ${conditions[c].first} ? "`’]
‘Elementary cellular automaton’[https://www.rosettacode.org/wiki/Elementary_cellular_automaton#11l] | ‘Find if a point is within a triangle’[https://www.rosettacode.org/wiki/Find_if_a_point_is_within_a_triangle#11l] | ‘_‘Hilbert curve’’[https://www.rosettacode.org/wiki/Hilbert_curve#11l ‘`row.idup`’]
‘_‘Kronecker product based fractals’’[https://www.rosettacode.org/wiki/Kronecker_product_based_fractals#11l ‘`newSeqWith(a.len * b.len, newSeq[T](a[0].len * b[0].len))`, `range[0..1]`, `@[@[...]]`’] | ‘_‘Loops/Wrong ranges’’[https://www.rosettacode.org/wiki/Loops/Wrong_ranges#11l ‘`($toSeq(...))[1..^1]`’] | MD5/Implementation[https://www.rosettacode.org/wiki/MD5/Implementation#11l]
‘Modified random distribution’[https://www.rosettacode.org/wiki/Modified_random_distribution#11l] | ‘Simple database’[https://www.rosettacode.org/wiki/Simple_database#11l] | ‘Smallest square that begins with n’[https://www.rosettacode.org/wiki/Smallest_square_that_begins_with_n#11l]
‘Tree datastructures’[https://www.rosettacode.org/wiki/Tree_datastructures#11l] | ‘Camel case and snake case’[https://www.rosettacode.org/wiki/Camel_case_and_snake_case#11l] | ‘*‘Sierpinski square curve’’[https://www.rosettacode.org/wiki/Sierpinski_square_curve#11l] | Wordiff[https://www.rosettacode.org/wiki/Wordiff#11l]
‘*‘Balanced ternary’’[https://rosettacode.org/wiki/Balanced_ternary#11l] | ‘Find words which contain the most consonants’[https://rosettacode.org/wiki/Find_words_which_contain_the_most_consonants#11l] | ‘*‘Marching squares’’[https://rosettacode.org/wiki/Marching_squares#11l]
[‘All examples at Rosetta Code’[https://www.rosettacode.org/wiki/Category:11l]]
}
}


T‘‘‘Documentation[./doc]’’’

T‘‘‘><‘‘Performance’{

<>‘The Python → 11l → C++ transpiler can be used to accelerate Python code.
Here is results for ‘pqmarkup to HTML converter’[https://sourceforge.net/p/pqmarkup/code/ci/default/tree/pqmarkup.py <- https://sourceforge.net/p/pqmarkup/code/ <- https://bitbucket.org/pqmarkup/pqmarkup] (as an input data the source of ‘this article’[https://habr.ru/post/348218/] is taken):
P‘https://gist.githubusercontent.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/da5d89013d3915dd2f4f14d011007d4adfea0e02/chart2.png’
(Shed Skin is not listed here because it does not support nested functions.)
[‘Here is an archive’[https://gist.github.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/e6cb2f07446ef4a19a3d6cdc1f8c483287ef1308/perf_tests.7z] with testing program used (Python 3.6 or higher is required, and following Python packages: pywin32, cython).]

[[[And ]]]This is the results for a ‘Prime number’[https://translate.google.com/translate?hl=&sl=ru&tl=en&u=https://informatics.msk.ru/mod/statements/view.php?chapterid=973] problem (with K = 1000000):
P‘./transpiler/chart_prime.png’
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
# Copyright (c) Project Nayuki. All rights reserved. Modified with permission.

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
P‘./transpiler/chart_pe91.png’
’
}’’’’

T‘‘‘><‘‘[[[Install/]]]Download’{

<>‘Here is the latest version of transpiler-pair Python → 11l and 11l → C++: _‘11l.tar.xz[https://bitbucket.org/11l-lang/11l/downloads/11l.tar.xz]’ [‘source code repos’[https://github.com/11l-lang]].

Usage:
1. Unpack archive to whatever directory you [[[like/]]]want.
2. Open Terminal/cmd[[[ and change the current directory to the directory where archive was unpacked]]].
3.‘Run command:
`<path_to_unpacked_archive_files>\11l <source_python_or_11l_file>` on Windows, or
`<path_to_unpacked_archive_files>/11l <source_python_or_11l_file>` on Linux.’

!‘Having problems with compiling your Python or 11l program? Please read ‘this guide’[./transpiler/guide].
And if you haven't found a solution there, then ‘write [[[on/]]]at the forum’[http://forum.11l-lang.org/forums/help.3/].’’
}’’’’

T‘‘‘[[[English Forum \ Русскоязычный форум]]]Forum[http://forum.11l-lang.org]’’’

T‘‘‘><‘‘Articles’{
<<‘
. ‘Article on Habr ‘‘Lexical Analysis in 11l’’’[https://habr.com/en/articles/663872/]
’
}’’’’
’
