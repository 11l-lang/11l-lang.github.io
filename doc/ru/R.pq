[[[Н‘R/return’
]]]Н‘Ключевое слово R/return’


[[[https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Statements/return]]]Оператор `R`/`return` завершает выполнение текущей функции и возвращает её значение.

Этот код объявляет функцию `sum`, возвращающую сумму двух её аргументов:
#(11l)‘
F sum(a, b)
   R a + b
’

Оператор `R`/`return` может использоваться для раннего выхода из функции:
#(11l)‘
F f(a)
   if (a == 0)
      R
   ...
’
