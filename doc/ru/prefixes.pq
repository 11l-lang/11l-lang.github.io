[[[Н‘Префиксы переменных’
]]]Н‘Префиксы переменных’


Префикс `.` используется для переменных-членов типов:
#(11l)‘
T Error
   String message

   F (message)
      .message = message
’

Префикс `:` используется для глобальных (или статических [см. ниже]) переменных {глобальные функции и типы не требуют префикса `:`, потому что глобальные функции и типы — это нормально, а вот глобальные переменные — это не очень хорошо, и они должны быть помечены `:`}:
#(11l)‘
V global_var = 0

F global_func()
   :global_var++
’

Префиксы `@` и `@=` используются для внешних\*‘‘ca’[‘символ @ выглядит похожим на пару символов Ca’]’ptured переменных:
#(11l)‘
F global_func()
   V i = 0

   F local_func()
      @i++ // `i` захвачена по ссылке

F get_f(a)
   F f(b)
      R @=a + b // `a` захвачена по значению (копированием)
   R f
’
Дополнительные примеры:
#(11l)‘
F f()
   V i = 0
   F g()
      F h()
         print(@@i)
’
>[https://github.com/11l-lang/_11l_to_cpp/blob/8abf2eb24731b5e3b2d41b854914e8f365c3517b/tests/python_to_cpp/pqmarkup.11l#L44]:‘#(11l)‘
      F exit_with_error(message, =pos)
         ...
            I @.instr[t] == "\n"
’’
>[https://rosettacode.org/wiki/Bitmap#11l]:‘#(11l)‘... @@.background ...’’
[[[
>[https://ru.wikipedia.org/wiki/Анонимная_функция]:‘по ссылке [&] или с помощью копии [=]’
]]]
Н(-1)‘Статические переменные’

#(11l)‘
F fake_random()
   -V seq = [3, 1, 2, 4, 7, 5, 6]
   V :n = 0 //статическая локальная переменная
   :n = (:n + 1) % seq.len
   R seq[:n]

F f()
   V :n = 0 //статическая локальная переменная
   F g()
      @:n++
’

Н(-1)‘Статические переменные-члены’

#(11l)‘
T Type
   :static_type_var1 = 0
   String :static_type_var2
   . -:private_const_static_var = 10

   T SubType
      member = 0

   F :static_type_fn()
      R .:static_type_var2

   F f()
      .:static_type_var1 = 1
      .:static_type_fn() // почему не просто `.static_type_fn()` - эта функция объявляется как `:static_type_fn()`
      V st = .SubType() // аналогично `self.SubType` в Python [почему не `.:SubType()` - этот тип объявляется как `T SubType`, а не `T :SubType`]

print(Type.:static_type_var1)
print(Type.static_type_fn()) // аналогично глобальным функциям/типам [vs глобальным переменным] которые не требуют префикс `:`
V t = Type.SubType()
’

Н(-1)‘Признак изменяемости аргументов функции’

#(11l)‘
F tokenize(source, [(Int, Int)] &comments)
   ...

tokenize(‘print()’, &comments) // `&` здесь обязательно
’
