>>‘\/‘‘(This page in English\Эта страница на английском)’[./..]’’

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


11l — это [[[‘сверхвысокоуровневый язык программирования’[https://ru.wikipedia.org/wiki/Сверхвысокоуровневый_язык_программирования]]термин не устоявшийся, и не стоит выпендриваться :)(:]]высокоуровневый язык программирования [[[универсальный/]]]общего назначения, [[[в то же время ]]]обеспечивающий простое и прямое отображение программы на аппаратную часть и стремящийся следовать принципу нулевых накладных расходов как C++ (неиспользуемые возможности языка не добавляют ‘накладных расходов времени выполнения[[[ программы]]]’[‘лишнее время выполнения/вычисления, часто сопровождающееся увеличением размера/длины скомпилированного/получаемого машинного кода’]). 11l — статически типизированный, но [[[даёт ощущение]]]ощущается как динамически типизируемый язык (как например Python)[[[ или даже скриптовый]]].
Дизайн 11l направлен на максимальную краткость и лаконичность.

Явное отличие 11l от всех других языков программирования заключается в том, что его [[[зарезервированные/]]]ключевые слова организованы в виде дерева, а не просто списка.
В корне этого дерева располагаются 11 базовых [[[зарезервированных/]]]ключевых слов, которые можно сокращать до [[[их первой]]]одной буквы. [Короткие однобуквенные [[[зарезервированные/]]]ключевые слова выглядят странно на первый взгляд, но это всего лишь дело привычки.]
‘Дерево всех [[[зарезервированных/]]]ключевых слов 11l[[[ [включая ещё не реализованные]]]][[[.]]]’{
```
── A/var\А/перем
── C/in\С
── I/if\Е/если ──┬── likely\часто
                 └── unlikely\редко
── E/else\И/иначе
── F/fn\Ф/фн ──┬── args\арг
               ├── destructor\деструктор
               └── virtual\виртуал ──┬── new\новая
                                     ├── override\переопр
                                     ├── final\финал
                                     └── abstract\абстракт
── L/loop\Ц/цикл ──┬── continue\продолжить
                   ├── break\прервать
                   ├── on_continue\при_продолжении
                   ├── on_break\при_прерывании
                   ├── was_no_break\не_был_прерван
                   ├── index\индекс
                   ├── next\след
                   └── prev\пред
── N/null\Н/нуль
── R/return\Р/вернуть
── S/switch\В/выбрать ──┬── break\прервать
                        └── fallthrough
── T/type\Т/тип ──┬── base\базовый
                  ├── enum\перечисл
                  └── interface\интерфейс
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
while (true)
{
    switch (instr[i])
    {
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
]]]'‘<pre style='color:#000000;background:#ffffff;'><span style='color:#0000FF'>while</span> <span style='color:#808030; '>(</span><span style='color:#0000FF'>true</span><span style='color:#808030; '>)</span>
<span style='color:#800080; '>{</span>
    <span style='color:#0000FF'>switch</span> <span style='color:#808030; '>(</span>instr<span style='color:#808030; '>[</span>i<span style='color:#808030; '>]</span><span style='color:#808030; '>)</span>
    <span style='color:#800080; '>{</span>
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
if not was_break:
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
                        or 'a' <= source[i] <= 'z'
                        or 'A' <= source[i] <= 'Z' or source[i] == '_'):
    i += 1

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
   I L.next
      res ‘’= ‘, ’

...

L(line) file.read_lines()
   A line_number = L.index + 1
   print(line_number‘. ’line)

...


L i < source.len & source[i] C (‘0’..‘9’, ‘a’..‘z’, ‘A’..‘Z’, ‘_’)
   i++


...

A key = S token.category
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

A width = active_window.rect. {.right - .left}

...

A dot_pos = token.value(source). {.find(‘.’) ? .len}


’’’’
T‘‘‘Python:
#(Python)‘
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
}


Документация[./../doc/ru]


‘Производительность’{
<>‘Транспайлер 11l можно использовать как ускоритель кода на Python.
Вот результаты для ‘программы преобразования пк-разметки в HTML’[https://bitbucket.org/pqmarkup/pqmarkup] (в качестве исходных данных был взят исходник ‘статьи по пк-разметке’[https://habr.ru/post/348218/]):
Р‘https://gist.githubusercontent.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/1c5e2435525a5da8221d4337d0ae8fa2ac4d63a4/chart2.png’
[‘Вот архив’[https://gist.github.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/e6cb2f07446ef4a19a3d6cdc1f8c483287ef1308/perf_tests.7z] с использовавшейся программой для сравнения производительности [под Windows] (требуются установленный Python 3.6 или выше и следующие Python-пакеты: pywin32, cython).]
’
}


‘[[[Установка/]]]Скачать’{
Т‘‘‘Вот последняя версия пары транспайлеров Python → 11l и 11l → C++: _‘11l.tar.xz[https://bitbucket.org/11l-lang/11l/downloads/11l.tar.xz]’ [‘репозитории с исходниками’[https://bitbucket.org/11l-lang]].

Использование:
1. Распакуйте архив в [[[директорию]]/]каталог по вашему выбору.
2. Откройте терминал/консоль/‘командную строку’.
3.‘Выполните команду:
`<путь_до_каталога_с_распакованным_архивом>\11l <исходный_файл_на_python_или_11l>` в Windows или
`<путь_до_каталога_с_распакованным_архивом>/11l <исходный_файл_на_python_или_11l>` в Linux.’

[Возникли [[[трудности/]]]проблемы с компиляцией вашей программы на Python или 11l? ‘Напишите на форуме.’[http://forum.11l-lang.org/forums/Помощь.7/]]’’’
}


[[[Русскоязычный форум \ English Forum]]]Форум[http://forum.11l-lang.org]
’
