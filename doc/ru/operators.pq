[[[Н‘Операторы’
]]]Н‘Операторы’


Таблица всех операторов 11l в порядке от наивысшего приоритета к низшему:
Т‘‘
‘x.y
module:f
0‘a[x]’
f(x)
x--
x++
’
‘Доступ к элементу
Функция или переменная модуля
Обращение к элементу контейнера
Вызов функции
Постфиксный декремент
Постфиксный инкремент’’
‘‘^’ ‘Оператор возведения в степень (ассоциативность: справа налево)’’
‘‘-x
+x
!x
(-)x
--x
++x
&x
’ ‘Унарный минус
Унарный плюс
Логическое НЕ
Поразрядное НЕ (обоснование выбора: {
Оператор (-) является парным оператору XOR (+) и обладает следующими свойствами:
a(-)b = NOT (a XOR b)
NOT a = 0(-)a = (-)a
a(-)(-)b = a(+)b
a(+)(-)b = a(-)b
(-)(-)a = a

Однако, так как бинарный оператор (-) не имеет аппаратной поддержки и используется крайне редко, в 11l включён только унарный оператор (-), который соответствует поразрядному НЕ.
})
Префиксный декремент
Префиксный инкремент
Оператор взятия адреса’’
‘‘x * y
x / y
x I/ y или x Ц/ y
x % y
’ ‘Умножение
Деление
Целочисленное деление {примите к сведению, что `-5 // 2 = -3` в Python-е, в то время как `-5 I/ 2 = -2` в 11l, но это исключительно из соображений производительности, и если вы знаете эффективную реализацию целочисленного деления в стиле Python, тогда, пожалуйста, напишите об этом на форуме[http://forum.11l-lang.org/forums/Разработка.6/]}
Остаток от деления’’
‘‘x""y и x‘’y’ ‘Конкатенация строк (‘обоснование выбора’[./../‘’])’’
‘‘x + y
x - y’ ‘Сложение
Вычитание’’
‘‘x << y
x >> y’ ‘Поразрядный сдвиг влево
Поразрядный сдвиг вправо’’
‘‘x 0‘[&]’ y’ ‘Поразрядное И (обоснование выбора: {
0‘[&]’ выглядит похоже на ‘логический вентиль И’[https://ru.wikipedia.org/wiki/Логические_элементы#Конъюнкция_(логическое_умножение)._Операция_И]:

Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/IEC_AND_label.svg/100px-IEC_AND_label.svg.png’
})’’
‘‘x (+) y’ ‘Поразрядное исключающее ИЛИ (обоснование выбора: {
Символы (+) похожи на символ ⊕, который используется в ‘алгебре логики’[https://ru.wikipedia.org/wiki/Алгебра_логики]\‘Boolean algebra’[https://en.wikipedia.org/wiki/Boolean_algebra] для обозначения операции ‘исключающего или’/‘сложения по модулю 2’[https://ru.wikipedia.org/wiki/Сложение_по_модулю_2]: Р‘https://wikimedia.org/api/rest_v1/media/math/render/svg/18f7d86510aec2e45bb019abacccd2e772790f8f’.
И хотя ⊕ используется чаще для [[[однобитовых/]]]одноразрядных значений, в Википедии встречается его применение ‘для указателей’[https://ru.wikipedia.org/wiki/XOR-связный_список <- https://habrahabr.ru/post/183462/#comment_6377452 <- google:‘1с xor’] и ‘для массивов из байт’[https://en.wikipedia.org/wiki/Hash-based_message_authentication_code <- google:‘HMAC’ <- https://www.imperialviolet.org/2017/05/31/skipsha3.html ‘key:        Bytes     array of bytes’].
[К тому же, использовать ^ для данной операции я считаю неудачной идеей (ну, во всяком случае, новичков в программировании это точно ‘сбивает с толку’[https://stackoverflow.com/questions/11464905/what-is-used-for-in-ruby]).]
})’’
‘‘x 0‘[|]’ y’ ‘Поразрядное ИЛИ (обоснование выбора: {
Символ | похож на 1, а 0‘[1]’ выглядит похоже на ‘логический вентиль ИЛИ’[https://ru.wikipedia.org/wiki/Логические_элементы#Дизъюнкция_(логическое_сложение)._Операция_ИЛИ]:

Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/OR_gate_RU.svg/100px-OR_gate_RU.svg.png’
})’’
‘‘x < y, x <= y
x > y, x >= y’ ‘Операции сравнения’’
‘‘x..y, x.<y, x.+len
x<.y, x<.<y’ ‘Диапазоны[[[[
a..b соответствует [a, b] в языках программирования: Ruby[‘TIOBE Rating: 1.109%’], Groovy[‘1.016%’], Kotlin[‘0.253%’], CoffeeScript, Perl[‘1.013%’], F#[‘0.227%’], Ada[‘0.283%’], Nim, Bash
a...b соответствует [a, b] в языках программирования: Swift[‘1.220%’][[[(]]]
a..b соответствует [a, b) в языках программирования: D[‘0.511%’], Rust[‘0.297%’], C#[‘3.455%’]'‘<!--]-->’'
]]]]’’
‘‘x == y, x != y
e in c, e !in c
e C c, e !C c
’ ‘Сравнения
Элемент e содержится/‘не содержится’ в контейнере c’’
‘‘x & y’ ‘Логическое И (обоснование выбора: {
Используется `&` вместо `&&` так как:
1. Логическое И требуется гораздо[[[/намного]]] чаще, чем поразрядное.
2.‘Поразрядное И практически всегда используется только для проверки установленных флагов, но это чревато ошибками {
Рассмотрим следующий код на C++:
#(C++)‘
class Render
{
public:
    static const unsigned F_CAST_SHADOWS = 1 << ...;
};

class Control
{
public:
    unsigned flags;
    static const unsigned F_DISABLED = 1 << ...;
};

void some_func(Control *c)
{
    if (c->flags & Control::F_DISABLED) {
        ...
    }
    if (c->flags & Render::F_CAST_SHADOWS) { // это неверно, но будет корректно скомпилировано!
        ...
    }
}
’

Решение 11l:
#(11l)‘
T Control
   T.flags flags
      DISABLED
или:
T Control
   T Flags
      Bool DISABLED
   Flags flags

F some_func(Control c)
   I c.flags.DISABLED
      ...
’
}, поэтому было принято такое решение, чтобы [[[отговорить/]]]сподвигнуть отказаться от такого использования поразрядного И вообще[[[ другими словами, если оставить/исключить из рассмотрения использование `&` для флагов, то что останется вообще?]не очень удачно сформулированное замечание]].’

Иногда поразрядное И используется как остаток от деления на число, равное степени двойки, но если второй операнд является константой, тогда лучше использовать оператор `%` (`x [&] y = x % (y + 1)`). Если оператор `%` работает для отрицательных чисел также как в Python (т.е., например, `-1 % 4 = 3`), тогда выражение `x % (y + 1)` будет скомпилировано в поразрядное И.

С конвертацией существующего кода на C-подобном языке программирования в 11l проблем такое решение (`&` вместо `&&`) не создаёт, так как в том случае, когда вы забудете заменить `&` на `[&]`, возникнет ошибка компиляции, так как запись `<число> & <число>` не действительна в 11l (а действительна только `<boolean> & <boolean>`, например `<число> != 0 & <число> != 0`).

Символ `&` в качестве логического И используется также в языках Oberon[[[>[https://visual.sfu-kras.ru/model/215 <- https://online.oberon.org <- https://habr.com/ru/company/oleg-bunin/blog/488200/]:‘WHILE (n < maxiterations) & (break = FALSE)  DO’]]] и ALGOL 68[[[>[https://rosettacode.org/wiki/Logical_operations#ALGOL_68]:‘printf(($"a and b is "gl$, a & b);’]]].
})’’
‘‘x | y’ ‘Логическое ИЛИ’’
‘‘x ? y’ ‘Вернуть левый операнд если он не нуль, иначе вернуть правый операнд’’
‘‘arr1 0‘[+]’ arr2’ ‘Конкатенация массивов (обоснование выбора: {
Так как массивы задаются с использованием квадратных скобок: `[1, 2, ...]`.
Так как эта операция достаточно дорогая, ей выделен [[[специальный/]]]отдельный оператор.
})’’
‘‘() -> выражение
x -> выражение
(x, y) -> выражение’ ‘Лямбда выражение’’
‘‘x = ...
x += ...
-= *= /= I/= Ц/=
%= >>= <<= ^=
0‘[+]= [&]= [|]=’
(+)= ‘’=’ ‘Присваивания (ассоциативность: справа налево)’’
’
