

import Foundation



var array = [1,3,5,2,4]
//print(bubbleSort(array))
//print(selectionSort(array))
//print(insertionSort(array))
//print(quickSort(array))
//print(mergeSort(array))
//print(countingSort(array, array.max()!))
//var heap = MaxHeap<Int>()
//array.forEach {
//    heap.insert($0)
//}
//print(heap.sorted())
var linkedList = SingleLinkedList<Int>()
linkedList.append(1)
linkedList.append(2)
linkedList.append(3)
linkedList.remove(with: 1)
linkedList.display()
