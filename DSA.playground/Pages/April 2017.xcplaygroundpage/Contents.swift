//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 */

//class TreeNode {
//    var money: Int
//    var left: TreeNode?
//    var right: TreeNode?
//    init(money: Int) {
//        self.money = money
//    }
//}
//
//func convertArrToTrees(_ nums: [Int]) -> (TreeNode, TreeNode) {
//    let nodeOne = TreeNode(money: nums[0])
//    nodeOne.left = TreeNode(money: nums[2])
//    nodeOne.right = TreeNode(money: nums[3])
//
//
//}
//
//func rob(_ nums: [Int]) -> Int {
//
//}
// NO TREES!!!

func rob(_ nums: [Int]) -> Int {
    var a = 0
    var b = 0
    for i in 0..<nums.count {
        if i % 2 == 0 {
            // a looks at the even houses and if its total will be bigger than b it takes it and if not, a skips its turn and just takes what b has because it knows b's path was valid.
            a = max(a + nums[i], b)
        } else {
            b = max(a, b + nums[i])
        }
    }
    return max(a, b)
}


/*
Implement a stack with a node. 1 line push, 3 line pop.
 */

class Node<T> {
    let value: T
    var next: Node?
    
    init(value: T, next: Node?) {
        self.value = value
        self.next = next
    }
}

class Stack<T> {
    var head: Node<T>?
    
    func pop() -> T? {
        let value = head?.value
        head = head?.next
        return value
    }
    
    func push(value: T) {
        head = Node(value: value, next: head)
    }
    
    func peek() -> T? {
        return head?.value
    }
}


/*
 Write a program to check whether a given number is an ugly number.
 
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. For example, 6, 8 are ugly while 14 is not ugly since it includes another prime factor 7.
 
 Note that 1 is typically treated as an ugly number.
 */

func isUgly(_ num: Int) -> Bool {
    guard num > 0 else { return false }
    var n = num
    for i in 2...5 {
        while n % i == 0 {
            n /= i
        }
    }
    return n != 1 ? false : true
}


/*
 Given a non-negative integer represented as a non-empty array of digits, plus one to the integer.
 
 You may assume the integer do not contain any leading zero, except the number 0 itself.
 
 The digits are stored such that the most significant digit is at the head of the list.
 
*/

func plusOne(_ digits: [Int]) -> [Int] {
    var digArr = digits
    for i in (0..<digArr.count).reversed() {
        if digArr[i] < 9 {
            digArr[i] += 1
            break
        } else {
            digArr[i] = 0
            if i == 0 {
                digArr.insert(1, at: 0)
            }
        }
    }
    return digArr
}




/*
 
 Given a string, sort it in decreasing order based on the frequency of characters.
 
 Example 1:
 
 Input:
 "tree"
 
 Output:
 "eert"
 
 Explanation:
 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
 Example 2:
 
 Input:
 "cccaaa"
 
 Output:
 "cccaaa"
 
 Explanation:
 Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.
 Example 3:
 
 Input:
 "Aabb"
 
 Output:
 "bbAa"
 
 Explanation:
 "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.
 */

func frequencySort(_ s: String) -> String {
    var countDict: [Character: Int] = [:]
    for c in s.characters {
        countDict[c] = (countDict[c] ?? 0) + 1
    }
    var countArr: [(char: Character, count: Int)] = []
    for (key, value) in countDict {
        countArr.append((key, value))
    }
    countArr = countArr.sorted(by: { $0.count > $1.count })
    var outputString: String = ""
    for char in countArr {
        outputString += String(repeating: String(char.char), count: char.count)
    }
    return outputString
}


 
 
 
 
 
 
