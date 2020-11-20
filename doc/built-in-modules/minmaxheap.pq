[[[H‘Modules minheap and maxheap’
]]]H‘Modules minheap and maxheap’


minheap:*‘push’(&array, item)
maxheap:*‘push’(&array, item)
Push the value `item` onto the heap `array`, maintaining the heap invariant.

minheap:*‘pop’(&array)
maxheap:*‘pop’(&array)
Pop and return the smallest/largest item from the heap `array`, maintaining the heap invariant.
To access the smallest/largest item without popping it, use `array[0]`.

minheap:*‘heapify’(&array)
maxheap:*‘heapify’(&array)
Transform `array` into a heap, in-place, in linear time.
