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
‘‘[[[
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
    print(str(line_number) + '. ' + line)


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
]]]'‘<style>
span.keyword {color: #0000FF; font-weight: bold;}
span.identifier {color: #00009F;}
span.string-literal {color: #800000;}
span.numeric-literal {color: #008000;}
span.constant {color: #008000;}
span.comment {color: #808080;}
</style><pre>
<span class="identifier">was_break</span> = <span class="constant">False</span>
<span class="keyword">for</span> <span class="identifier">i</span> <span class="keyword">in</span> <span class="identifier">range</span>(<span class="numeric-literal">1</span>, <span class="identifier">len</span>(<span class="identifier">self</span>.<span class="identifier">children</span>), <span class="numeric-literal">2</span>):
    <span class="keyword">if</span> <span class="identifier">self</span>.<span class="identifier">children</span>[<span class="identifier">i</span>].<span class="identifier">token</span>.<span class="identifier">value</span>(<span class="identifier">source</span>) <span class="keyword">in</span> (<span class="string-literal">'E'</span>, <span class="string-literal">'И'</span>, <span class="string-literal">'else'</span>, <span class="string-literal">'иначе'</span>):
        <span class="identifier">res</span> += <span class="identifier">char_or_str</span>(<span class="identifier">self</span>.<span class="identifier">children</span>[<span class="identifier">i</span>+<span class="numeric-literal">1</span>], <span class="identifier">char_val</span>)
        <span class="identifier">was_break</span> = <span class="constant">True</span>
        <span class="keyword">break</span>
    <span class="identifier">res</span> += <span class="string-literal">'a == '</span> + <span class="identifier">char_or_str</span>(<span class="identifier">self</span>.<span class="identifier">children</span>[<span class="identifier">i</span>], <span class="identifier">char_key</span>) \
           + <span class="string-literal">' ? '</span> + <span class="identifier">char_or_str</span>(<span class="identifier">self</span>.<span class="identifier">children</span>[<span class="identifier">i</span>+<span class="numeric-literal">1</span>], <span class="identifier">char_val</span>) + <span class="string-literal">' : '</span>
<span class="keyword">if</span> <span class="keyword">not</span> <span class="identifier">was_break</span>:
    <span class="identifier">res</span> += <span class="string-literal">'throw KeyError(a)'</span>

...

<span class="keyword">for</span> <span class="identifier">i</span> <span class="keyword">in</span> <span class="identifier">range</span>(<span class="identifier">len</span>(<span class="identifier">self</span>.<span class="identifier">children</span>)):
    <span class="identifier">res</span> += <span class="identifier">self</span>.<span class="identifier">children</span>[<span class="identifier">i</span>].<span class="identifier">to_str</span>()
    <span class="keyword">if</span> <span class="identifier">i</span> < <span class="identifier">len</span>(<span class="identifier">self</span>.<span class="identifier">children</span>)-<span class="numeric-literal">1</span>:
        <span class="identifier">res</span> += <span class="string-literal">', '</span>

...

<span class="keyword">for</span> <span class="identifier">line_number</span>, <span class="identifier">line</span> <span class="keyword">in</span> <span class="identifier">enumerate</span>(<span class="identifier">file</span>.<span class="identifier">readlines</span>(), <span class="numeric-literal">1</span>):
    <span class="identifier">print</span>(<span class="identifier">str</span>(<span class="identifier">line_number</span>) + <span class="string-literal">'. '</span> + <span class="identifier">line</span>)


...

<span class="keyword">while</span> <span class="identifier">i</span> < <span class="identifier">len</span>(<span class="identifier">source</span>) <span class="keyword">and</span> (<span class="string-literal">'0'</span> <= <span class="identifier">source</span>[<span class="identifier">i</span>] <= <span class="string-literal">'9'</span>
                        <span class="keyword">or</span> <span class="string-literal">'a'</span> <= <span class="identifier">source</span>[<span class="identifier">i</span>] <= <span class="string-literal">'z'</span>
                        <span class="keyword">or</span> <span class="string-literal">'A'</span> <= <span class="identifier">source</span>[<span class="identifier">i</span>] <= <span class="string-literal">'Z'</span> <span class="keyword">or</span> <span class="identifier">source</span>[<span class="identifier">i</span>] == <span class="string-literal">'_'</span>):
    <span class="identifier">i</span> += <span class="numeric-literal">1</span>

...

<span class="keyword">if</span> <span class="identifier">token</span>.<span class="identifier">category</span> <span class="keyword">in</span> (<span class="identifier">Token</span>.<span class="identifier">Category</span>.<span class="identifier">NUMERIC_LITERAL</span>,
                      <span class="identifier">Token</span>.<span class="identifier">Category</span>.<span class="identifier">STRING_LITERAL</span>):
    <span class="identifier">key</span> = <span class="string-literal">'(literal)'</span>
<span class="keyword">elif</span> <span class="identifier">token</span>.<span class="identifier">category</span> == <span class="identifier">Token</span>.<span class="identifier">Category</span>.<span class="identifier">NAME</span>:
    <span class="identifier">key</span> = <span class="string-literal">'(name)'</span>
<span class="keyword">elif</span> <span class="identifier">token</span>.<span class="identifier">category</span> == <span class="identifier">Token</span>.<span class="identifier">Category</span>.<span class="identifier">CONSTANT</span>:
    <span class="identifier">key</span> = <span class="string-literal">'(constant)'</span>
<span class="keyword">elif</span> <span class="identifier">token</span>.<span class="identifier">category</span> <span class="keyword">in</span> (<span class="identifier">Token</span>.<span class="identifier">Category</span>.<span class="identifier">STATEMENT_SEPARATOR</span>,
                        <span class="identifier">Token</span>.<span class="identifier">Category</span>.<span class="identifier">DEDENT</span>):
    <span class="identifier">key</span> = <span class="string-literal">';'</span>
<span class="keyword">else</span>:
    <span class="identifier">key</span> = <span class="identifier">token</span>.<span class="identifier">value</span>(<span class="identifier">source</span>)
</pre>’'’ ‘[[[

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

L(line) file.readlines()
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

]]]'‘<pre>

<span class="keyword">L</span>(<span class="identifier">i</span>) (<span class="numeric-literal">1</span> .< .<span class="identifier">children</span>.<span class="identifier">len</span>).<span class="identifier">step</span>(<span class="numeric-literal">2</span>)
   <span class="keyword">I</span> .<span class="identifier">children</span>[<span class="identifier">i</span>].<span class="identifier">token</span>.<span class="identifier">value</span>(<span class="identifier">source</span>) <span class="keyword">C</span> (<span class="string-literal">‘E’</span>, <span class="string-literal">‘И’</span>, <span class="string-literal">‘else’</span>, <span class="string-literal">‘иначе’</span>)
      <span class="identifier">res</span> ‘’= <span class="identifier">char_or_str</span>(.<span class="identifier">children</span>[<span class="identifier">i</span>+<span class="numeric-literal">1</span>], <span class="identifier">char_val</span>)
      <span class="keyword">L.break</span>
   <span class="identifier">res</span> ‘’= <span class="string-literal">‘a == ’</span><span class="identifier">char_or_str</span>(.<span class="identifier">children</span>[<span class="identifier">i</span>], <span class="identifier">char_key</span>)<span class="string-literal">‘ ? ’</span>
                ‘’<span class="identifier">char_or_str</span>(.<span class="identifier">children</span>[<span class="identifier">i</span>+<span class="numeric-literal">1</span>], <span class="identifier">char_val</span>)<span class="string-literal">‘ : ’</span>

   <span class="keyword">L.was_no_break</span>
      <span class="identifier">res</span> ‘’= <span class="string-literal">‘throw KeyError(a)’</span>

...

<span class="keyword">L</span>(<span class="identifier">child</span>) .<span class="identifier">children</span>
    <span class="identifier">res</span> ‘’= <span class="identifier">child</span>.<span class="identifier">to_str</span>()
    <span class="keyword">I</span> <span class="keyword">L.next</span>
        <span class="identifier">res</span> ‘’= <span class="string-literal">‘, ’</span>

...

<span class="keyword">L</span>(<span class="identifier">line</span>) <span class="identifier">file</span>.<span class="identifier">readlines</span>()
   <span class="keyword">A</span> <span class="identifier">line_number</span> = <span class="keyword">L.index</span> + <span class="numeric-literal">1</span>
   <span class="identifier">print</span>(<span class="identifier">line_number</span><span class="string-literal">‘. ’</span><span class="identifier">line</span>)

...


<span class="keyword">L</span> <span class="identifier">i</span> < <span class="identifier">source</span>.<span class="identifier">len</span> & <span class="identifier">source</span>[<span class="identifier">i</span>] <span class="keyword">C</span> (<span class="string-literal">‘0’</span>..<span class="string-literal">‘9’</span>, <span class="string-literal">‘a’</span>..<span class="string-literal">‘z’</span>, <span class="string-literal">‘A’</span>..<span class="string-literal">‘Z’</span>, <span class="string-literal">‘_’</span>)
   <span class="identifier">i</span>++


...

<span class="keyword">A</span> <span class="identifier">key</span> = <span class="keyword">S</span> <span class="identifier">token</span>.<span class="identifier">category</span>
   <span class="identifier">NUMERIC_LITERAL</span>, <span class="identifier">STRING_LITERAL</span>
      <span class="string-literal">‘(literal)’</span>
   <span class="identifier">NAME</span>
      <span class="string-literal">‘(name)’</span>
   <span class="identifier">CONSTANT</span>
      <span class="string-literal">‘(constant)’</span>
   <span class="identifier">STATEMENT_SEPARATOR</span>, <span class="identifier">DEDENT</span>
      <span class="string-literal">‘;’</span>
   <span class="keyword">E</span>
      <span class="identifier">token</span>.<span class="identifier">value</span>(<span class="identifier">source</span>)

</pre>’'’’’
}


Документация


Установка


Русскоязычный форум \ English Forum
’