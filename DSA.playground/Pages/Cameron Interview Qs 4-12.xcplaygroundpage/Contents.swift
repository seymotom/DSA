//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// 2. Create a binary search tree (BST) and write a method that prints its elements in order. The printed output must appear all on one line.

// This is the whiteboarded solution. Can you think of other ways to solve this?
class TreeNode {
    var value: Int?
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    // Constructor added for convenience.
    init(value: Int? = nil, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        leftChild = left
        rightChild = right
    }
}

func printInOrder(_ treeNode: TreeNode?) {
    guard let validTreeNode = treeNode else { return }
    printInOrder(validTreeNode.leftChild)
    // Note: added force-unwrap of value to avoid "Optional(_)" in output.
    print(validTreeNode.value!, terminator: " ")
    printInOrder(validTreeNode.rightChild)
}

// We didn't find a solution to the iterative version during the session, but I think we were heading in the right direction. Here's one way to solve it.
func printInOrderIterative(_ treeNode: TreeNode?) {
    if treeNode == nil {
        // If the root node is nil, we have nothing to do.
        return
    }
    var stack: [TreeNode] = []
    var currentNode = treeNode
    // Loop until we're done (see break statement below).
    while true {
        // Traverse left from current, pushing each node onto the stack.
        while currentNode != nil {
            stack.append(currentNode!)
            currentNode = currentNode?.leftChild
        }
        // Pop a node off of the stack and set it to current. This is the leftmost node we haven't printed yet.
        currentNode = stack.popLast()
        if currentNode == nil {
            // If there is nothing on the stack, we're done.
            break
        }
        // Print the current node's value.
        print(currentNode!.value!, terminator: " ")
        // Traverse right and repeat all of the above.
        currentNode = currentNode?.rightChild
    }
    // Flush stdout.
    print()
}

// Helper function and sample case below were not part of the whiteboarded code.

func doPrintInOrder(_ treeNode: TreeNode?) {
    printInOrder(treeNode)
    // This line added to flush stdout (nothing prints otherwise).
    if treeNode != nil { print() }
}

let root = TreeNode(
    value: 10,
    left: TreeNode(
        value: 6,
        left: TreeNode(value: 4),
        right: TreeNode(value: 8)
    ),
    right: TreeNode(
        value: 14,
        left: TreeNode(value: 12),
        right: TreeNode(value: 16)
    )
)

doPrintInOrder(root)
doPrintInOrder(nil)

printInOrderIterative(root)
printInOrderIterative(nil)
