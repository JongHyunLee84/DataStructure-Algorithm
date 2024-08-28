import Foundation

// LIFO (Last In First Out)
// 삽입, 삭제가 한 방향으로만 이루어짐.
public struct StackWithArray<T> {
    private var elements: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public mutating func push(_ element: T) {
        elements.append(element)
    }
    
    public mutating func pop() -> T? {
        return elements.popLast()
    }
    
    public var top: T? {
        return elements.last
    }
}
