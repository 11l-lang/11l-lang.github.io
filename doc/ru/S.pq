[[[Н‘S/switch’
]]]Н‘[[[http://cppstudio.com/post/306/ <- google:‘c++ switch’]]]Оператор множественного выбора S/switch’


#(11l)‘
S <выражение>
   <константное выражение 1>
      <блок кода 1>
   <константное выражение 2>
      <блок кода 2>
   ...
   [E
      <блок кода в противном случае>]
’

Выражение `<выражение>` сравнивается с константными выражениями и в случае равенства выполняется соответствующий блок [[[операторов]]]кода. Если ни одно константное выражение не совпало с выражением `<выражение>`, то выполняется [при его наличии] `<блок кода в противном случае>` (отмеченный ключевым словом `E`/`else`).

Оператор `S`/`switch` можно использовать в выражениях:
#(11l)‘
V tag = S prevc
           ‘*’
              ‘b’
           ‘_’
              ‘u’
           ‘-’
              ‘s’
           ‘~’
              ‘i’
’
Или в одну строку. Так:
#(11l)‘
V tag = S prevc {‘*’ {‘b’}; ‘_’ {‘u’}; ‘-’ {‘s’}; ‘~’ {‘i’}}
’
или так:
#(11l)‘
V tag = S prevc {‘*’ {‘b’} ‘_’ {‘u’} ‘-’ {‘s’} ‘~’ {‘i’}}
’

Если ваш switch получился слишком большим и он не помещается на экран, тогда вы можете добавить комментарий к каждому "case":
#(11l)‘
S message
   WM_CREATE // case
      ...
   WM_DESTROY // case
      ...
   WM_KEYDOWN // case
      ...
   ...
   E // case
      ...
’
‘Или таким образом’{
#(11l)‘
S message
   \(case) WM_CREATE // create window
      ...
   \(case) WM_DESTROY // destroy window
      ...
   \(case) WM_KEYDOWN // key pressed
      ...
   ...
   \(case) E
      ...
’
}
