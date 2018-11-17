[[[Н‘X/exception’
]]]Н‘Ключевое слово X/exception’


Этот код:
#(11l)‘
T Error
   String message
   F (message)
      .message = message

X.try
   print(‘1’)
   X Error(‘error message’)
   print(‘never printed string’)
X.catch Error e
   print(‘Error: ’e.message)
’
выведет:
```
1
Error: error message
```
