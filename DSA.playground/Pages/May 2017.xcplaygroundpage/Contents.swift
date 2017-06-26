//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
 write a function to calculate the number of characters used to print the numbers “0” to “1000" (inclusive) when spelled out, with whitespace, hyphens and “and” omitted. For example, “525" would spell out “fivehundredtwentyfive”, so your function should return “21". Your function should adhere to the following signature:
 func countCharacters(from start: Int, to end: Int) -> Int
 Consider, for example, one through three, would be “onetwothree”, which uses “11" characters; “fortyone” uses “8" characters; and “onehundredone” uses “13" characters. Therefore:
 “countCharacters(from: 1, to: 3)” should return “11"
 “countCharacters(from: 41, to: 41)” should return “8"
 “countCharacters(from: 101, to: 101)” should return “13"
 Your definition of “countCharacters” should return the correct answer for “countCharacters(from: 0, to: 1000)
 */

var onesPlaceDict = [Int: Int]()

let nums = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

for (index, num) in nums.enumerated() {
    onesPlaceDict[index] = num.characters.count
}

var tensPlaceDict = [Int: Int]()

let numsTens = ["","","twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
for (index, num) in numsTens.enumerated() {
    tensPlaceDict[index] = num.characters.count
}


func countCharsInInt(_ n: Int) -> Int {
    var n = n
    
    if n == 1000 {
        return "onethousand".characters.count
    }
    if n == 0 {
        return "zero".characters.count
    }
    
    var sum = 0
    
    if n > 99 {
        sum += onesPlaceDict[n/100]! + "hundred".characters.count
        n = n - (100 * (n / 100))
    }
    
    if n < 20 {
        sum += onesPlaceDict[n]!
        return sum
    }
    
    sum += tensPlaceDict[n/10]!
    
    n = n - (10 * (n / 10))
    sum += onesPlaceDict[n]!
    
    return sum
}

func countChars(start: Int, end: Int) -> Int {
    var sum = 0
    for i in start...end {
        sum += countCharsInInt(i)
    }
    return sum
}

countChars(start: 0, end: 1000)









