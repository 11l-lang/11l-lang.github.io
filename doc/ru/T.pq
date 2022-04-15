[[[Н‘T/type’
]]]Н‘Ключевое слово T/type’


#(11l)‘
T <имя типа>
   String s // переменная экземпляра типа
   . String ps // закрытая переменная экземпляра типа [обоснование: точка используется для скрытых файлов и папок в Unix]
   F (s) // конструктор
      .s = s
   F get_s_len() // функция типа (метод)
      R .s.len
’

[Так как `T` и `type` являются ключевыми словами в 11l, вы можете использовать `Ty` и `type_name` вместо них.]


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


‘Почему T/type?’{
Я согласен с Никлаусом Виртом:
>[https://www.osp.ru/os/1996/06/179017]:‘Мы также избегаем введения совершенно новых терминов для хорошо известных понятий; например, мы остаемся верными термину "тип", избегая слова "класс"’

К тому же, если посмотреть на определение термина «класс» в C++ {
.‘>[https://en.cppreference.com/w/cpp/language/classes]:‘
A class is a user-defined type.’’
.‘>‘Standard for Programming Language C++’[http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/n4750.pdf]:‘
A class is a type.’’
}, то видно, что класс — это пользовательский тип.

И вот ещё кусочек из руководства по программированию на C#:
>‘Types (C# Programming Guide)’[https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/types/#custom-types]:‘
H‘Custom Types’

You use the struct, class, interface, and enum constructs to create your own custom types.’
}
