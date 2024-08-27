import Foundation

public class DoubleNode<T> {
    var next: DoubleNode?
    weak var prev: DoubleNode? // 이전 노드와 다음 노드 간 서로의 ref count를 올리기에 레퍼런스 사이클 발생
    var value: T
    
    public init(
        next: DoubleNode? = nil,
        prev: DoubleNode? = nil,
        value: T
    ) {
        self.next = next
        self.prev = prev
        self.value = value
    }
}

public class DoubleLinkedList<T> {
    var head: DoubleNode<T>?
    var tail: DoubleNode<T>?
    
    public init(
        head: DoubleNode<T>? = nil,
        tail: DoubleNode<T>? = nil
    ) {
        self.head = head
        self.tail = tail
    }
    
    public func insertFirst(_ value: T) {
        // 첫 번째 노드라면 head, tail 양 쪽에 저장
        // 아니라면, head의 prev에 newNode
        // newNode의 next에 기존 head
        // head에 newNode
        let newNode = DoubleNode(value: value)
        if head == nil {
            self.head = newNode
            self.tail = newNode
        } else {
            newNode.next = head
            head?.prev = newNode
            head = newNode
        }
    }
    
    public func insertLast(_ value: T) {
        let newNode = DoubleNode(value: value)
        if tail == nil { // head로 비교해도됨
            self.head = newNode
            self.tail = newNode
        } else {
            newNode.prev = tail
            tail?.next = newNode
            tail = newNode
        }
    }
    
    public func removeFirst() -> T? {
        var deletedValue: T!
        if head == nil {
            return nil
        }
        if head?.next == nil {
            deletedValue = head?.value
            head = nil
            tail = nil
            return deletedValue
        }
        deletedValue = head?.value
        head = head?.next
        head?.prev = nil
        return deletedValue
    }
    
    public func removeLast() -> T? {
        var deletedValue: T!
        if tail == nil {
            return nil
        }
        if tail?.prev == nil {
            deletedValue = tail?.value
            head = nil
            tail = nil
            return deletedValue
        }
        deletedValue = tail?.value
        tail = tail?.prev
        tail?.next = nil
        return deletedValue
    }
    
    public func remove(with value: T) -> T? where T: Comparable {
        // value가 head 또는 tail의 value와 같다면 head or tail의 값이 변경되어야하기 때문에 조건으로 빼준다.
        // 그게 아니라 중간에 remove를 하는거라면 next의 값이 nil일 때까지 while문 반복
        // 삭제할 노드의 앞뒤를 다시 연결해주고 삭제할 노드의 value를 리턴
        if head == nil {
            return nil
        }
        if head?.value == value {
            return removeFirst()
        }
        if tail?.value == value {
            return removeLast()
        }
        var deletedValue: T!
        var tempNode: DoubleNode<T>? = head?.next
        while tempNode != nil {
            if tempNode?.value == value {
                deletedValue = tempNode?.value
                tempNode?.prev?.next = tempNode?.next
                tempNode?.next?.prev = tempNode?.prev
                return deletedValue
            } else {
                tempNode = tempNode?.next
            }
        }
        return nil
    }
    
    public func insert(at k: Int, value: T) {
        // 0보다 작거나 count + 1 보다 큰 인덱스에 추가할 수 없으니 그냥 리턴
        if k < 0 || k > count { return }
        if k == 0 {
            insertFirst(value)
        } else if k == count {
            insertLast(value)
        } else {
            var idx = 1
            var currentNode = head?.next
            while idx != k {
                currentNode = currentNode?.next
                idx += 1
            }
            let newNode = DoubleNode(value: value)
            newNode.next = currentNode
            newNode.prev = currentNode?.prev
            currentNode?.prev?.next = newNode
            currentNode?.prev = newNode
        }

    }
    
    public var count: Int {
        if head == nil {
            return 0
        } else {
            var currentNode = head
            var count = 0
            while currentNode != nil {
                count += 1
                currentNode = currentNode?.next
            }
            return count
        }
    }
//    nil
//    Optional(2)
//    Optional(MyPlayground_Sources.DoubleNode<Swift.Int>)
//    ----
//    Optional(MyPlayground_Sources.DoubleNode<Swift.Int>)
//    Optional(1)
//    Optional(MyPlayground_Sources.DoubleNode<Swift.Int>)
//    ----
//    nil
//    Optional(3)
//    Optional(MyPlayground_Sources.DoubleNode<Swift.Int>)
//    ----
//    nil
//    Optional(5)
//    nil
//    ----
    public func reverse() {
        if head == nil || head?.next == nil { return }
        var currentNode = tail // head부터 시작하면 prev가 weak이라 중간에 ref count가 0이 되면서 nil로 변하는 현상 발생 블로그 글쓰기
        while currentNode != nil {
            let prev = currentNode?.prev
            currentNode?.next = prev
            currentNode?.prev = currentNode?.next
            if prev == nil { // 마지막 노드라는 뜻
                head = tail
                tail = currentNode
                return
            } else {
                currentNode = prev
            }

        }
    }
    
    public func print() {
        var currentNode = head
        while currentNode != nil {
            Swift.print(currentNode!.value)
            currentNode = currentNode?.next
        }
    }
    
    public func printReverse() {
        var currentNode = tail
        while currentNode != nil {
            Swift.print(currentNode!.value)
            currentNode = currentNode?.prev
        }
    }
}
