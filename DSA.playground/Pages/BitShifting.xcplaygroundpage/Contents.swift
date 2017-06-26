//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


/*
 Count the ones of n in binary
 */

func countOnes(n: UInt8) -> Int {
    var x: UInt8 = n
    var count = 0
    
    while x > 0 {
        if x & 1 == 1 {
            count += 1
        }
        x = x >> 1
    }
    
    return count
}

func countOnes2(n: UInt8) -> Int {
    var x: UInt8 = 1
    var count = 0
    
    while x < n {
        if x & n != 0 {
            count += 1
        }
        x = x*2
    }
    return count
}

func countOnes3(n: Int) -> Int {
    let size = MemoryLayout<Int>.size
    var count = 0
    
    for i in 0..<size {
        if n & (1 << i) != 0 {
            count += 1
        }
    }
    return count
}
countOnes(n: 15)
countOnes2(n: 15)
countOnes3(n: 15)

func halfAdder(_ a: Int, _ b: Int) -> (sum: Int, carry: Int) {
    let sum = a ^ b  // XOR to find sum
    let carry = a & b  // AND to find carry
    return (sum, carry)
}

let zeroZero = halfAdder(0, 0)
let zeroOne = halfAdder(0, 1)
let oneZero = halfAdder(1, 0)
let oneOne = halfAdder(1, 1)

func fullAdder(_ a: Int, _ b: Int, _ c: Int) -> (sum: Int, carry: Int) {
    let first: (sum: Int, carry: Int) = halfAdder(a, b)
    let second: (sum: Int, carry: Int) = halfAdder(first.sum, c)
    let carry = first.carry | second.carry // OR the carries
    return (second.sum, carry)
}

let zeroOneOne = fullAdder(0, 1, 1)
let oneOneOne = fullAdder(1, 1, 1)

func add(lhs: Int, rhs: Int) -> String {
    var lhs = lhs
    var rhs = rhs
    
    var finalStr = ""
    var carry = 0
    
    while lhs != 0 || rhs != 0 {
        let a = lhs & 1
        let b = rhs & 1
        let addition = fullAdder(a, b, carry)
        carry = addition.carry
        finalStr = String(addition.sum) + finalStr
        
        lhs = lhs >> 1
        rhs = rhs >> 1
    }
    return String(carry) + finalStr
}


let answer = add(lhs: 4, rhs: 4)
