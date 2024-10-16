import Foundation

// Binary Tree와 Binary Search Tree 차이
// Binary Tree: 자식 노드가 두 개 이하인 트리
// Binary Search Tree: Binary Tree 조건 + 왼쪽 자식은 더 작은 값, 오른쪽은 더 큰 값이 들어간 트리

public class BinaryNode<Element> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
    
    // 재귀적으로 해당 노드를 기준으로 가장 작은값 반환, 만약 nil 이라면, 현재의 자기 자신 노드 반환
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

extension BinaryNode {
    
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}


public struct BinarySearchTree<T: Comparable> {
    public private(set) var root: BinaryNode<T>?
    public init() {}
    
    public var description: String {
        return root?.description ?? "empty tree"
    }
    
    public mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
        
    }
    
    private mutating func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {

        guard let node = node else { return BinaryNode(value: value) }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
    public func contains(_ value: T) -> Bool {
        var current = root

        while let node = current {
            if node.value == value {
                return true
            }

            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    public mutating func remove(_ value: T) {
        root = remove(node: root, value: value)
    }
    
    private mutating func remove(node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
        guard let node else { return nil }

        if value == node.value {
            /// 단말 노드인 경우(= 자식 노드 X) -> nil을 반환하여 해당 BinaryNode를 nil로 만들어주어서, 레퍼런스 카운트를 지운다.
            if node.leftChild == nil && node.rightChild == nil { return nil }
            
            /// 왼쪽 자식 노드가 없는 경우, 현재의 해당 node를(이때 노드 독립적으로 가리키는게 아니라, 부모노드의 왼쪽 혹은 오른쪽 으로 가리켜져 있음) 지우려고 하는 노드의 오른쪽 노드를 할당해줌, 부모 노드를 지우고 새로 할당하고 할 필요가 없어짐..
            if node.leftChild == nil { return node.rightChild }
            if node.rightChild == nil { return node.leftChild }
            
            /// 지우려고 하는 노드가 두개의 자식 노드를 가지고 있는 경우
            /// 현재 노드의 값을, 해당 노드의 오른쪽 서브 트리중에서 가장 작은 값으로 대체하고
            node.value = node.rightChild!.min.value
            // 값을 변경하고, 변경한 값을 가지고 있는 Node를 교체하기 위해서 rightChild를 오른쪽 트리의 가장 최솟값으로 remove 재귀호출함..
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}
