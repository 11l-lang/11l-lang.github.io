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

11l [[[— ]]]is a [[[‘very high-level’[https://en.wikipedia.org/wiki/Very_high-level_programming_language]]this term is unclear]]high-level [[[universal/]]]general-purpose programming language, [[[at the same time providing]]]which provides a simple and direct mapping to hardware and aims to[[[/at]]] following a zero-overhead principle, like C++ (unused language features do not add ‘run-time overhead’[‘excess computation time, oftentimes combined with the additional length of a compiled machine code’]). 11l is statically typed, but [[[smells]]]feels very much like dynamically typed language (e.g. Python)[[[ or even scripting language]]].
The design of 11l is aimed to achive as much conciseness as possible.

The evident distinction of 11l from all other existing programming languages is its keywords are organized in a tree, not just a list.
There are 11 keywords at the root of that tree, and each word can be written as [[[its first]]]one letter. [Short one-letter keywords looks odd at first sight, but it's just a matter of habit.]
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
── T/type ──┬── super
            ├── enum
            └── interface
── X/exception ──┬── try
                 ├── catch
                 └── try_end
```
}
