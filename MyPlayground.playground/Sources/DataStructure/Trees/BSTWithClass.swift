import Foundation

// Tree 개념
// 부모 노드가 없으면 root node, 자식 노드가 없으면 leaf node
// 트리는 노드 간 사이클이 발생하지 않는다. 사이클이 발생한다면 그래프이다.
// 즉, 트리는 간단한 형태의 그래프이다. linked list 또한 간단한 버전의 트리이다.

// Binary Tree 개념
// 자식 노드가 2개 이하인 노드로 구성됨.

// Binary Search Tree 개념
// 삽입, 삭제 시 항상 정렬된 형태로 수행되는 Binary Tree
// 왼쪽은 항상 부모 노드보다 작고, 오른쪽은 항상 부모 노드보다 크다는 원칙

// 삽입 시 :
//  루트 노드부터 삽입될 노드와 대소 비교 후 작으면 왼쪽, 크면 오른쪽으로 계속 해서 반복한다. 더 이상 비교할 자식 노드가 없을 때 해당 위치에 위치하게 된다.
// 시간복잡도는 O(h)로 h는 해당 트리의 height를 의미한다. 

// 삭제 시 :
//  삭제된 노드를 기준으로 왼쪽에서 가장 큰 값 또는 오른쪽에서 가장 작은 값으로 대체하여 BST 원칙을 유지시킨다.
//  만약 자식 노드가 없다면 그냥 삭제됨.
 
public class BSTWithClass<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BSTWithClass? // TODO: cycle check
    private(set) public var left: BSTWithClass?
    private(set) public var right: BSTWithClass?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        parent == nil
    }
    
    public var isLeaf: Bool {
        left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        parent?.left === self
    }
    
    public var isRightChild: Bool {
        parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        left != nil
    }
    
    public var hasRightChild: Bool {
        right != nil
    }
    
    public var hasAnyChild: Bool {
        hasLeftChild || hasRightChild
    }
    
    public var hasBothChild: Bool {
        hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    
}
