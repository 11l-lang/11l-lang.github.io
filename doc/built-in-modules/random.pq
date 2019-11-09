[[[H‘Module random’
]]]H‘Module random’


random:(stop = 1)
Return a random number in range [[[(]]]0‘[0, stop)’'‘<!--]-->’'.

random:(start .< stop)
Return a random number in range [[[(]]]0‘[start, stop)’'‘<!--]-->’'.

random:(min .. max)
Return a random number in range 0‘[min, max]’.

random.*‘shuffle’(&seq)
Shuffle the sequence `seq` in place.

random.*‘choice’(seq)
Return a random element from the non-empty sequence `seq`.
