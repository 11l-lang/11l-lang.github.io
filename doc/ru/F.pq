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
}) или когда это [[[функция-по-умолчанию/]]]безымянная функция модуля, например `os:(command_string)` (см. ‘документацию модуля os’[./../built-in-modules/os]).

`<аргументы>`
Список аргументов, разделённых запятой или точкой с запятой. Может быть пустым.
Каждый аргумент определяется как:
0‘[<тип аргумента>] [<квалификатор>]<имя аргумента> [= <значение по умолчанию>]’

Все [[[переданные/]]]передаваемые в функцию аргументы по умолчанию константны и не могут [[[быть изменены]/]][[[изменяться]]]модифицироваться внутри функции, но это [[[воз]]]можно изменить посредством квалификаторов.
‘Квалификаторы’{
`=`
Квалификатор передачи копии аргумента. Даёт возможность изменять аргумент внутри функции. При этом меняется только локальная копия аргумента.

`&`
Квалификатор передачи аргумента по ссылке. Даёт возможность изменять аргумент внутри функции.

Пример:
#(11l)‘
F f(=i, j)
   i += 1 // так можно
   j += 1 // а тут ошибка
’
}


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


Н(-1)‘Сокращение совпадающих именованных аргументов’

Такой вызов:
#(11l)‘
my_function(
  my_first_variable' my_first_variable,
  my_second_variable' my_second_variable
)
’
можно сократить до:
#(11l)‘
my_function(
  ' my_first_variable,
  ' my_second_variable
)
’
[Идея навеяна ‘этим тредом’[https://discuss.python.org/t/syntactic-sugar-to-encourage-use-of-named-arguments/36217].]


Н‘Ключевые подслова F/fn’


`F.destructor`/`fn.destructor` используется для объявления деструктора:
#(11l)‘
T TypeName
   F.destructor
      print(‘TypeName destructor called’)
’

Подслова `virtual.new`, `virtual.override`, `virtual.final`, `virtual.abstract` и `virtual.assign`[[[рассматривал ещё варианты: set, define, determine, designate, new‘a’[‘abstract’], non_abstract, specific, concrete на основе google-перевода слов ‘определять’ и ‘конкретный’]]] означают, что эта функция виртуальная, и они задают "тип виртуальности" этой функции.[[[>[https://habr.com/ru/post/465553/ <- google:‘Ü habr’ <- http://compiler.su/entuziasty-razrabotchiki-kompilyatorov-i-ikh-proekty.php#33]:‘Для виртуальных функций требуется явно указывать вид виртуальности.’]]]
`virtual.new` обозначает, что это новая виртуальная функция (наличие виртуальной функции с этим же именем в базовом типе является ошибкой компиляции).
`virtual.override` используется для указания того, что данная функция переопределяет виртуальную функцию из базового типа (отсутствие виртуальной функции с этим же именем в базовом типе является ошибкой компиляции).
[[[https://en.cppreference.com/w/cpp/language/final]]]`virtual.final` [[[определяет/]]]указывает, что виртуальная функция не может быть переопределена в производном типе.
[[[https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/abstract-and-sealed-classes-and-class-members]]]Подслово `virtual.abstract` предоставляет возможность создавать функции типов, которые должны быть реализованы в производном типе (при этом реализация должна быть помечена[[[ как]]] `virtual.assign`).
Небольшой пример:
#(11l)‘
T Shape
   F.virtual.abstract square() -> Float

T Circle(Shape)
   Float radious
   F.virtual.assign square() -> Float
      R math:pi * .radious^2
’

Подслово `F.args`/`fn.args` предназначено для обеспечения доступа к аргументам, переданным в текущую функцию, но на данный момент оно не реализовано.

`F.result`/`fn.result` — это специальная переменная, которая служит в качестве неявной переменной возврата.
‘Почему `fn.result`?’{
. `result`, потому что в Nim[https://rosettacode.org/wiki/Function_definition#Nim] и Delphi[https://rosettacode.org/wiki/Function_definition#Delphi] есть специальная переменная `result`.
. `fn`, потому что для возврата значения из функции в некоторых языках (например, BASIC[https://rosettacode.org/wiki/Function_definition#BASIC] и Pascal[https://rosettacode.org/wiki/Function_definition#Pascal]) необходимо присвоить значение имени функции.

`F.result`/`fn.result` длиннее `R`/`return` намеренно, т.к. он должен использоваться только в случае необходимости. `R`/`return` предпочтительнее, поскольку функции в 11l не требуют указания типа возвращаемого значения.
}
