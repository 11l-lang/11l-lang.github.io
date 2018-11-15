[[[Н‘F/fn’
]]]Н‘Ключевое слово F/fn’


#(11l)‘
F <имя функции>(<аргументы>) [-> <тип возвращаемого значения>]
   <тело функции>
’

`<имя функции>`
Имя функции. Может быть пустым в случае если это конструктор (когда функция определяется внутри определения типа, пример: {
#(11l)‘
T Person
   String name
   Int age

   F (name, age)
      .name = name
      .age  = age
’
}) или когда это функция-по-умолчанию модуля, например `os:(command_string)` (см. ‘документацию модуля os’[./modules/os]).

`<аргументы>`
Список аргументов, разделённых запятой. Может быть пустым.
Каждый аргумент определяется как:
0‘[<тип аргумента>] <имя аргумента> [= <значение по умолчанию>]’


Н(-1)‘Именованные аргументы’

#(11l)‘
F sqlen(x = 0, y = 0, z = 0)
   R x*x + y*y + z*z

print(sqlen(z' 3)) // эквивалентно print(sqlen(0, 0, 3))
’


Н(-1)‘"Только-именованные" аргументы’

#(11l)‘
F to_html(instr, ohd = 0B, ', habr_html = 0B)
   ...

to_html(s, 0B, 1B) // ошибка
to_html(s, 0B, habr_html' 1B) // правильно
to_html(s, habr_html' 1B) // так тоже правильно
’


Н‘Ключевые подслова F/fn’


`F.destructor`/`fn.destructor` используется для объявления деструктора:
#(11l)‘
T TypeName
   F.destructor
      print(‘TypeName destructor called’)
’

Подслова `virtual.new`, `virtual.override`, `virtual.final` и `virtual.abstract` означают что эта функция виртуальная и они задают "тип виртуальности" этой функции.
`virtual.new` обозначает что это новая виртуальная функция.
`virtual.override` используется для указания того, что данная функция переопределяет виртуальную функцию из базового типа.
[[[https://en.cppreference.com/w/cpp/language/final]]]`virtual.final` определяет, что виртуальная функция не может быть переопределена в производном типе.
[[[https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/abstract-and-sealed-classes-and-class-members]]]Подслово `virtual.abstract` предоставляет возможность создавать функции типов, которые должны быть реализованы в производном типе.
Небольшой пример:
#(11l)‘
T Shape
   F.virtual.abstract square() -> Float

T Circle(Shape, Object)
   Float radious
   F.virtual.override square() -> Float
      R pi * radious^2
’

Подслово `F.args`/`fn.args` предназначено для обеспечения доступа к аргументам, переданным в текущую функцию, но на данный момент оно не реализовано.
