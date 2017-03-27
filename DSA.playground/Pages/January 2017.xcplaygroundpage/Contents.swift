//: Playground - noun: a place where people can play

import UIKit
import XCTest

var str = "Hello, playground"

/*
 Given an array of n integers where n>1, return an array of same size an input array where at every index of the output array should contain the product of all elements in the array except the element at the given index.
 
 Example:
 
 */
let input = [10, 4, 1, 6, 2]
let output = [48,120,480,80,240]

func mappedProductExceptThisOne(arr: [Int]) -> [Int] {
    let product = arr.reduce(1, *)
    return arr.map { product / $0 }
}

mappedProductExceptThisOne(arr: input)

XCTAssertTrue(mappedProductExceptThisOne(arr: input) == output)




func isPalindrome(_ s: String) -> Bool {
    let alphaNumericSet = Set(["1","2","3","4","5","6","7","8","9","0"] + "abcdefghijklmnopqrstuvwxyz".characters)
    var frontPointer = 0
    let sCharacters = Array(s.lowercased().characters)
    var backPointer = sCharacters.count - 1
    while frontPointer < backPointer {
        while !alphaNumericSet.contains(sCharacters[frontPointer]) && frontPointer < backPointer {
            frontPointer += 1
        }
        while !alphaNumericSet.contains(sCharacters[backPointer]) && backPointer > frontPointer {
            backPointer -= 1
        }
        if sCharacters[frontPointer] != sCharacters[backPointer] {
            return false
        } else {
            frontPointer += 1
            backPointer -= 1
        }
    }
    return true
    
    // return s.lowercased().characters.filter{alphaNumericSet.contains($0)} == s.lowercased().characters.reversed().filter{alphaNumericSet.contains($0)}
}




/*
 Write a function that takes two arrays as input, and returns a single array that alternates the elements of each input array.
 Sample  input: [1,4,8,2], [3,9,10,0]
 Sample output: [1,3,4,9,8,10,2,0]
 
 What is the Big O runtime of your algorithm?
 
 Bonus: Write a function that takes n arrays as input and returns a single array that alternates the elements of each input array.
 
 */

func alternateMerge(arr1: [Int], arr2: [Int]) -> [Int] {
    let shortLength = arr1.count < arr2.count ? arr1.count : arr2.count
    var mergeArr: [Int] = []
    for i in 0..<shortLength {
        mergeArr.append(arr1[i])
        mergeArr.append(arr2[i])
    }
    mergeArr += Array(arr1[shortLength..<arr1.count])
    mergeArr += Array(arr2[shortLength..<arr2.count])
    return mergeArr
}


alternateMerge(arr1: [1,4,8,2, 5, 6], arr2: [3,9,10,0, 4, 5, 7])


//func alternateMergeN(arrOfArr: [[Int]]) -> [Int] {
//    let shortLength = arr1.count < arr2.count ? arr1.count : arr2.count
//    var mergeArr: [Int] = []
//    for i in 0..<shortLength {
//        mergeArr.append(arr1[i])
//        mergeArr.append(arr2[i])
//    }
//    mergeArr += Array(arr1[shortLength..<arr1.count])
//    mergeArr += Array(arr2[shortLength..<arr2.count])
//    return mergeArr
//}

// variatic parameter
func mergeVariadicArrs(arrs: [Int]...) -> [Int] {
    var currentIndex = 0
    
    var maxCount = 0
    for arr in arrs {
        if arr.count > maxCount {
            maxCount = arr.count
        }
    }
    var returnArr = [Int]()
    for _ in 0..<maxCount {
        for arr in arrs {
            if currentIndex < arr.count {
                returnArr.append(arr[currentIndex])
            }
        }
        currentIndex += 1
    }
    return returnArr
}

mergeVariadicArrs(arrs: [1,23],[2,4],[10,3123,24,39],[1])



/*
 https://leetcode.com/problems/ransom-note/
 Write a function that takes two strings as input, and returns whether or not the second string can be constructed using the letters from the first string.
 
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 
 Bonus:
 https://leetcode.com/problems/add-binary/
 */

func canConstruct(_ str2: String, from str1: String) -> Bool {
    var letterCount: [Character: Int] = [:]
    for char in str1.characters {
        letterCount[char] = letterCount[char] ?? 1 + 1
    }
    for char in str2.characters {
        if let _ = letterCount[char] {
            letterCount[char]! -= 1
            if letterCount[char]! <= 0 {
                return false
            }
        } else {
            return false
        }
    }
    return true
}

canConstruct("aa", from: "ar")




func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var letterCount: [Character: Int] = [:]
    for char in magazine.characters {
        letterCount[char] = (letterCount[char] ?? 0) + 1
    }
    for char in ransomNote.characters {
        if let _ = letterCount[char] {
            letterCount[char]! -= 1
            if letterCount[char]! < 0 {
                return false
            }
        } else {
            return false
        }
    }
    return true
}



canConstruct("aa", "aab")


/*
 https://leetcode.com/problems/valid-parentheses/
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 */



func balancedBrackets(s: String) -> Bool {
    let openToClose: [Character: Character] = ["(" : ")", "[" : "]", "{": "}"]
    let closeToOpen: [Character: Character] = [")" : "(", "]" : "[", "}": "{"]
    
    var openBrackets: [Character] = []
    var closeBrackets: [Character] = []
    
    for bracket in s.characters {
        if openToClose.keys.contains(bracket) {
            openBrackets.append(bracket)
        } else {
            closeBrackets.append(bracket)
            if openBrackets.isEmpty {
                return false
            }
            if closeToOpen[bracket]! == openBrackets.last! {
                openBrackets.popLast()
                closeBrackets.popLast()
            }
        }
    }
    return openBrackets.isEmpty && closeBrackets.isEmpty
}



balancedBrackets(s: "([)]")



/*
 Given a singly linked list, determine if it is a palindrome.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var myHead = ListNode(2)
myHead.next = ListNode(3)
myHead.next?.next = ListNode(3)
myHead.next?.next?.next = ListNode(2)

func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil {
        return false
    }
    var arr: [Int] = []
    var currentNode = head
    
    while currentNode?.next != nil {
        arr.append((currentNode?.val)!)
        currentNode = currentNode?.next!
    }
    arr.append((currentNode?.val)!)
    return arr == arr.reversed()
}

let myArr = [4, 2, 5, 7]



isPalindrome(myHead)





/*
 Write a function that takes a string as input and reverse only the vowels of a string.
 
 Example 1:
 Given s = "hello", return "holle".
 
 Example 2:
 Given s = "leetcode", return "leotcede".
 
 Note:
 The vowels does not include the letter "y".
 */

func reverseVowels(_ s: String) -> String {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U" ]
    var vowelStack: [Character] = []
    for c in s.characters {
        if vowels.contains(c) {
            vowelStack.append(c)
        }
    }
    var returnString = ""
    for c in s.characters {
        if vowels.contains(c) {
            returnString += String(vowelStack.popLast()!)
        } else {
            returnString += String(c)
        }
    }
    return returnString
}


reverseVowels("hello")



func reverseVowelsV2(_ s: String) -> String {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U" ]
    var strArr = Array(s.characters)
    
    var frontP = 0
    var backP = strArr.count - 1
    
    while frontP < backP {
        let frontChar = strArr[frontP]
        let backChar = strArr[backP]
        
        if vowels.contains(frontChar) && vowels.contains(backChar) {
            swap(&strArr[frontP], &strArr[backP])
            frontP += 1
            backP -= 1
        } else {
            if !vowels.contains(frontChar) {
                frontP += 1
            }
            if !vowels.contains(backChar) {
                backP -= 1
            }
        }
    }
    return String(strArr)
}

reverseVowelsV2("hello")



/*
 Review: Write a function that returns the factorial of a given input Int.
 Sample input: 4
 Sample output: 4 * 3 * 2 = 24
 
 Reminders:
 0! = 1
 1! = 1
 */


func factorial(x: Int) -> Int {
    guard x > 1 else { return x }
    return x * factorial(x: x - 1)
}

factorial(x: 4)


func factorial2(x: Int, p: Int = 1) -> Int {
    if x == 1 {
        return p
    }
    
    return factorial2(x: x - 1, p: x * p)
    
    
}

factorial2(x: 4)


/*
 Write a recursive solution that takes two sorted lists as input, and returns a single sorted list with all the values from the two input lists.  Your solution cannot use any for or while loops.
 */



func listMerge<T: Comparable>(list1: [T], list2: [T]) -> [T] {
    // base case
    guard list1.count > 0 && list2.count > 0 else {
        return list1 + list2
    }
    
    //recursive call
    if list1.first! < list2.first! {
        return [list1.first!] + listMerge(list1: Array(list1[1..<list1.endIndex]), list2: list2)
    } else {
        return [list2.first!] + listMerge(list1: list1, list2: Array(list2[1..<list2.endIndex]))
    }
}





listMerge(list1: [1, 4], list2: [1, 3, 3, 4, 8, 9, 10, 300])




/*
 Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 
 By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
 
 https://projecteuler.net/problem=2
 */

func fib() {
    
}

func evenFibSum(valueLimit: Int = 4000000) -> Int {
    var previous: Int = 1
    var current: Int = 2
    var evenSum: Int = 2
    
    while current <= valueLimit {
        let newCurrent = previous + current
        if newCurrent % 2 == 0 {
            evenSum += newCurrent
        }
        previous = current
        current = newCurrent
    }
    return evenSum
}

evenFibSum(valueLimit: 4000000)



func fibSum(valueLimit: Int, filter: ((Int) -> Bool), previous: Int = 1, current: Int = 2) -> Int {
    guard current < valueLimit else { return 0 }
    return (filter(current) ? current : 0) + fibSum(valueLimit: valueLimit, filter: filter, previous: current, current: current + previous)
}
let x = fibSum(valueLimit: 4000000, filter: {$0%2==0})
x



let y = "hello world".components(separatedBy: " ")


/*
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Example 1:
 Input: [7, 1, 5, 3, 6, 4]
 Output: 5
 
 max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
 Example 2:
 Input: [7, 6, 4, 3, 1]
 Output: 0
 
 In this case, no transaction is done, i.e. max profit = 0.
 */


func maxProfitA(_ prices: [Int]) -> Int {
    var biggestDiff = 0
    for i in 0..<prices.count {
        for j in i..<prices.count where i != j {
            if (prices[j] - prices[i]) > biggestDiff {
                biggestDiff = prices[j] - prices[i]
            }
        }
    }
    return biggestDiff
}

func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = Int.max
    var maxProf = 0
    
    for price in prices {
        if price < minPrice {
            minPrice = price
        } else {
            let thisProfit = price - minPrice
            if thisProfit > maxProf {
                maxProf = thisProfit
            }
        }
    }
    return maxProf
}


maxProfit([7, 1, 5, 3, 6, 4])





/*
 Find the nth digit of the infinite integer sequence 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...
 
 Note:
 n is positive and will fit within the range of a 32-bit signed integer (n < 231).
 
 Example 1:
 
 Input:
 3
 
 Output:
 3
 Example 2:
 
 Input:
 11
 
 Output:
 0
 
 Explanation:
 The 11th digit of the sequence 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... is a 0, which is part of the number 10.
 */

func findNthDigit(_ n: Int) -> Int {
    var str = ""
    for i in 0...n {
        str += String(i)
    }
    let arr: [Character] = Array(str.characters)
    return Int(String(arr[n]))!
}
findNthDigit(11)




/*
 1) Remove duplicates from a sorted linked list
 
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Sample Input	Sample Output
 1->1->2        1->2
 1->1->2->3->3	1->2->3
 */


func removeDups(head: ListNode) -> ListNode {
    var currentNode: ListNode? = head
    while currentNode != nil {
        guard let nextNode = currentNode!.next else { break }
        if currentNode!.val == nextNode.val {
            currentNode!.next = nextNode.next
        } else {
            currentNode = currentNode!.next
        }
    }
    return head
}


/*
 Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements that appear twice in this array.
 
 Could you do it without extra space and in O(n) runtime?
 
 Example:
 Input:
 [4,3,2,7,8,2,3,1]
 
 Output:
 [2,3]
 */

func findDuplicates(_ nums: [Int]) -> [Int] {
    var arr = nums
    var res: [Int] = []
    for x in arr {
        if arr[abs(x) - 1] < 0 {
            res.append(abs(x))
        } else {
            arr[abs(x) - 1] *= -1
        }
    }
    return res
}


/*
 Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
 */

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var d: [Int: Int] = [:]
    for i in 0..<nums.count {
        if let j = d[nums[i]], i - j <= k {
            return true
        } else {
            d[nums[i]] = i
        }
    }
    return false
}
