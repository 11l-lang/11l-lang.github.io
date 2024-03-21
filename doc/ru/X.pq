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

Пример исключения первого рода:[[[inspired by [https://codereview.stackexchange.com/a/259993 <- https://codereview.stackexchange.com/questions/259987/implement-a-range-behaviour-in-python-using-iterators <- google:‘python __next__ range implementation’]]]]
#(11l)‘
T StopIteration {}

T RangeIterator
   Int start, stop

   F (start, stop)
      .start = start - 1
      .stop  = stop

   F __next__() X(StopIteration)
      .start++
      I .start == .stop
         X StopIteration()
      R .start

V it = RangeIterator(1, 10)
L
   V next = it.__next__()
   X.handle StopIteration
      L.break
   print(next)
’
(Обратите внимание, что код, порождающий исключения первого рода, не обязательно заключать в блок #(11l)‘X.try’ {[[[компилятор будет пытаться сопоставить обработчик #(11l)‘X.handle’ следующий]]]при этом обработчик исключения должен располагаться сразу за вызовом функции, потенциально порождающей данное исключение}, т.к. такие исключения гарантированно должны быть обработаны[[[
>‘Страуструп Б. Дизайн и эволюция C++ (2007) стр. 399’:‘Наилучший вариант — каждое возбужденное исключение перехватывается тем или иным обработчиком, написанным пользователем.’
]]].)

Пример исключения второго рода:
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
