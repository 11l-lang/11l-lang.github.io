2017.11.16 17:04:02
>[https://docs.microsoft.com/ru-ru/cpp/c-runtime-library/reference/fsopen-wfsopen?view=msvc-170 <- https://msdn.microsoft.com/ru-ru/library/z5hh6ee9.aspx <- google:‘fopen_s’]:‘
`T`
Определяет файл как временный. По возможности он не сбрасывается на диск.’
Это сделано не на том уровне. Зачем вообще указывать тогда имя файла, если он даже на диск не сбросится? Здесь подойдёт отдельная функция, например: `open_temp_memory_file()` или [[[что-то вроде того. Была мысль сделать что-то вроде спец. значения вместо строки имени файла в `open`, например так: `open(TEMP_MEMORY_FILE)`, но потом я подумал, что это вообще ерунда какая-то — зачем такой файл и как его использовать?]]]специальное имя файла, например: `open(‘ram:myfile’)`/`open(‘memory:myfile’)` или `open(‘sharedmemory:myfile’)` [в первом случае файл виден только данному приложению и всем приложениям, запущенным из данного, а во втором — файл виден всем сторонним приложениям[[[, запущенным ранее]]]].

2017.11.22 10:03:36
Насчёт файлов. Открытие в текстовом и в двоичном режиме.
Предварительные мысли по этому поводу:
Вообще говоря, текстовых файлов не существует на уровне операционных систем как Unix/Linux (там "rt" и "rb" работают абсолютно одинаково), так и в Windows {все вызовы fopen/fread/fwrite являются просто обёртками над системными CreateFile/ReadFile/WriteFile, на уровне которых никакого признака текстовых файлов нет}. Это [[[ошибка]]]различие между текстовыми и двоичными файлами в Windows [[[в прослойке]]]лишь на уровне crt {к счастью, crt полностью открыта и в случае необходимости можно спокойно посмотреть её исходный код в `C:\Program Files (x86)\Microsoft Visual Studio ??.0\VC\crt\src\`}, которую [crt] я категорически рекомендую не использовать вообще {у меня большие сомнения в эффективности реализации crt:
1. Аллокатор памяти, реализованный в malloc/free, чудовищно неэффективный[http://alextretyak.github.io/ltalloc/wiki_ru.htm#1._Аллокатор_ltalloc_быстрее_других_алл].
2. Функции sprintf, sscanf, itoa и др. работают очень медленно[https://www.zverovich.net/2013/09/07/integer-to-string-conversion-in-cplusplus.html <- google:‘performance of itoa’], и к тому же, зависят от текущей локали[[[, что только мешает разработке кроссплатформенных программ]]].
}, а работать напрямую с функциями операционной системы (CreateFile, ReadFile и т.д.)[[[, так как никакая прослойка не добавляет понимания, а только скрывает/абстрагирует, а понимание таких вещей нам [разработчикам компилятора] нужно максимально полное]]] {2019.01.27/ впрочем, для поддержки других [отличных от Windows] операционных систем, стандартные функции работы с файлами использовать придётся, если не хочется ‘возиться с прерываниями/сигналами’[https://stackoverflow.com/questions/1658476/c-fopen-vs-open#comment89381165_2771962 <- google:‘low level fopen linux’]}.

>[http://php.net/manual/ru/function.fopen.php <- [http://php.net/manual/ru/function.file-put-contents.php]:‘LOCK_EX Получить эксклюзивную блокировку на файл на время записи. Другими словами, между вызовами fopen() и fwrite() произойдет вызов функции flock(). Это не одно и то же, что вызов fopen() с флагом "x".’ <- [http://php.net/manual/ru/function.flock.php]:‘In fact, i was locking file when writing it (file_put_contents third arg)’ <- google:‘php file locks’ <- пытался/думал сделать check_task_6 по-честному на PHP с flock]:‘
Т‘‘‘*‘Замечание:’
Из соображений портируемости, настоятельно рекомендуется всегда использовать флаг 'b' при открытии файлов с помощью *‘fopen()’.’’’
Т‘‘‘*‘Замечание:’
Кроме того, из соображений портируемости, также настойчиво рекомендуется переписать старый код, который полагается на режим ~‘'t'’, чтобы вместо этого он использовал правильные концы строк и режим ~‘'b'’.’’’
’

>‘How can I read a file with Ruby?[[[ [closed]]]]’[http://web.archive.org/web/20161130235144/https://stackoverflow.com/questions/7157207/how-can-i-read-a-file-with-ruby <- https://stackoverflow.com/questions/7157207/how-can-i-read-a-file-with-ruby <- google:‘read file ruby’ <- смотрел где у меня в Python-коде используется open("wb"), а где open("wt") и для чего, и решил посмотреть, а что в Ruby с чтением файлов]:‘
```
contents = File.read('filename')
```
...
I had *‘problems with this method on Windows’ reading some binary files with Ruby 1.8.7 Seems like it reads file in text mode, so sometimes I received only part of the file as a result. So I decided to use `File.open(path_to_file, 'rb')` as more safe on Windows for reading binary files.’

>[https://ru.wikibooks.org/wiki/Ruby/Работа_с_файлами <- google:‘read file ruby’]:‘
В своих операционных системах фирма Microsoft ввела понятие «двоичный файл», но оно порождает больше проблем, чем удобств. Особенно при создании кроссплатформенных приложений.’

[[[< ]]]Видно, что понимание по этому вопросу уже достаточно вызрело, и я считаю, что пришла пора признать, что концепция разделения файлов на текстовые и двоичные оказалась несостоятельной и не имеет смысла. [А Microsoft стоит поправить наконец Notepad, чтобы он нормально читал файлы с \n разделителями строк [[[(:]]]:).]

Остаётся проблема/вопрос с кодировками.
Пока предлагаю такой вариант: если кодировка не указана при открытии файла, то считать её utf-8-without-signature на запись и utf-8-with-signature/utf-8-with-BOM или utf-8-without-signature на чтение {думал на тему автоопределения кодировки, или хотя бы для 1251 сделать быстрое определение, но хотя сделать такое может и не сложно, но это только породит проблемы и неоднозначности в дальнейшем — советую переводить все текстовые файлы [[[с исходными текстами]]] в utf-8 и не думать об [[[микро-]]]экономии места}. Кодировку удобнее указывать при открытии файла (`open(...)` или `File(...)`), а не при записи (`write(...)`), так как запись часто удобно делать не одним вызовом `write(...)` в конце, а по мере необходимости. Чтение обычно нужно либо целиком (одним вызовом `read()`), либо посредством `readlines()`, либо двоичное, в котором кодировки роли не играют. Таким образом, получаем:
`File.read()` читает файл целиком и возвращает текстовую строку в указанной кодировке (указывать размер как в Python смысла не вижу — во-первых, размер в чём? в символах или в байтах? в Python это зависит от способа открытия файла ("b" или "t"), но такого различия файлов (на текстовые и двоичные) я считаю быть не должно; и во-вторых, а как это практически использовать при чтении текста?)
`File.read(object)` читает из файла объект размером T(object).size байт и возвращает 1B или 0B, а если возвращаемое значение не используется {нужна перегрузка по возвращаемому значению, хотя бы по факту используется оно или не используется}, то функция бросает исключение.

Хотя, впрочем, разделение на текстовые и двоичные файлы можно оставить, только вынести его [это разделение] на уровень компиляции:
Если к файлу было обращение read(), то он помечается как текстовый и дальнейший вызов read(object) порождает ошибку на этапе компиляции и наоборот.
Если к файлу было обращение write(object), то write(String) также породит ошибку, и если нужно записать строку, тогда нужно писать write(str.encode('utf-8')), а точнее надо думать... так как строки в двоичных файлах могут быть вообще без завершающего нуль-символа, могут быть фиксированного размера и т.д.

Можно заметить, что из-за нечёткости понятия текстовых и двоичных файлов, его используют как хотят [по-разному]:
. В VC\crt признак текстового файла означает, что \n заменяется на \r\n при записи, а \r\n заменяется на \n при чтении.
. В Python признак двоичного файла (`"rb"` в функции `open()`) означает, что функция `read()` вернёт объект типа `bytes`, а не `str`.
[[[
К вопросу о том, что я предлагаю флаги/режим открытия файла не указывать явно, а выводить из его использования:
#(11l)‘
V fstr = File(fname).read() // equivalent to A fstr = File(fname, ‘r’).read()
File(fname).write(contents) // equivalent to File(fname, ‘w’).write(contents)
’
Если сомневаетесь, что [[[предложенная мной]]]данная концепция будет работать, тогда давайте разбирать проблемные случаи на конкретных примерах. Если ваши примеры большие, давайте большие, но конкретные примеры. Если это какой-то легаси-код, который всё равно нужно отрефакторить, то такой пример не нужен, так как одна из приоритетных задач при разработке нового языка программирования — стимулирование [новичков] к написанию хорошего кода, а не поддержка работоспособности плохого кода. Я утверждаю, что в хорошем коде всегда можно определить с каким намерением был открыт файл: для чтения или для записи или для чтения и записи одновременно.

[В некотором роде, то, что я предлагаю[[[ {речь о том, что флаги открытия файла можно не указывать явно, а выводить из его использования}]]], можно свести к простой проверке на этапе компиляции, то есть оставить при открытии файлов обязательное указание признака ‘для чтения’ или ‘для записи’, но выдавать ошибку компиляции при обращении к методу `read()` для файлов, открытых для записи, и при обращении к методу `write()` для файлов, открытых для чтения. Но я настоятельно рекомендую пропустить этот промежуточный шаг и сделать, таким образом, сразу два шага вперёд, дабы дать программистам возможность хотя бы такого небольшого сокращения кода как опускание указания режима открытия файлов.]]закомментировал, так как проблема с определением режима открытия файла есть с args_outfile в pqmarkup.py — необходимо заглянуть в функцию to_html, чтобы увидеть какие методы вызываются для args_outfile]]
2017.12.08 10:06:47
[["C:\Users\DNS\Downloads\Python-3.6.3\Lib\_pyio.py"]:‘newline is a string controlling how universal newlines works ...’ <- Find what: newline Look in: C:\Users\DNS\Downloads\Python-3.6.3 <- решил поискать как обрабатывается `;` в Python lexical analyzer]
Возможно, стоит сделать также при чтении файла в текстовые строки (read()/readlines()).

2018.10.09 08:56:56
[Мысли по поводу] "\r\n" vs "\n" and "wt" vs "wb" and "rt" vs "rb"
Я считаю, что пришла пора подвести некоторые [[[промежуточные]]] итоги по данному вопросу и сделать выводы на основе текущего положения вещей в сфере ИТ.
Приведу такие 4 факта:
1. В Windows (как минимум с Windows XP) при выводе в консоль (через printf или std::cout) символ '\r' не требуется для перевода на новую строку (достаточно символа '\n').
2. В Windows (как минимум с Windows XP) корректно обрабатываются bat/cmd-файлы с Unix line endings (т.е. только '\n', а не "\r\n").
3. В Wordpad на Windows (как минимум с Windows XP) поддерживаются текстовые файлы с Unix line endings, и единственной достаточно популярной программой, которая их не поддерживает, оставался Notepad\Блокнот.
4. В Windows 10 начиная с этого года ‘Microsoft наконец-то добавила поддержку Unix line endings в Notepad\Блокнот’[https://blogs.msdn.microsoft.com/commandline/2018/05/08/extended-eol-in-notepad/]! [Для полного счастья осталось дождаться, когда наконец в консоли Windows можно будет использовать прямой слэш вместо обратного [речь о поддержке и прямого и обратного слэшей одновременно] {причём[https://stackoverflow.com/questions/10523708/why-does-the-cmd-exe-shell-on-windows-fail-with-paths-using-a-forward-slash <- google:‘windows console support forward slashes’] некоторые команды (например md) понимают прямой слэш, а некоторые (например type и dir) — не понимают}.]

Таким образом, Unix line endings являются более универсальными и перспективными, так как поддерживаются всеми операционными системами. А потому сохранять все текстовые файлы я предлагаю только с разделителями строк в стиле Unix. [Рассматривая эту проблему с другой стороны — [[[очевидно[?]/]]]предполагаю, что в отдалённой перспективе (через 50-100 лет) Unix line endings постепенно полностью вытеснят {т.е. все программы под Windows будут сохранять текстовые файлы только с разделителями строк в стиле Unix} Windows line endings.]
Это снимает вопрос "wt" vs "wb", так как "wt" актуально только под Windows и только для старых версий Блокнота.

Теперь к вопросу "rt" vs "rb".
Так как файлы с Windows line endings пока ещё не вышли из оборота [так как ‘многие редакторы’[‘в том числе Microsoft Visual Studio’] под Windows сохраняют текстовые файлы с Windows line endings по умолчанию], я считаю оправданным поддерживать чтение таких файлов. [[[Предлагаю]]]Можно использовать способ, который именуется в Python ‘universal newlines’ (при его задействовании пара символов "\r\n" а также '\r' за которым не следует '\n', преобразуется в один символ '\n'), но так как "\r" без "\n" использовался только в старых версиях MacOS и ныне практически не встречается в существующих текстовых файлах, я предлагаю просто вырезать все символы "\r".

2018.10.09 20:42:30
>‘Python [[[3.7.0 ]]]Documentation’[https://docs.python.org/3/library/functions.html#open]:‘... the bytes having been first decoded using a platform-dependent encoding or using the specified ~‘encoding’ if given.
... The default encoding is platform dependent...’
Это ошибка. Выбирать platform-dependent encoding по умолчанию нельзя, так как это помешает копированию файлов между различными операционными системами {файл, сгенерированный на одной системе, не будет корректно читаться на другой}, а также это плохо дружит с системами контроля/управления версиями {при хранении сгенерированных файлов в системе управления версиями будет ошибочно предлагаться закоммитить файл, сгенерированный и закоммиченный на другой системе}. Сгенерированные, используя одинаковый код, на [[[разных/]]]различных системах файлы должны быть бинарно одинаковы.
