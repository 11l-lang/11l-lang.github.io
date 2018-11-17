[[[H‘X/exception’
]]]H‘X/exception keyword’


This code:
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
will print:
```
1
Error: error message
```
