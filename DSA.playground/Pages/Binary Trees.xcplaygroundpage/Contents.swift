//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class TreeNode {
    var key: Int!
    var left: TreeNode?
    var right: TreeNode?
    init(key: Int) {
        self.key = key
    }
    
    func isBST() -> Bool {
        return bstHelper(node: self)
    }
    
    private func bstHelper(node: TreeNode?, acceptableMin: Int = Int.min, acceptableMax: Int = Int.max) -> Bool {
        
        // base case
        guard let currentNode = node else { return true }
        
        if currentNode.key < acceptableMin || currentNode.key > acceptableMax {
            return false
        }
        
        // recursive call
        return bstHelper(node: currentNode.left, acceptableMin: acceptableMin, acceptableMax: currentNode.key - 1) && bstHelper(node: currentNode.right, acceptableMin: currentNode.key + 1, acceptableMax: acceptableMax)
    }
    
    
}



func printKeys(_ root: TreeNode?) {
    guard let currentNode = root else { return }
    
    //    // preorder traversal
    //    print(currentNode.key)
    //    printKeys(currentNode.left)
    //    printKeys(currentNode.right)
    
    //    // postorder
    //    printKeys(currentNode.left)
    //    printKeys(currentNode.right)
    //    print(currentNode.key)
    
    // inorder
    printKeys(currentNode.left)
    print(currentNode.key)
    printKeys(currentNode.right)
}

func printWhenFound(in root: TreeNode?, target: Int) {
    guard let currentNode = root else { return }
    
    print(currentNode.key)
    if currentNode.key == target {
        print("I found it")
    }
    printWhenFound(in: currentNode.left, target: target)
    printWhenFound(in: currentNode.right, target: target)
}

func findNodeBinarySearch(root: TreeNode?, target: Int) -> TreeNode? {
    guard let currentNode = root else { return nil }
    
    if target > currentNode.key {
        return findNodeBinarySearch(root: currentNode.right, target: target)
    } else if target < currentNode.key {
        return findNodeBinarySearch(root: currentNode.left, target: target)
    } else {
        return currentNode
    }
}



// Binary Tree
/*
 100
 7            14
 2   6        9
 5  11    4
 
 */
let root = TreeNode(key: 100)
let nodeOne = TreeNode(key: 7)
let nodeTwo = TreeNode(key: 14)
root.left = nodeOne
root.right = nodeTwo
let nodeThree = TreeNode(key: 2)
let nodeFour = TreeNode(key: 6)
nodeOne.left = nodeThree
nodeOne.right = nodeFour
let nodeFive = TreeNode(key: 9)
nodeTwo.left = nodeFive
let nodeSix = TreeNode(key: 5)
let nodeSeven = TreeNode(key: 11)
nodeFour.left = nodeSix
nodeFour.right = nodeSeven
let nodeEight = TreeNode(key: 4)
nodeFive.left = nodeEight


/*
 8
 3       10
 1   6        14
 4  7    13
 
 
 */
// Binary Search Tree
let bstRoot = TreeNode(key: 8)
let bstOne = TreeNode(key: 3)
let bstTwo = TreeNode(key: 10)
bstRoot.left = bstOne
bstRoot.right = bstTwo
let bstThree = TreeNode(key: 1)
let bstFour = TreeNode(key: 6)
bstOne.left = bstThree
bstOne.right = bstFour
let bstFive = TreeNode(key: 14)
bstTwo.right = bstFive
let bstSix = TreeNode(key: 4)
let bstSeven = TreeNode(key: 7)
bstFour.left = bstSix
bstFour.right = bstSeven
let bstEight = TreeNode(key: 13)
bstFive.left = bstEight

findNodeBinarySearch(root: bstRoot, target: 13)


root.isBST()
bstRoot.isBST()
