import Foundation

// Stack 두개로 Queue를 구현했을 때 장점
// dequeue 시에 stack 하나를 reverse 하여 전달해서 특정 경우에(이미 reverse해서 넘겨준 경우에)
// O(1)로 dequeue가 가능하다. 

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
