I think that operator `+` for string concatenation is an unfortunate decision, because:
1.‘String concatenation is noncommutative unlike addition operator `+`. This argument mentions the developers of Julia programming language[[[, D]]]:
>[https://docs.julialang.org/en/latest/manual/strings/#man-concatenation-1]:‘
In mathematics, `+` usually denotes a ~‘commutative’ operation, where the order of the operands does not matter. An example of this is matrix addition, where `A + B == B + A` for any matrices `A` and `B` that have the same shape.’
And I suggest to make operator `+` strictly commutative and in presence of #(11l)‘F +(MyType, Int)’ forbid #(11l)‘F +(Int, MyType)’. This will reduce a work of definition of additional/extra operators' overloadings, and at the same time this will increase the predictability of programs [{similarly operator `!=` must be generated automatically based on operator `==` ‘as done in D’[https://dlang.org/spec/operatoroverloading.html#equals], and explicit overloading of operator `!=` should be forbidden}].’
2. In some languages (for example in PHP and Perl) "5"+5 yields 10.
3.‘>‘Dart Puzzlers: Chapter 2’[https://web.archive.org/web/20120303225245/http://www.dartlang.org/articles/puzzlers/chapter-2.html#11 <- https://news.dartlang.org/2012/06/vm-to-remove-support-for-string.html <- [https://github.com/JuliaLang/julia/issues/1771]:‘Dart completely removed their string concatenation operator (it was +) some time ago. Rationale is here: http://news.dartlang.org/2012/06/vm-to-remove-support-for-string.html’ <- google:‘julia concatenation’][-1]:‘Can you guess what the following statement prints?
```
System.out.println("2 + 2 = " + 2+2);
```
Translating this mini-puzzle into Dart, we get:
```
print('2 + 2 = ' + 2+2);
```
Both the Java and Dart versions print `2 + 2 = 22`, which may not be what you expected.’
Or more vital example:
#(11l)‘
print("id=" + id+1)
’
’
4.‘>‘Dart Puzzlers: Chapter 2’[https://web.archive.org/web/20120303225245/http://www.dartlang.org/articles/puzzlers/chapter-2.html#13]:‘```
...
    System.out.println("Animals are equal: "
                       + pig == dog);
...
```
It doesn't print `Animals are equal: true`. It doesn't print `Animals are equal: false`, either. It just prints `false`. Why? Because the `+` operator binds tighter than the `==` operator.’
This [as in 3] problem is solved with a separate string concatenation operator, because its priority may[[[will]]] be lower than of operator `==`.’

For this [and/or some other] reasons operator `+` is not used for string concatenation in many languages (PHP, Perl, D, Lua, Julia, Visual Basic, Nim, Dart), but definitive designation for this operation is still not found [{most appropriate designation [in my opinion] have chosen in languages D and Perl 6: tilde (`~`) symbol}], therefore I decided to go another way and reject a dedicated operator for string concatenation. To concat string literal and variable in 11l just place it next to each other without spaces:
#(11l)‘
print("id="id)
print("id="(id+1))
’
To concat two variables use this notation:
#(11l)‘
print(name""value)
’
or this:
#(11l)‘
print(name‘’value)
’
In the last case a raw string literal is used — raw strings should be enclosed in single quotation marks: characters `‘` and `’`.

Consecutive string literals [of one type (‘’ or "")] are *‘not’ concatenated [unlike in languages C or Python], because it is error prone (this problem is mentioned here[https://www.python.org/dev/peps/pep-3126/] and here[https://pvs-studio.com/en/docs/warnings/v653/]) — space between two string literals indicate that likely comma is missed here.
String literals are concatenated only with variables: #(11l)‘‘Value = ’value"\n"’, and with string literals of other type: #(11l)‘‘no-break’"\xA0"‘space’’. And in this case there should *‘not’ be a space between string literal and a variable or string literal of other type.

> Why is `+` bad for strings, but `*` is not?
Because `*` almost always has one of the operands as a string literal [`"s" * n`/`n * "s"`] and such an operation is easily noticeable.
