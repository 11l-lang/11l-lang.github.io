[[[Н‘Префиксы переменных’
]]]Н‘Префиксы переменных’


Префикс `.` используется для переменных типов:
#(11l)‘
T Error
   String message

   F Error(message)
      .message = message
’

Префикс `:` используется для глобальных переменных:
#(11l)‘
A global_var = 0

F global_func()
   :global_var++
’

Префикс `@` используется для внешних\*‘‘ca’[‘символ @ выглядит похожим на пару символов Ca’]’ptured переменных:
#(11l)‘
F global_func()
   A i = 0

   F local_func()
      @i++
’