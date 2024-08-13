import Foundation

public class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

public class SingleLinkedList<T> {
    private var head: Node<T>?
    
    public init() {}
    
    // head가 없다면 head에 넣고 끝, head가 있다면 새로운 노드를 만들고, 해당 노드의 next에 원래 head 값을, head에는 newNode를 할당
    // O(1)
    public func insertFront(_ value: T) {
        if head == nil {
            head = .init(value: value)
            return
        }
        
        let newNode: Node = .init(value: value)
        newNode.next = head
        head = newNode
    }
    
    // head부터 시작하여 nil이 아니라면 프린트 후 next를 할당, next가 nil이 아니라면 같은 작업 반복
    public func display() {
        var currentNode: Node? = head
        while let tempNode = currentNode {
            print(tempNode.value, terminator: " ")
            currentNode = tempNode.next
        }
        print("")
    }
    
    // 단일 연결리스트일 경우 O(N)
    public func append(_ value: T) {
        if head == nil {
            head = .init(value: value)
            return
        }
        var currentNode = head
        while let tempNode = currentNode?.next {
            currentNode = tempNode
        }
        currentNode?.next = .init(value: value)
    }
    
    public func removeFirst() {
        if let head {
            if let next = head.next {
                self.head = next
            } else {
                self.head = nil
            }
        }
    }
    
    // head를 nil로 할당하면 순서대로 reference count가 0이되기 때문에 모두 메모리에서 해제됨.
    // 이중연결이면 tail 때문에 메모리 해제가 안 될 수도 있음.
    public func removeAll() {
        self.head = nil
    }
    
    public func search(with value: T) -> Node<T>? where T: Equatable {
        if let head {
            var currentNode: Node<T>? = head
            while let tempNode = currentNode {
                if tempNode.value == value {
                    return tempNode
                }
                currentNode = tempNode.next
            }
        }
        return nil
    }
    
    // head를 제거하려할 때만 따로 head와 head.next를 바꿔치기 해준다.
    // 그 다음 node들을 제거하려는 경우 priorNode를 저장하면서 priorNode의 next와 currentNode.next를 연결해주고 currentNode는 return되면서 레퍼 카운트가 0으로 바뀜.
    public func remove(with value: T) -> Node<T>? where T: Equatable {
        if let head {
            if head.value == value {
                self.head = head.next
                return head
            }
            var currentNode: Node<T>? = head
            var priorNode: Node<T>?
            while let tempNode = currentNode {
                if tempNode.value == value {
                    // 삭제
                    priorNode?.next = tempNode.next
                    return tempNode
                }
                currentNode = tempNode.next
                priorNode = tempNode
            }
        }
        return nil
    }
}

