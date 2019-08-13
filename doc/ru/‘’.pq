Я считаю, что оператор `+` для конкатенации строк — неудачное решение, так как:
1.‘Он некоммутативен в отличие от операции сложения, обозначаемой символом `+`. Этот аргумент приводят, в частности, разработчики языка программирования Julia[[[, D]]]:
>[https://docs.julialang.org/en/latest/manual/strings/#man-concatenation-1]:‘
In mathematics, `+` usually denotes a ~‘commutative’ operation, where the order of the operands does not matter. An example of this is matrix addition, where `A + B == B + A` for any matrices `A` and `B` that have the same shape.’
И я предлагаю сделать оператор `+` строго коммутативным и при наличии #(11l)‘F +(MyType, Int)’ запретить перегрузку #(11l)‘F +(Int, MyType)’. Это немного уменьшит работу программисту по заданию дополнительных[[[/ненужных/лишних]]] перегрузок операторов, и одновременно повысит предсказуемость программ [{аналогично перегрузку оператора `!=` следует автоматически генерировать на основе перегрузки оператора `==` ‘как сделано в D’[https://dlang.org/spec/operatoroverloading.html#equals] и тоже запретить}].’
2. В некоторых языках (например в PHP и Perl) сложение "5"+5 даёт 10.
3.‘Наткнувшись на
>‘Dart Puzzlers: Chapter 2’[https://web.archive.org/web/20120303225245/http://www.dartlang.org/articles/puzzlers/chapter-2.html#11 <- https://news.dartlang.org/2012/06/vm-to-remove-support-for-string.html <- [https://github.com/JuliaLang/julia/issues/1771]:‘Dart completely removed their string concatenation operator (it was +) some time ago. Rationale is here: http://news.dartlang.org/2012/06/vm-to-remove-support-for-string.html’ <- google:‘julia concatenation’][-1]:‘Can you guess what the following statement prints?
```
System.out.println("2 + 2 = " + 2+2);
```
Translating this mini-puzzle into Dart, we get:
```
print('2 + 2 = ' + 2+2);
```
Both the Java and Dart versions print `2 + 2 = 22`, which may not be what you expected.’
я вспомнил, что удобно иметь возможность конкатенации [[[строки/]]]строкового литерала и числа без явного преобразования числа к строке[[[ [что само по себе ставит под вопрос использование символа `+` для этой операции]]]], и у меня родился такой [более жизненный, чем 2+2] пример:
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
Эту проблему также [как и в пункте 3] решает отдельный оператор для конкатенации строк, так как приоритет этого оператора можно сделать ниже, чем у оператора сравнения `==`.’

По этим [и/или каким-то ещё] причинам от `+` для конкатенации строк отказались во многих языках (PHP, Perl, D, Lua, Julia, Visual Basic, Nim, Dart), вот только [[[удачного]]]однозначного обозначения для этой операции, [[[по моему мнению]]]к сожалению, до сих пор так и не [[[нашли]]]определили [{наиболее удачным можно считать принятое в языках D и Perl 6 обозначение — символ тильда (`~`)}], поэтому я решил попробовать пойти другим путём и вообще отказаться от оператора [[[для ]]]конкатенации строк. Для конкатенации [[[строки/]]]строкового литерала и переменной в 11l достаточно просто расположить их рядом без пробелов:
#(11l)‘
print("id="id)
print("id="(id+1))
’
Для конкатенации двух переменных используется такая форма записи:
#(11l)‘
print(name""value)
’
или такая:
#(11l)‘
print(name‘’value)
’
В последнем случае используются "сырые" строки — их необходимо заключать в одиночные парные кавычки — символы `‘` и `’`, и их использование предпочтительно в 11l.

Подряд идущие же строки [одного типа (‘’ или "")] *‘не’ склеиваются в одну {(как в некоторых[‘например Си и Python’] языках программирования), так как это чревато пропущенными ошибками (эта проблема также упоминается здесь[https://www.python.org/dev/peps/pep-3126/] и здесь[http://www.viva64.com/ru/d/0273/]): например, возможно была пропущена запятая между строк, и механизм автоматического склеивания/конкатенации строк пропустит такую ошибку}, за исключением склеивания переменных: #(11l)‘‘Значение = ’value"\n"’, а также разнородных строк: #(11l)‘‘неразрывный’"\xA0"‘пробел’’ — при этом между [[[строкой/]]]строковым литералом и переменной (или [[[строкой]]]строковым литералом другого типа) *‘не’ должно быть разделителей.
