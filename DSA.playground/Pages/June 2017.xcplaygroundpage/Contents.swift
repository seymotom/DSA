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