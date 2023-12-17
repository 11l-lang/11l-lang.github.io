[[[H‘Module csv’
]]]H‘Module csv’


csv:*‘read’(String ~‘file_name’, ~‘encoding’ = ‘utf-8’, ~‘delimiter’ = ‘,’; 0‘[String]’? &~‘header’ = N)
csv:*‘read’(String ~‘file_name’, ~‘encoding’ = ‘utf-8’, ~‘delimiter’ = ‘,’; ~‘skip_first_row’ = 1B)
csv:*‘read’(File &&~‘file’; ~‘delimiter’ = ‘,’; 0‘[String]’? &~‘header’ = N)
csv:*‘read’(File &&~‘file’; ~‘delimiter’ = ‘,’; ~‘skip_first_row’ = 1B)
Return a reader object which will iterate over lines in the given csv file. The optional ~‘header’ parameter specifies an array that will take the value of the first row of the csv file.
‘Why not csv:Reader()?’{
The object returned by `csv:read()` has no any methods like `csv:Writer.write_row()`, so it is rarely assigned to a variable and is usually used directly as a loop iterable expression.
}

csv:*‘Writer’(String ~‘file_name’, ~‘encoding’ = ‘utf-8’, ~‘delimiter’ = ‘,’)
csv:*‘Writer’(File &&~‘file’; ~‘delimiter’ = ‘,’)
Writer object responsible for converting the user's data into delimited strings in the csv file named ~‘file_name’ or specified in the ~‘file’ parameter.

H(-2)‘csv:Writer object methods’

*‘write_row’(Array ~‘row’)
Write record to the csv file. ~‘row’ is an array of any items which can be converted to String.
