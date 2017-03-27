//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

extension TreeNode {
    enum TreeTraversalOrder {
        case inOrder, preOrder, postOrder
    }
    
    func dfsPrint(order: TreeTraversalOrder) {
        dfsPreHelper(node: self, order: order)
    }
    
    func dfsPreHelper(node: TreeNode?, order: TreeTraversalOrder) {
        guard let currentNode = node else {
            return
        }
        switch order {
        case .preOrder:
            print(currentNode.key)
            dfsPreHelper(node: currentNode.left, order: order)
            dfsPreHelper(node: currentNode.right, order: order)
        case .inOrder:
            dfsPreHelper(node: currentNode.left, order: order)
            print(currentNode.key)
            dfsPreHelper(node: currentNode.right, order: order)
        case .postOrder:
            dfsPreHelper(node: currentNode.left, order: order)
            dfsPreHelper(node: currentNode.right, order: order)
            print(currentNode.key)
        }
    }
    
    func bfsPrint() {
        let myQueue = Queue<TreeNode>()
        let root = self
        myQueue.enQueue(newElement: root)
        while !myQueue.isEmpty() {
            guard let currentNode = myQueue.deQueue() else {
                continue
            }
            print(currentNode.key)
            if let left = currentNode.left {
                myQueue.enQueue(newElement: left)
            }
            if let right = currentNode.right {
                myQueue.enQueue(newElement: right)
            }
            
        }
    }
    
}

let root = TreeNode(key: 1)
let nodeTwo = TreeNode(key: 2)
let nodeThree = TreeNode(key: 3)
let nodeFour = TreeNode(key: 4)
let nodeFive = TreeNode(key: 5)

root.left = nodeTwo
root.right = nodeThree
nodeTwo.left = nodeFour
nodeTwo.right = nodeFive



root.dfsPrint(order: .inOrder)
root.bfsPrint()
