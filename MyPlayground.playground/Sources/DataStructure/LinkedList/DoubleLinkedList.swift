import Foundation

public class DoubleNode<T> {
    var next: DoubleNode?
    var prev: DoubleNode?
    var value: T
}

public class DoubleLinkedList {
    var head: DoubleNode?
    var tail: DoubleNode?
    
    public func insertFront(_ value: T) {
        
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
            Swift.print(currentNode?.value)
            currentNode = currentNode?.prev
        }
    }
}
