[[[H‘Module random’
]]]H‘Module random’


random:*‘seed’(s)
Seeds the pseudo-random number generator with the value `s`.[[[This sentence is based on [https://en.cppreference.com/w/cpp/numeric/random/srand].]]]

random:(stop = 1.0)
Return a random number in range [[[(]]]0‘[0, stop)’'‘<!--]-->’'.

random:(start .< stop)
Return a random number in range [[[(]]]0‘[start, stop)’'‘<!--]-->’'.

random:(min .. max)
Return a random number in range 0‘[min, max]’.

random:*‘shuffle’(&seq)
Shuffle the sequence `seq` in place.

random:*‘choice’(seq)
Return a random element from the non-empty sequence `seq`.
