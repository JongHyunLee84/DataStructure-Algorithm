import Foundation

// 연결리스트를 사용해서 구현
public struct QueueWithLinkedList {
    let linkedList = DoubleLinkedList<Int>()
    
    public init() {}
    
    public func enqueue(_ value: Int) {
        linkedList.insertLast(value)
    }
    
    public func dequeue() -> Int? {
        linkedList.removeFirst()
    }
    
    public var peek: Int? {
        linkedList.head?.value
    }
    
    public var isEmpty: Bool {
        linkedList.head == nil
    }
    
    public var count: Int {
        linkedList.count
    }
    
    public func clear() {
        linkedList.head = nil
        linkedList.tail = nil
    }
    
    public func print() {
        linkedList.print()
    }
}
