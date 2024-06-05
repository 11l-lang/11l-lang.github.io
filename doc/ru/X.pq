[[[Н‘X/exception’
]]]Н‘Ключевое слово X/exception’


В 11l [[[поддерживается/]]]присутствует два [[вида/]типа/]рода исключений:
1.‘Нефатальные/‘дешёвые’[‘с точки зрения [[[накладных расходов]]] стоимости возбуждения исключения; если же исключение возбуждается очень редко, то лучше использовать исключения второго рода (т.к. исключения первого рода добавляют небольшие постоянные накладные расходы при каждом вызове функции, которая может их породить, а именно добавляют проверку типа возвращённого значения — обычное значение либо исключение)’] исключения. Обязательны к перехвату в исходном коде, компилятор должен проверить, что все такие исключения перехватываются.
Их необходимо указывать в ‘спецификаторах исключений’\‘exception specifications’. Поведение аналогично checked исключениям ‘в Java’[https://habr.com/ru/companies/golovachcourses/articles/225585/][[[Реализованы такие исключения]]], а реализация — аналогична [[["исключениям"]]]ошибкам в Rust и Swift — т.е. просто как дополнительное [скрытое] возвращаемое значение у функции.’
2. Фатальные/дорогие исключения, отсутствие которых гарантировать невозможно и которые нельзя проверить на этапе компиляции. Поведение аналогично тому, как реализованы исключения в самых популярных языках программирования (C++, Python, C#[[[
‘The Trouble with Checked Exceptions A Conversation with Anders Hejlsberg, Part II’[https://www.artima.com/articles/the-trouble-with-checked-exceptions <= http://www.artima.com/intv/handcuffs.html <- https://github.com/dotnet/csharplang/discussions/429 <- google:‘checked exception c#’]
]]], unchecked исключения в Java).

Исключения первого рода используют синтаксис #(11l)‘X <объект_исключения>’ для порождения и #(11l)‘X.handle <тип_исключения>’ для обработки.[[[ {
Почему #(11l)‘X.handle’:
...
}]](не влезает, поэтому [[[[перемещено/]помещено/]]]размещено ниже)]
Исключения второго рода используют синтаксис #(11l)‘X.throw <объект_исключения>’ для порождения и #(11l)‘X.try’/#(11l)‘X.catch’ для обработки.

‘Почему `X.handle`?’{
>‘Exception Handling for C++’[https://www.stroustrup.com/except89.pdf <- google:‘"the design and evolution of c++" "void f() throw (e1, e2)"’ <- решил посмотреть как ‘возбуждать’ написано в оригинале книги ‘Страуструп Б. Дизайн и эволюция C++ (2007) стр. 399’ (‘raise’ или ‘throw’)]:‘Similarly, we chose `catch` in preference to `handle` because `handle` is a commonly used C identifier.’
В отличие от C++ и большинства других языков программирования, ключевые подслова в 11l могут быть какими угодно.
}

Пример исключения *‘первого рода’:[[[inspired by [https://codereview.stackexchange.com/a/259993 <- https://codereview.stackexchange.com/questions/259987/implement-a-range-behaviour-in-python-using-iterators <- google:‘python __next__ range implementation’]]]]
#(11l)‘
T StopIteration {}

T RangeIterator
   Int cur, end

   F (start, end)
      .cur = start - 1
      .end = end

   F __next__() X(StopIteration)
      .cur++
      I .cur == .end
         X StopIteration()
      R .cur

V it = RangeIterator(1, 10)
L
   V i = it.__next__()
   X.handle StopIteration
      L.break
   print(i)
’

Обратите внимание, что код, порождающий исключения первого рода, *‘не обязательно’ заключать в блок #(11l)‘X.try’ {[[[компилятор будет пытаться сопоставить обработчик #(11l)‘X.handle’ следующий]]]при этом обработчик исключения должен располагаться сразу за вызовом функции, потенциально порождающей данное исключение}, т.к. такие исключения гарантированно должны быть обработаны[[[
>‘Страуструп Б. Дизайн и эволюция C++ (2007) стр. 399’:‘Наилучший вариант — каждое возбужденное исключение перехватывается тем или иным обработчиком, написанным пользователем.’
]]].
Но при необходимости его можно заключить в блок #(11l)‘X.try’:
#(11l)‘
F circles_from_p1p2r(p1, p2, r) X(Error)
   I r == 0.0
      X Error(‘radius of zero’)
   I p1 == p2
      X Error(‘coincident points gives infinite number of Circles’)
   ...
   R (c1, c2)

L(p1, p2, r) [((0.1234, 0.9876), (0.8765, 0.2345), 2.0),
              ...
              ((0.1234, 0.9876), (0.1234, 0.9876), 0.0)]
   print("Through points:\n  #.,\n  #.\n  and radius #.6\nYou can construct the following circles:".format(p1, p2, r))
   X.try
      V (c1, c2) = circles_from_p1p2r(p1, p2, r)
      print("  #.\n  #.\n".format(c1, c2))
   X.handle Error v
      print("  ERROR: #.\n".format(v.msg))
’
(‘Полный код.’[https://rosettacode.org/wiki/Circles_of_given_radius_through_two_points#11l])

Исключения первого рода хорошо подходят для возврата из рекурсивных функций:
#(11l)‘
F walk_maze(m, n, &cell, indx) X(PercolatedException)
   cell[n][m] = indx
   I n < :nn - 1 & cell[n + 1][m] == :NOT_VISITED
      walk_maze(m, n + 1, &cell, indx)
   E I n == :nn - 1
      X PercolatedException((m, indx))
   I m & cell[n][m - 1] == :NOT_VISITED
      walk_maze(m - 1, n, &cell, indx)
   I m < :M - 1 & cell[n][m + 1] == :NOT_VISITED
      walk_maze(m + 1, n, &cell, indx)
   I n & cell[n - 1][m] == :NOT_VISITED
      walk_maze(m, n - 1, &cell, indx)

F check_from_top(&cell) -> (Int, Int)?
   V (n, walk_index) = (0, 1)
   L(m) 0 .< :M
      I cell[n][m] == :NOT_VISITED
         walk_index++
         walk_maze(m, n, &cell, walk_index)
         X.handle PercolatedException ex
            R ex.t
   R N
’
(‘Полный код.’[https://rosettacode.org/wiki/Percolation/Site_percolation#11l])

Пример исключения *‘второго рода’:
#(11l)‘
T Error
   String message
   F (message)
      .message = message

X.try
   print(‘1’)
   X.throw Error(‘error message’)
   print(‘never printed string’)
X.catch Error e
   print(‘Error: ’e.message)
’
Этот код выведет:
```
1
Error: error message
```
[[[
#rec##audio#[REC_0003174.wav]
Разделение exception-ов на checked и unchecked в Java — идея, признанная неудачной. Почему тогда я сделал так же в 11l? Не так же. Если хотите, я сделал по аналогии с Rust и Swift. В Java была неудачная реализация и синтаксис. Было не понятно, какие исключения являются checked, какие нет. Синтаксически [в Java] они никак не [[выделялись/]]выделяются. throw и catch одинаково [[работали/]]работают для них. В 11l это устранено. И в 11l исключения первого рода — это просто дополнительное возвращаемое значение, просто синтаксический сахар, более удобная запись того, что уже есть в Rust и Swift. И в добавок [в 11l] поддерживаются полноценные исключения, как в C++, C# и Java.
]]]
‘Обоснование разделения исключений в 11l на два рода’{
Разделение исключений на checked и unchecked в Java — идея, признанная неудачной:
>‘Don't Use Checked Exceptions’[https://reflectoring.io/do-not-use-checked-exceptions/ <- google:‘checked exceptions in Java’]:‘Java is the only (mainstream) programming language to implement the concept of checked exceptions. Ever since, checked exceptions have been the subject of controversy. Considered an innovative concept at the time (Java was introduced in 1996), nowadays they are commonly considered bad practice.’
>‘The Trouble with Checked Exceptions A Conversation with Anders Hejlsberg, Part II’[https://www.artima.com/articles/the-trouble-with-checked-exceptions <= http://www.artima.com/intv/handcuffs.html <- https://github.com/dotnet/csharplang/discussions/429 <- google:‘checked exception c#’]:‘I completely agree that checked exceptions are a wonderful feature. It's just that particular implementations can be problematic. By implementing checked exceptions the way it's done in Java, for example, I think you just take one set of problems and trade them for another set of problems.’

Почему тогда в 11l сделано так же?
Нет, не так же.[[[
В 11l исключения первого рода являются аналогом ошибок/исключений в Rust и Swift.]]]

Checked и unchecked исключения в Java имеют неудачный синтаксис и реализацию:
. синтаксически перехват и возбуждение checked и unchecked исключений никак не отличаются (`throw` и `catch` работают для них в Java одинаково, в 11l это устранено — checked исключения имеют другой синтаксис);
. возбуждение checked исключений такое же медленное[https://stackoverflow.com/questions/47017261/comparing-checked-and-unchecked-exceptions-performance-benchmarks-in-java <- google:‘checked exceptions in java faster unchecked’] как и unchecked, что подавляет мотивацию использовать checked исключения в Java в качестве альтернативного возвращаемого значения.

В 11l исключения первого рода — это просто дополнительное возвращаемое значение, просто синтаксический сахар, [[[более удобная запись]]]аналог [[[того, что уже есть]]]ошибок[[[/исключений]]] в Rust[https://doc.rust-lang.org/book/ch09-02-recoverable-errors-with-result.html] и Swift[https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/].

И в дополнение, 11l поддерживает полноценные исключения, как в Python, C++, C#, Java и многих других языках. Это — исключения второго рода[[[ в 11l]]].
}
