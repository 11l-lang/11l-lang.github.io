[[[Н‘Язык программирования 11l’
]]]>>‘\/‘‘(This page in English\Эта страница на английском)’[./..]’’

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
С(4)‘```
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


11‘l’[‘‘l’ означает ‘litterae’ в латинском, ‘logos’ в греческом [в значении ‘слово’], либо ‘letters’ в английском’] — это [[[‘сверхвысокоуровневый язык программирования’[https://ru.wikipedia.org/wiki/Сверхвысокоуровневый_язык_программирования]]термин не устоявшийся, и не стоит выпендриваться :)(:]][[[высокоуровневый/]]]компилируемый язык программирования [[[универсальный/]]]общего назначения, [[[в то же время ]]]обеспечивающий простое и прямое отображение программы на аппаратную часть и стремящийся следовать принципу нулевых накладных расходов[[[конкретно речь о L.index, исключениях и виртуальных функциях]]] как C++ (неиспользуемые возможности языка не добавляют ‘накладных расходов времени выполнения[[[ программы]]]’[‘лишнее время выполнения/вычисления, часто сопровождающееся увеличением размера/длины скомпилированного/получаемого машинного кода’]). 11l — статически типизированный, но [[[даёт ощущение]]]ощущается как динамически типизируемый язык (как например Python)[[[ или даже скриптовый]]].
Дизайн 11l направлен на максимальную краткость и лаконичность.
Также 11l пытается совместить хорошую читаемость и выразительность кода (как в Python) с производительностью C++.

Явное отличие 11l от всех других языков программирования заключается в том, что его [[[зарезервированные/]]]ключевые слова организованы в виде дерева, а не просто списка.
В корне этого дерева располагаются 11 базовых [[[зарезервированных/]]]ключевых слов, которые можно сокращать до [[[их первой]]]одной буквы. [Короткие однобуквенные [[[зарезервированные/]]]ключевые слова выглядят странно на первый взгляд, но это всего лишь дело привычки.]
‘Дерево всех [[[зарезервированных/]]]ключевых слов 11l[[[ [включая ещё не реализованные]]]][[[.]]]’{
```
── C/in\С
── I/if\Е/если ──┬── likely\часто
                 └── unlikely\редко
── E/else\И/иначе
── F/fn\Ф/фн ──┬── args\арг
               ├── destructor\деструктор
               └── virtual\виртуал ──┬── new\новая
                                     ├── override\переопр
                                     ├── final\финал
                                     ├── abstract\абстракт
                                     └── assign\опред
── L/loop\Ц/цикл ──┬── continue\продолжить
                   ├── break\прервать
                   ├── remove_current_element_and_continue\удалить_текущий_элемент_и_продолжить
                   ├── remove_current_element_and_break\удалить_текущий_элемент_и_прервать
                   ├── on_continue\при_продолжении
                   ├── on_break\при_прерывании
                   ├── was_no_break\не_был_прерван
                   ├── index\индекс
                   ├── last_iteration\последняя_итерация
                   ├── next\след
                   └── prev\пред
── N/null\Н/нуль
── R/return\Р/вернуть
── S/switch\В/выбрать ──┬── break\прервать
                        └── fallthrough
── T/type\Т/тип ──┬── base\базовый
                  ├── enum\перечисл
                  └── interface\интерфейс
── V/var\П/перем
── X/exception\Х/исключение ──┬── try\контроль
                              ├── catch\перехват
                              └── try_end
```
}


><‘‘Примеры’{
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

for i in range(len(self.children)):
    res += self.children[i].to_str()
    if i < len(self.children)-1:
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

if source[lexem_start:lexem_start+3] == '(.)':
    i += 2
    category = Token.Category.NAME

...

load64(state[8*(x+5*y):8*(x+5*y)+8])

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

I source[lexem_start .+ 3] == ‘(.)’
   i += 2
   category = NAME

...

load64(state[8*(x+5*y) .+ 8])

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

’’’’
T‘‘‘#(Python)‘

main_window.pos.x = 10
main_window.pos.y = 20

...

width = active_window.rect.right - active_window.rect.left

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
‘algoprog.ru’{
‘Пересечение отрезков’[https://algoprog.ru/material/p280]:
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
‘Постройте квадрат’[https://algoprog.ru/material/p1349]:
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
‘Simple moving average’[https://www.rosettacode.org/wiki/Averages/Simple_moving_average#11l] | ‘Align columns’[https://www.rosettacode.org/wiki/Align_columns#11l] | ‘Arithmetic evaluation’[https://www.rosettacode.org/wiki/Arithmetic_evaluation#11l]
‘Comma quibbling’[https://www.rosettacode.org/wiki/Comma_quibbling#11l] | ‘Constrained random points on a circle’[https://www.rosettacode.org/wiki/Constrained_random_points_on_a_circle#11l] | CRC-32[https://www.rosettacode.org/wiki/CRC-32#11l]
‘Diversity prediction theorem’[https://www.rosettacode.org/wiki/Diversity_prediction_theorem#11l] | ‘Equilibrium index’[https://www.rosettacode.org/wiki/Equilibrium_index#11l] | ‘Fibonacci n-step number sequences’[https://www.rosettacode.org/wiki/Fibonacci_n-step_number_sequences#11l]
‘Find the intersection of a line with a plane’[https://www.rosettacode.org/wiki/Find_the_intersection_of_a_line_with_a_plane#11l] | ‘Find the last Sunday of each month’[https://www.rosettacode.org/wiki/Find_the_last_Sunday_of_each_month#11l]
‘Find the missing permutation’[https://www.rosettacode.org/wiki/Find_the_missing_permutation#11l] | ‘*‘Largest number divisible by its digits’’[https://www.rosettacode.org/wiki/Largest_number_divisible_by_its_digits#11l] | Menu[https://www.rosettacode.org/wiki/Menu#11l] | Modulinos[https://www.rosettacode.org/wiki/Modulinos#11l]
‘*‘Multifactorial’’[https://www.rosettacode.org/wiki/Multifactorial#11l] | JSON[https://www.rosettacode.org/wiki/JSON#11l] | ‘Palindrome dates’[https://www.rosettacode.org/wiki/Palindrome_dates#11l] | ‘Pangram checker’[https://www.rosettacode.org/wiki/Pangram_checker#11l] | ‘Prime conspiracy’[https://www.rosettacode.org/wiki/Prime_conspiracy#11l]
‘Pseudo-random numbers/Splitmix64’[https://www.rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64#11l] | ‘*‘_‘Ramer-Douglas-Peucker line simplification’’’[https://www.rosettacode.org/wiki/Ramer-Douglas-Peucker_line_simplification#11l ‘`...` в `append(RDP(l[:x+1], ε), RDP(l[x:], ε)[1:]...)`’]
‘Resistance calculator’[https://www.rosettacode.org/wiki/Resistance_calculator#11l] | ‘Resistor mesh’[https://www.rosettacode.org/wiki/Resistor_mesh#11l] | ‘*‘Sort a list of object identifiers’’[https://www.rosettacode.org/wiki/Sort_a_list_of_object_identifiers#11l]
‘URL decoding’[https://www.rosettacode.org/wiki/URL_decoding#11l] | ‘URL encoding’[https://www.rosettacode.org/wiki/URL_encoding#11l] | ‘UTF-8 encode and decode’[https://www.rosettacode.org/wiki/UTF-8_encode_and_decode#11l] | ‘*‘Word frequency’’[https://www.rosettacode.org/wiki/Word_frequency#11l]
‘Left factorials’[https://www.rosettacode.org/wiki/Left_factorials#11l] | ‘Successive prime differences’[https://www.rosettacode.org/wiki/Successive_prime_differences#11l] | Eertree[https://www.rosettacode.org/wiki/Eertree#11l] | ‘*‘Generator/Exponential’’[https://www.rosettacode.org/wiki/Generator/Exponential#11l]
‘Huffman coding’[https://www.rosettacode.org/wiki/Huffman_coding#11l] | ‘*‘_‘Inverted index’’’[https://www.rosettacode.org/wiki/Inverted_index#11l ‘`string[][string]`, `canFind`’] | ‘*‘_‘Poker hand analyser’’’[https://www.rosettacode.org/wiki/Poker_hand_analyser#11l ‘`release`, `countUntil`, `pure nothrow @safe @nogc`’] | ‘*‘_‘Patience sort’’’[https://www.rosettacode.org/wiki/Sorting_algorithms/Patience_sort#11l ‘`val minPile = ...` -> `V& minPile = ...`, `lastIndex`, `contentToString`, `val` vs `var`’] | Sudoku[https://www.rosettacode.org/wiki/Sudoku#11l]
Tic-tac-toe[https://www.rosettacode.org/wiki/Tic-tac-toe#11l] | Vector[https://www.rosettacode.org/wiki/Vector#11l] | ‘Calkin-Wilf sequence’[https://www.rosettacode.org/wiki/Calkin-Wilf_sequence#11l] | ‘Canonicalize CIDR’[https://www.rosettacode.org/wiki/Canonicalize_CIDR#11l] | ‘Change e letters to i in words’[https://www.rosettacode.org/wiki/Change_e_letters_to_i_in_words#11l]
‘Closures/Value capture’[https://www.rosettacode.org/wiki/Closures/Value_capture#11l] | ‘*‘Combinations with repetitions’’[https://www.rosettacode.org/wiki/Combinations_with_repetitions#11l] | ‘_‘Decision tables’’[https://www.rosettacode.org/wiki/Decision_tables#11l ‘`"  ${conditions[c].first} ? "`’]
‘Elementary cellular automaton’[https://www.rosettacode.org/wiki/Elementary_cellular_automaton#11l]
[‘Все примеры на Rosetta Code’[https://www.rosettacode.org/wiki/Category:11l]]
}
}


T‘‘‘Документация[./../doc/ru]’’’

T‘‘‘><‘‘Производительность’{

<>‘Транспайлер 11l можно использовать как ускоритель кода на Python.
Вот результаты для ‘программы преобразования пк-разметки в HTML’[https://sourceforge.net/p/pqmarkup/code/ <- https://bitbucket.org/pqmarkup/pqmarkup] (в качестве исходных данных был взят исходник ‘статьи по пк-разметке’[https://habr.ru/post/348218/]):
Р‘https://gist.githubusercontent.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/1c5e2435525a5da8221d4337d0ae8fa2ac4d63a4/chart2.png’
[‘Вот архив’[https://gist.github.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/e6cb2f07446ef4a19a3d6cdc1f8c483287ef1308/perf_tests.7z] с использовавшейся программой для сравнения производительности [под Windows] (требуются установленный Python 3.6 или выше и следующие Python-пакеты: pywin32, cython).]
’
}’’’’

T‘‘‘><‘‘[[[Установка/]]]Скачать’{

<>‘Вот последняя версия пары транспайлеров Python → 11l и 11l → C++: _‘11l.tar.xz[https://bitbucket.org/11l-lang/11l/downloads/11l.tar.xz]’ [‘репозитории с исходниками’[https://github.com/11l-lang]].

Использование:
1. Распакуйте архив в [[[директорию]]/]каталог по вашему выбору.
2. Откройте терминал/консоль/‘командную строку’.
3.‘Выполните команду:
`<путь_до_каталога_с_распакованным_архивом>\11l <исходный_файл_на_python_или_11l>` в Windows или
`<путь_до_каталога_с_распакованным_архивом>/11l <исходный_файл_на_python_или_11l>` в Linux.’

[Возникли [[[трудности/]]]проблемы с компиляцией вашей программы на Python или 11l? ‘Напишите на форуме.’[http://forum.11l-lang.org/forums/Помощь.7/]]’
}’’’’

T‘‘‘[[[Русскоязычный форум \ English Forum]]]Форум[http://forum.11l-lang.org]’’’

T‘‘‘><‘‘Статьи’{
<<‘
. ‘Статья на Хабре ‘‘Каркас нового языка программирования’’’[https://habr.com/ru/post/350694/]
. ‘Статья на Хабре ‘‘Транспайлер-цепь Python → 11l → C++ [для ускорения Python-кода и не только]’’’[https://habr.com/ru/post/431318/]
. Разработка когнитивно-эргономического синтаксиса для нового аппаратно-ориентированного языка программирования (скачать статью можно отсюда[http://forum.11l-lang.org/threads/Разработка-когнитивно-эргономического-синтаксиса-для-нового-аппаратно-ориентированного-языка-программирования.8/#post-11])
’
}’’’’
’
