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


Н‘Ключевые подслова T/type’


Ключевое подслово `shared` используется для предекларации разделяемых типов:
#(11l)‘
T.shared ASTNode

T Symbol
   ...
   (ASTNode -> ASTNode) nud

T ASTNode
   ...
   ASTNode? first_child
   ASTNode? second_child
’
При транспиляции Python-кода в 11l необходимо использовать префикс `T_shared_` или `type_shared_`:
#(Python)‘
class T_shared_ASTNode:
    pass
’
странслируется в:
#(11l)‘
T.shared ASTNode
’
[Использовать запись `class ASTNode: pass # shared` не получилось, так как mypy выдаёт `error: Name 'ASTNode' already defined`.]

Также у `T`/`type` есть подслова `base`, `enum` и `interface`, но они пока что не поддерживаются.
