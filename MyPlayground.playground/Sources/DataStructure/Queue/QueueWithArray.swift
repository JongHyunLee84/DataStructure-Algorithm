import Foundation

// FIFO (First In First Out)
// enqueue: 뒤에 삽입, dequeue: 앞에 삭제
// 구현법: 배열 사용, 연결리스트 사용
// 배열을 통해 removeFirst를 사용했을 때 문제점. 배열의 앞 요소를 삭제함으로써 뒤에 있는 요소들이 앞으로 한 칸씩 이동하기 때문에 O(n)의 비효율적인 시간복잡도 발생함. 따라서 원형큐 개념을 사용함.

// 배열을 이용해서 원형 큐 구현
public struct QueueWithArray {
    private var queue: [Int]
    private var front = 0
    private var rear = 0
    private var count = 0
    let size: Int // 미리 배열의 최대 크기를 지정하게 함.
    
    public init(size: Int) {
        self.size = size
        self.queue = [Int](repeating: 0, count: size)
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var peek: Int? {
        return isEmpty ? nil : queue[front]
    }
    
    public mutating func enqueue(_ element: Int) {
        guard count != size else { Swift.print("queue overflow can't not enqueue \(element)"); return }
        queue[rear] = element
        count += 1
        rear = (rear + 1) % size
    }
    
    public mutating func dequeue() -> Int? {
        guard count != 0 else { return nil }
        let deleted = queue[front]
        count -= 1
        front = (front + 1) % size
        return deleted
    }
    
    public func print() {
        if isEmpty { Swift.print("queue is empty"); return }
        for i in front..<front + count {
            Swift.print(queue[i % size], terminator: " ")
        }
    }
    
    public mutating func clear() {
        count = 0
        front = 0
        rear = 0
    }
}
