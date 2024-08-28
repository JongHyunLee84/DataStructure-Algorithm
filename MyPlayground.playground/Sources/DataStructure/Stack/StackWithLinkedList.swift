import Foundation

public struct StackWithLinkedList<T> {
    private var linkedList = SingleLinkedList<T>()
    
    public init() {}
    
    public var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    public var count: Int {
        linkedList.count
    }
    
    public mutating func push(_ value: T) {
        linkedList.insertFront(value)
    }
    
    public mutating func pop() -> T? {
        linkedList.removeFirst()
    }
    
    public var top: T? {
        linkedList.head?.value
    }
}
