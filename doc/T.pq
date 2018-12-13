[[[H‘T/type’
]]]H‘T/type keyword’


#(11l)‘
T <type name>
   String s // type variable
   F (s) // constructor
      .s = s
   F get_s_len() // type function
      R .s.len
’


H‘T/type subkeywords’


Subkeyword `shared` is used to predeclare shared types:
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
When transpiling Python-code into 11l use prefix `T_shared_` or `type_shared_`:
#(Python)‘
class T_shared_ASTNode:
    pass
’
will be translated to:
#(11l)‘
T.shared ASTNode
’
[I rejected to use notation `class ASTNode: pass # shared` because mypy outputs `error: Name 'ASTNode' already defined`.]

`T`/`type` also has subwords `base`, `enum` and `interface`, but they are not supported yet.
