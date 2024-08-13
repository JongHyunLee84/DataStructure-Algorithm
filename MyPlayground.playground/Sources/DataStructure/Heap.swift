import Foundation

struct MinHeap<T: Comparable> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeLast()
        }
        
        let first = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return first
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        
        while child > 0 && elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(of: parent)
            let rightChild = rightChildIndex(of: parent)
            var candidate = parent
            
            if leftChild < elements.count && elements[leftChild] < elements[candidate] {
                candidate = leftChild
            }
            
            if rightChild < elements.count && elements[rightChild] < elements[candidate] {
                candidate = rightChild
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}

public struct MaxHeap<T: Comparable> {
    private var elements: [T] = []
    
    public init() {}
    
    // insert
    // 맨뒤에 추가 후 부모노드와 계속 비교하면서 힙 자료구조 조건에 맞게 스왑
    public mutating func insert(_ element: T) {
        self.elements.append(element)
        self.shiftUp(elements.count - 1)
    }
    
    // pop
    // 맨 앞과 맨 뒤를 스왑 후 맨 뒤를 삭제, 맨 앞으로 온 마지막 노드를 다시 힙 자료구조 조건에 맞게하기 위해 위해서부터 재귀적으로 자식노드들과 비교
    public mutating func pop() -> T? {
        if elements.count <= 1 {
            return elements.popLast()
        }
        elements.swapAt(0, elements.count-1)
        let result = elements.removeLast()
        self.shiftDown(0)
        return result
    }
    
    // shiftUp
    // 부모 노드와 비교하여 부모 노드보다 더 크다면 스왑, 다시 스왑된 위치부터 부모 노드와 비교, 마지막 루트 노드에 도달할 때까지
    private mutating func shiftUp(_ childIdx: Int) {
        let parentIdx = (childIdx - 1) / 2
        if childIdx != 0,
           elements[childIdx] > elements[parentIdx] {
            elements.swapAt(childIdx, parentIdx)
            shiftUp(parentIdx)
        }
    }
    
    // shiftDown
    // 자식 노드 두 개(있을 수도, 없을 수도)와 비교하면서 자식 노드 중 더 큰 값이 있다면 스왑, 스왑했다면 스왑된 인덱스의 자식 노드들과 또 다시 반복하면서 자식 노드들과 더 이상 비교할 수 없을 때까지 반복 (자식 노드가 없거나, 부모 노드가 더 크거나)
    private mutating func shiftDown(_ parentIdx: Int) {
        // 자식 노드는 없을 수도, 한 쪽만 있을 수도, 둘 다 있을 수도
        var largeIdx = parentIdx
        let leftIdx = parentIdx * 2 + 1
        let rightIdx = parentIdx * 2 + 2
        
        if leftIdx < elements.count,
           elements[leftIdx] > elements[largeIdx] {
            largeIdx = leftIdx
        }
        
        if rightIdx < elements.count,
           elements[rightIdx] > elements[largeIdx] {
            largeIdx = rightIdx
        }
        
        if largeIdx == parentIdx {
            return
        }
        
        elements.swapAt(parentIdx, largeIdx)
        shiftDown(largeIdx)
    }
    
    private init(elements: [T]) {
        self.elements = elements
    }
    
    // 최상위 노드(== 최댓값)을 pop하며 새로운 배열을 만들고 내림차순으로 정렬된 배열이 만들어지면 뒤집어서 리턴
    public func sorted() -> [T] {
        var temp: Self = .init(elements: self.elements)
        var result: [T] = []
        for _ in 0..<self.elements.count {
            result.append(temp.pop()!)
        }
        return Array(result.reversed())
    }
    
    public func print() {
        Swift.print(self.elements)
    }
}
