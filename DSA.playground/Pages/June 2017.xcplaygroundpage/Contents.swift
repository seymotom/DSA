//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


/*
 Suppose you have a long flowerbed in which some of the plots are planted and some are not. However, flowers cannot be planted in adjacent plots - they would compete for water and both would die.
 
 Given a flowerbed (represented as an array containing 0 and 1, where 0 means empty and 1 means not empty), and a number n, return if n new flowers can be planted in it without violating the no-adjacent-flowers rule.
 
 Example 1:
 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: True
 Example 2:
 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: False
 */

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    
    var bed = flowerbed
    var x = n
    
    for i in 0..<bed.count - 1 where bed[i] == 0 {
        if i == 0 {
            if bed[i + 1] == 0 {
                x -= 1
                bed[i] = 1
            }
        } else {
            if bed[i - 1] == 0 && bed[i + 1] == 0 {
                x -= 1
                bed[i] = 1
            }
        }
    }
    
    if bed.count == 1 {
        if bed[0] == 0 {
            x -= 1
        }
    } else {
        if bed[bed.count - 1] == 0 && bed[bed.count - 2] == 0 {
            x -= 1
        }
    }
    
    return x < 1
}

canPlaceFlowers([0], 2)




/*
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
 
 If the last word does not exist, return 0.
 
 Note: A word is defined as a character sequence consists of non-space characters only.
 
 For example,
 Given s = "Hello World",
 return 5.
 
*/

func lengthOfLastWord(_ s: String) -> Int {
    guard s.characters.count > 0 else { return 0 }
    
    var arr = s.components(separatedBy: CharacterSet.whitespaces)

    while arr.last!.characters.count == 0 {
        _ = arr.popLast()
        if arr.isEmpty {
            return 0
        }
    }
    
    return arr.last!.characters.count
    
}


lengthOfLastWord("  ")




/*
 Determine whether an integer is a palindrome. Do this without extra space.
 
 click to show spoilers.
 
 Some hints:
 Could negative integers be palindromes? (ie, -1)
 
 If you are thinking of converting the integer to string, note the restriction of using extra space.
 
 You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", you know that the reversed integer might overflow. How would you handle such case?
 
 There is a more generic way of solving this problem.
 */



func isPalindrome(_ x: Int) -> Bool {
    var x = x
    if x < 0 || (x != 0 && x % 10 == 0) {
        return false
    }
    var rev = 0
    print("x: \(x)")
    print("rev: \(rev)")
    while x > rev {
        rev = rev * 10 + x % 10
        x = x / 10
        print("x: \(x)")
        print("rev: \(rev)")
    }
    return x == rev || x == rev / 10
}

isPalindrome(123457)
print("")
isPalindrome(0)
print("")
isPalindrome(8)

UINT32_MAX



/*
 Reverse digits of an integer.
 
 Example1: x = 123, return 321
 Example2: x = -123, return -321
 
 click to show spoilers.
 
 Have you thought about this?
 Here are some good questions to ask before coding. Bonus points for you if you have already thought through this!
 
 If the integer's last digit is 0, what should the output be? ie, cases such as 10, 100.
 
 Did you notice that the reversed integer might overflow? Assume the input is a 32-bit integer, then the reverse of 1000000003 overflows. How should you handle such cases?
 
 For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 
 Note:
 The input is assumed to be a 32-bit signed integer. Your function should return 0 when the reversed integer overflows.
 */


func reverse(_ x: Int) -> Int {
    var x = x
    var r = 0
    
    while x != 0 {
        r = (10 * r) + (x % 10)
        x /= 10
    }
    
    return r > Int(INT32_MAX) || r < -Int(INT32_MAX) ? 0 : r
}



