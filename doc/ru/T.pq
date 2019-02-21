[[[Н‘T/type’
]]]Н‘Ключевое слово T/type’


#(11l)‘
T <имя типа>
   String s // переменная типа
   F (s) // конструктор
      .s = s
   F get_s_len() // функция типа
      R .s.len
’

Н(-1)‘Псевдонимы типов’

#(11l)‘
T Tuple2[T Ty] = Tuple[Ty, Ty]
’


Н‘Ключевые подслова T/type’


`T.enum`/`type.enum` используется для объявления перечислений:
#(11l)‘
T.enum TokenCategory
   NAME
   KEYWORD
   CONSTANT
   TEST_CATEGORY = 10
’
[Перечисления `NAME`, `KEYWORD` и `CONSTANT` получат значения 0, 1 и 2 соответственно.]

У `T`/`type` также есть подслова `base` и `interface`, но они пока что не поддерживаются.
