[[[H‘T/type’
]]]H‘T/type keyword’


#(11l)‘
T <type name>
   String s // type variable
   . String ps // private variable [rationale: dot is used for hidden files and folders in Unix]
   F (s) // constructor
      .s = s
   F get_s_len() // type function
      R .s.len
’

[Because `T` and `type` are keywords in 11l, use can use `Ty` and `type_name` instead.]


H(-1)‘Type aliases’

#(11l)‘
T Tuple2[T Ty] = Tuple[Ty, Ty]
’


H‘T/type subkeywords’


`T.enum`/`type.enum` is used [[[for enumeration declaration]]][[[https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/enum:]]]to declare an enumeration, a distinct type that consists of a set of named constants called the enumerator list.
#(11l)‘
T.enum TokenCategory
   NAME
   KEYWORD
   CONSTANT
   TEST_CATEGORY = 10
’
[Enumerators `NAME`, `KEYWORD` and `CONSTANT` have values 0, 1 and 2 respectively.]

`T`/`type` also[[[>[https://context.reverso.net/перевод/английский-русский/also+has]:‘also has...также имеет’]]] has subkeywords `base` and `interface`, but they are not supported yet.
