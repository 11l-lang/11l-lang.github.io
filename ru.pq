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

Явное отличие 11l от всех других языков программирования заключается в том, что его зарезервированные слова организованы в виде дерева, а не просто списка.
В корне этого дерева располагаются 11 базовых зарезервированных слов, которые можно сокращать до [[[их первой]]]одной буквы. [Короткие однобуквенные зарезервированные слова выглядят странно на первый взгляд, но это всего лишь дело привычки.]
‘Дерево всех зарезервированных слов 11l.’{
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
── T/type\Т/тип ──┬── super\базовый
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
}


Документация


Установка


Русскоязычный форум \ English Forum
’
