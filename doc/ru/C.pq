[[[H‘C/in’
]]]H‘Ключевое слово C/in’


#(11l)‘element C container’ возвращает истину/1В если `element` *‘с’одержится в `container`.
#(11l)‘element !C container’ возвращает ложь/0В если `element` не *‘с’одержится в `container`.

Обратите внимание, что такой код:
#(11l)‘
I source[i] C ‘a’..‘z’ | source[i] C ‘A’..‘Z’ | source[i] C ‘0’..‘9’ | source[i] == ‘_’
   ...
’
можно сократить до:
#(11l)‘
I source[i] C (‘a’..‘z’, ‘A’..‘Z’, ‘0’..‘9’, ‘_’)
   ...
’
