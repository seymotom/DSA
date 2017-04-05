//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given an array of integers and an integer k, you need to find the number of unique k-diff pairs in the array. Here a k-diff pair is defined as an integer pair (i, j), where i and j are both numbers in the array and their absolute difference is k.
 
 Example 1:
 Input: [3, 1, 4, 1, 5], k = 2
 Output: 2
 Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
 Although we have two 1s in the input, we should only return the number of unique pairs.
 Example 2:
 Input:[1, 2, 3, 4, 5], k = 1
 Output: 4
 Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).
 Example 3:
 Input: [1, 3, 1, 5, 4], k = 0
 Output: 1
 Explanation: There is one 0-diff pair in the array, (1, 1).
 Note:
 The pairs (i, j) and (j, i) count as the same pair.
 The length of the array won't exceed 10,000.
 All the integers in the given input belong to the range: [-1e7, 1e7].
 */


//func findPairs(_ nums: [Int], _ k: Int) -> Int {
//    guard nums.count > 0 else { return 0 }
//    
//    var count = 0
//    var checkDict: [Int: Int] = [:]
//    
//    for i in 0..<nums.count - 1 {
//        for j in (i + 1)..<nums.count where abs(nums[i] - nums[j]) == k {
//            
//            if let jNum = checkDict[nums[i]], jNum + nums[i] == k {
//               count += 1
//            } else {
//                count += 1
//                checkDict[nums[i]] = nums[j]
//            }
//        }
//    }
//    return count
//}

//func findPairs(_ nums: [Int], _ k: Int) -> Int {
//    guard nums.count > 0 else { return 0 }
//    
//    var count = 0
//    var checkDict: [Int: Int] = [:]
//    
//    for i in 0..<nums.count {
//        let thisNumber = nums[i]
//        let numberNeededForPair = k < thisNumber ? (thisNumber - k) : (k - thisNumber)
//        print("K is \(k), number needed for \(thisNumber) is \(numberNeededForPair)")
//        
//        
//    }
//    
//    return count
//}
//
//findPairs([3, 1, 4, 1, 5], 2)
//findPairs([1, 2, 3, 4, 5], 1)
//findPairs([1, 3, 1, 5, 4], 0)
//findPairs([1, 1, 1, 2, 1], 1)




/* 
 One liner that takes a string and returns number of vowels.... Louis
 */

//func numberOfVowelsIn(str: String) -> Int {
//    return str.characters.filter { $0 == "i" || $0 == "a" || $0 == "e" || $0 == "o" || $0 == "u" }.count
//}

func capitalizeFirstLetterOfWord(str: String) -> String {
    return str.components(separatedBy: " ").map { $0.capitalized }.joined(separator: " ")
}
capitalizeFirstLetterOfWord(str: "tom is a funny boy")



/*
 Given two arrays, write a function to compute their intersection.
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
 
 Note:
 Each element in the result must be unique.
 The result can be in any order.
*/

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
}

/*
 Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
 */

func findWords(_ words: [String]) -> [String] {
    let row1: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    let row2: Set<Character> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    let row3: Set<Character> = ["z", "x", "c", "v", "b", "n", "m"]
    
    return words.filter { Set($0.lowercased().characters).isSubset(of: row1) || Set($0.lowercased().characters).isSubset(of: row2) || Set($0.lowercased().characters).isSubset(of: row3) }
}



/*
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */

//func moveZeroes(_ nums: inout [Int]) {
//    var newNums: [Int] = []
//    var zeroCount = 0
//    for i in 0..<nums.count {
//        if nums[i] != 0 {
//            newNums.append(nums[i])
//        } else {
//            zeroCount += 1
//        }
//    }
//    for _ in 0..<zeroCount {
//        newNums.append(0)
//    }
//    nums = newNums
//}

//func moveZeroes(_ nums: inout [Int]) {
//    var zeroCount = 0
//    nums = nums.filter { (a) in
//        if a == 0 {
//            zeroCount += 1
//            return false
//        }
//        return true
//    }
//    nums += [Int](repeating: 0, count: zeroCount)
//}

func removeZerosHigherOrder(arr: [Int]) -> [Int] {
    return arr.filter{$0 != 0} + Array(repeating: 0, count: arr.reduce(0){$1 == 0 ? $0 + 1 : $0})
}

func moveZeroes(_ nums: inout [Int]) {
    var count = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums[count] = nums[i]
            count += 1
        }
    }
    for i in count..<nums.count {
        nums[i] = 0
    }
}


var myArr = [0,0,1]
moveZeroes(&myArr)



