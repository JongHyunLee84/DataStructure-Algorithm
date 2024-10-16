import Foundation

// BIT (Fenwink Tree)

public struct BinaryIndexedTree {
    public var elements: [Int]
    
    public init(size: Int) {
        self.elements = Array(repeating: 0, count: size + 1)
    }
    
    public init(size: Int, value: Int) {
        self.init(size: size)
        for i in 0..<size {
            update(idx: i, value: value)
        }
    }
    
    public func sum(_ idx: Int) -> Int {
        var idx = idx + 1 // BIT 인덱스로 변환
        var sum = 0
        while idx > 0 {
            sum += elements[idx]
            idx &= idx - 1 // 최하위 bit clear
        }
        
        return sum
    }
    
    public func rangeSum(left: Int, right: Int) -> Int {
        sum(right) - sum(left - 1)
    }
    
    public mutating func update(idx: Int, value: Int) {
        var idx = idx + 1
        while idx < elements.count {
            elements[idx] += value
            idx += (idx & -idx) // 최하위 bit를 더함
        }
    }
}
