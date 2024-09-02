import Foundation

public struct QueueWithDoubleStack<T> {
    private var enqueueStack = Array<T>()
    private var dequeueStack = Array<T>()
    
    public init() {}
    
    public mutating func enqueue(_ value: T) {
        enqueueStack.append(value)
    }
    
    public mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    public var peek: T? {
        dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }
    
    public var isEmpty: Bool {
        dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    
}
