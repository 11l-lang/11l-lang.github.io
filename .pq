>>‘\/‘‘(Эта страница на русском\This page in Russian)’[./ru]’’

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
C(4)‘```
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

11l [[[— ]]]is a [[[‘very high-level’[https://en.wikipedia.org/wiki/Very_high-level_programming_language]]this term is unclear]]high-level [[[universal/]]]general-purpose programming language, [[[at the same time providing]]]which provides a simple and direct mapping to hardware and aims to[[[/at]]] follow[[[ing]]] a zero-overhead principle, like C++ (unused language features do not add ‘run-time overhead’[‘excess computation time, oftentimes combined with the additional length of a compiled machine code’]). 11l is statically typed, but [[[smells]]]feels very much like dynamically typed language (e.g. Python)[[[ or even scripting language]]].
The design of 11l is aimed to achive as much conciseness as possible.

The evident distinction of 11l from all other existing programming languages is its keywords are organized in a tree, not just a list.
There are 11 keywords at the root of that tree, and each word can be written as [[[its first]]]one letter. [Short one-letter keywords look odd at first sight, but it's just a matter of habit.]
‘Tree of all 11l keywords.’{
```
── A/var
── C/in
── I/if ──┬── likely
          └── unlikely
── E/else
── F/fn ──┬── args
          ├── destructor
          └── virtual ──┬── new
                        ├── override
                        ├── final
                        └── abstract
── L/loop ──┬── continue
            ├── break
            ├── on_continue
            ├── on_break
            ├── was_no_break
            ├── index
            ├── next
            └── prev
── N/null
── R/return
── S/switch ──┬── break
              └── fallthrough
── T/type ──┬── base
            ├── enum
            └── interface
── X/exception ──┬── try
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


Documentation


Install


English Forum \ Русскоязычный форум
’
