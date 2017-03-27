import Foundation

public class Node<T> {
    var key: T?
    var next: Node<T>?
}

public class LinekdList<T> {
    var head: Node<T>
    var tail: Node<T>
    init() {
        self.head = Node<T>()
        self.tail = head
    }
}

public class Queue<T> {
    private var list = LinekdList<T>()
    
    public init() {
    }
    
    public func enQueue(newElement: T) {
        if list.head.key == nil {
            list.head.key = newElement
            return
        } else {
            let newNode = Node<T>()
            newNode.key = newElement
            list.tail.next = newNode
            list.tail = newNode
        }
    }
    
    public func deQueue() -> T? {
        if let oldHeadKey = list.head.key {
            if let nextNode = list.head.next {
                list.head = nextNode
            } else {
                list.head.key = nil
            }
            return oldHeadKey
        } else {
            return nil
        }
    }
    
    public func isEmpty() -> Bool {
        return list.head.key == nil
    }
    
    public func peek() -> T? {
        return list.head.key
    }
}
