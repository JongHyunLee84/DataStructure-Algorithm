import Foundation

var linkedList = DoubleLinkedList<Int>()
linkedList.insertLast(2)
linkedList.insertLast(1)
linkedList.insertLast(3)
linkedList.insert(at: 3, value: 5)
linkedList.reverse()
linkedList.print()
//linkedList.printReverse()
// 2 5 1 3
