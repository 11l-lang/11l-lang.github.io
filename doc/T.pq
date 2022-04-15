[[[H‘T/type’
]]]H‘T/type keyword’


#(11l)‘
T <type name>
   String s // instance variable
   . String ps // private instance variable [rationale: dot is used for hidden files and folders in Unix]
   F (s) // constructor
      .s = s
   F get_s_len() // member function (method)
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


‘Why T/type?’{
I agree with Niklaus Wirth:
>‘A Plea for Lean Software’[https://cr.yp.to/bib/1995/wirth.pdf]:‘*‘Type extension’
... We also avoid introducing an entirely new nomenclature for well-known concepts; for example, we stick to the term ~‘type’, avoiding the word ~‘class’’

In addition, if you look at the definition of the term "class" in C++ {
.‘>[https://en.cppreference.com/w/cpp/language/classes]:‘
A class is a user-defined type.’’
.‘>‘Standard for Programming Language C++’[http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/n4750.pdf]:‘
A class is a type.’’
}, then you can see that a class is just a user-defined type.

And here's another [[[piece/]]]quote from the C# Programming Guide:
>‘Types (C# Programming Guide)’[https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/types/#custom-types]:‘
H‘Custom Types’

You use the struct, class, interface, and enum constructs to create your own custom types.’
}
