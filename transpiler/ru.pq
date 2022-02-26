[[[Н‘Транспайлер Python → 11l → C++’]]]
><‘Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Python_logo_and_wordmark.svg/250px-Python_logo_and_wordmark.svg.png’Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/U%2B2192.svg/100px-U%2B2192.svg.png’Р‘https://avatars1.githubusercontent.com/u/22068453?s=150’Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/U%2B2192.svg/100px-U%2B2192.svg.png’Р‘https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/125px-ISO_C%2B%2B_Logo.svg.png’’


Транспайлер Python → 11l → C++ состоит из двух транспайлеров:
1. Транспайлер Python → 11l, который переводит код на языке Python в код на новом языке программирования 11l.
2. Транспайлер 11l → C++, который переводит код на языке 11l в C++ [который затем компилируется в машинный код].

В некотором смысле язык 11l выступает в роли промежуточного языка, но, так как он очень похож и близок к языку Python (правда семантически, а не синтаксически), то специально изучать его, в общем-то, не требуется.

Следует отметить, что особенностью данного транспайлера является то, что он генерирует человекочитаемый код на C++, что упрощает отладку написанной программы.

><‘T‘‘‘><‘‘Производительность’{

<>‘Вот результаты для ‘программы преобразования пк-разметки в HTML’[https://sourceforge.net/p/pqmarkup/code/ci/default/tree/pqmarkup.py <- https://sourceforge.net/p/pqmarkup/code/ <- https://bitbucket.org/pqmarkup/pqmarkup] (в качестве исходных данных был взят исходник ‘статьи по пк-разметке’[https://habr.ru/post/348218/]):
Р‘https://gist.githubusercontent.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/da5d89013d3915dd2f4f14d011007d4adfea0e02/chart2.png’
[‘Вот архив’[https://gist.github.com/alextretyak/5524244126944a4c39f70341ef21b87a/raw/e6cb2f07446ef4a19a3d6cdc1f8c483287ef1308/perf_tests.7z] с использовавшейся программой для сравнения производительности [под Windows] (требуются установленный Python 3.6 или выше и следующие Python-пакеты: pywin32, cython).]
’
}’’’’

T‘‘‘><‘*‘[[[Установка/]]]Скачать’

<>‘Вот последняя версия пары транспайлеров Python → 11l и 11l → C++: _‘11l.tar.xz[https://bitbucket.org/11l-lang/11l/downloads/11l.tar.xz]’ [‘репозитории с исходниками’[https://github.com/11l-lang]].

Использование:
1. Распакуйте архив в [[[директорию]]/]каталог по вашему выбору.
2. Откройте терминал/консоль/‘командную строку’.
3.‘Выполните команду:
`<путь_до_каталога_с_распакованным_архивом>\11l <исходный_файл_на_python_или_11l>` в Windows или
`<путь_до_каталога_с_распакованным_архивом>/11l <исходный_файл_на_python_или_11l>` в Linux.’

!‘Возникли [[[трудности/]]]проблемы с компиляцией вашей программы на Python[[[ или 11l]]]? Прочтите ‘это руководство’[./guide].
Если вы не нашли в нём решение [[[вашей/]]]своей проблемы, тогда ‘напишите на форуме’[http://forum.11l-lang.org/forums/Помощь.7/].’’
’’’’’
