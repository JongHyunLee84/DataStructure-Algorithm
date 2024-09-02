import Foundation

var queue = QueueWithDoubleStack<Int>()

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

queue.peek
queue.dequeue()
queue.peek
queue.dequeue()
queue.peek
queue.dequeue()
queue.isEmpty

