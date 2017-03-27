//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/*
 Write a function that returns the number of characters matching a target in a String.  Your solution must be recursive.
 Sample input: "hello world", "l"
 Sample output: 3
 */

func matchTargetIn(_ s: String, target: Character) -> Int {
    // base case
    guard s.characters.count > 0 else { return 0 }
    
    let firstChar = s[s.startIndex]
    let restOfS = s.substring(from: s.index(after: s.startIndex))
    let count = firstChar == target ? 1 : 0
    
    // recursive call
    return count + matchTargetIn(restOfS, target: target)
}

matchTargetIn("hello world", target: "l")


/*
 Write a function that has the same functionality as filter(), except your solution must be recursive.
 Sample input: [4,7,2,3], {$0 % 2 == 0}
 Sample output: [4,2]
 */


func filterR<T>(arr: [T], filter: (_ a: T) -> Bool) -> [T] {
    guard arr.count > 0 else { return arr }
    return (filter(arr.first!) ? [arr.first!] : []) + filterR(arr: Array(arr[1..<arr.endIndex]), filter: filter)
}


let x = filterR(arr: [4,7,2,3], filter: {$0 % 2 == 0})






/*
 Review: Write a function that determines if a given value is in a sorted array.  Your solution should be recursive and work in log(n) time.
 */

func contains<T: Comparable>(arr: [T], x: T) -> Bool {
    
    guard !arr.isEmpty else { return false }
    
    let midIndex = arr.count / 2
    let midValue = arr[midIndex]
    if midValue == x {
        return true
    }
    
    if x > midValue {
        return contains(arr: Array(arr[midIndex + 1..<arr.count]), x: x)
    } else {
        return contains(arr: Array(arr[0..<midIndex]), x: x)
    }
}

contains(arr: [1, 2, 3, 4, 5, 6, 7], x: 3)

/*
 liams function...
 guard arr.count != 1 && arr[0] != target else { return false }
 let midpoint = arr.count/2
 if arr[midpoint] == target { return true }
 
 if target < arr[midpoint] {
 return containsRecursive(arr: Array(arr[0..<midpoint]), target: target)
 } else {
 return containsRecursive(arr: Array(arr[midpoint..<arr.count]), target: target)
 }
 */



/*
 Write a function that takes a Linked List as input and returns its count.  Then do it recursively.
 */
class ListNode<T> {
    let key: T?
    var next: ListNode?
    init (_ key: T?) {
        self.key = key
    }
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
let node6 = ListNode(6)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

func countLinkedList<T>(head: ListNode<T>?) -> Int {
    guard let currentNode = head, currentNode.key != nil else { return 0 }
    return 1 + countLinkedList(head: currentNode.next)
}
let emptyNode = ListNode<Any>(nil)

countLinkedList(head: node1)
