//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func countDown(from currentNum: Int) {
    if currentNum == -506 {
        return
    }
    print(currentNum)
    countDown(from: currentNum - 1)
}

//countDown(from: 506)


func countUp(to target: Int, startingAt currentNum: Int) {
    if currentNum > target {
        return
    }
    print(currentNum)
    countUp(to: target, startingAt: currentNum + 1)
    print(String(currentNum) + " backing out")
}

//countUp(to: 10, startingAt: 1)

//0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ...
func iteriveFib(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    var numOne = 0
    var numTwo = 1
    
    for _ in 0..<n - 1 {
        let tempSum = numOne + numTwo
        numOne = numTwo
        numTwo = tempSum
    }
    return numTwo
}




func recursiveFib(n: Int) -> Int {
    //base case
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    
    //recursive call
    return recursiveFib(n: n - 1) + recursiveFib(n: n - 2)
}


var resultsDict = [Int: Int]()
func recursiveFibBetter(n: Int) -> Int {
    //base case
    if n == 0 {
        return 0
    }
    if n == 1 {
        return 1
    }
    if let valueForN = resultsDict[n] {
        return valueForN
    }
    //recursive call
    let sum = recursiveFibBetter(n: n - 1) + recursiveFibBetter(n: n - 2)
    resultsDict[n] = sum
    return sum
}


iteriveFib(n: 8)
recursiveFib(n: 8)
recursiveFibBetter(n: 30)



let sampleArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func printArrayRecursive1(arr: [Int], startingFrom: Int = 0) {
    
    if startingFrom >= arr.count {
        return
    }
    print(arr[startingFrom])
    //recursive call
    printArrayRecursive1(arr: arr, startingFrom: startingFrom + 1)
}

func printArrayRecursive2<T>(arr: [T]) {
    if arr.isEmpty {
        return
    }
    var arrCopy = arr
    print(arrCopy.removeFirst())
    printArrayRecursive2(arr: arrCopy)
}

printArrayRecursive1(arr: sampleArray)
printArrayRecursive2(arr: sampleArray)


/*
 Concatenate all the elements in an array of Strings
 
 Sample Input: ["Hi", "there", ",", " ", "user","!"]
 
 Sample Output: "Hi there, user!"
 
 */

let sampInput125 = ["Hi", "there", ",", " ", "user","!"]

func concatenateArray(arr: [String]) -> String {
    var str = ""
    for x in arr {
        str += x
        str += " "
    }
    return str
}

func concatenateArrayRecursivly(arr: [String], startString: String = "") -> String {
    var theArr = arr
    var theString = startString
    
    if let word = theArr.first {
        theString += word
        theString += " "
        theArr.removeFirst()
        return concatenateArrayRecursivly(arr: theArr, startString: theString)
    } else {
        return theString
    }
}

concatenateArray(arr: sampInput125)
concatenateArrayRecursivly(arr: sampInput125)


/*
 Find the sum of all the numbers in an array
 sampInput 153 = [3,6,1,3,2]
 
 Sample Output: 15
 */

let sampInput153 = [3,6,1,3,2]


func recurSum(arr: [Int], sum: Int = 0, index: Int = 0) -> Int {
    if index == arr.count {
        return sum
    }
    return recurSum(arr: arr, sum: sum + arr[index], index: index + 1 )
}

recurSum(arr: sampInput153)


/*
 Find the sum of all the even numbers in an array
 Sample Input: [3,6,1,3,2]
 
 Sample Output: 8
 
 */

func recurSumEven(arr: [Int], index: Int = 0) -> Int {
    if index >= arr.count {
        return 0
    }
    
    if arr[index] % 2 == 0 {
        return arr[index] + recurSumEven(arr: arr, index: index + 1)
    } else {
        return 0 + recurSumEven(arr: arr, index: index + 1)
    }
    
    //return (arr[index] % 2 == 0 ? arr[index] : 0) + recurSumEven(arr: arr, index: index + 1)
}
var counter = 0
recurSumEven(arr: [3,6,1,3,2])




// BINARY SEARCH


var iteritiveCounter = 0
var binaryCounter = 0

func didFind(target: Int, arr: [Int]) -> Bool {
    for x in arr {
        iteritiveCounter += 1
        if x == target {
            return true
        }
    }
    return false
}

let testArr123 = [1, 2, 4, 6, 7, 9, 11, 14, 16, 19]

didFind(target: 11, arr: testArr123)


//Find target

//Open our array halfway
//complare our target against the halway point
// if target is bigger we repeat the process for the right half
// if target is bigger we repeat the process for the left half
// if the target is the same, we return.
// if left > right, we missed our mark, and there is no target


func binarySearch(for target: Int, in arr: [Int], leftIndex: Int = 0, startRightIndex: Int = -100) -> Bool {
    
    var rightIndex = startRightIndex
    if rightIndex == -100 {
        rightIndex = arr.count - 1
    }
    if leftIndex < rightIndex {
        binaryCounter += 1
        let midIndex = (rightIndex + leftIndex) / 2
        print("Array section: \(arr[leftIndex...rightIndex]), Mid Value: \(arr[midIndex]) ")
        if target == arr[midIndex] {
            return true
        } else if target > arr[midIndex] {
            return binarySearch(for: target, in: arr, leftIndex: midIndex + 1, startRightIndex: rightIndex)
        } else { //if target < arr[midIndex] {
            return binarySearch(for: target, in: arr, leftIndex: leftIndex, startRightIndex: midIndex)
        }
    }
    else {
        return false
    }
}

//binarySearch(for: 69, in: testArr123)

//var newTestArr: [Int] = []
//for i in 0...2000 {
//    newTestArr.append(i+i)
//}
//
//binarySearch(for: 2500, in: newTestArr)
//binaryCounter
//didFind(target: 2500, arr: newTestArr)
//iteritiveCounter



// palindrome

func isPal(str: String) -> Bool {
    let justCharsArr = str.lowercased().components(separatedBy: CharacterSet.punctuationCharacters.union(.whitespaces))
    return justCharsArr == justCharsArr.reversed()
}


func isPalRecursion(str: String, leftIndex: Int = 0, rightIndex: Int = -100) -> Bool {
    let justCharsArr =  Array(str.lowercased().characters).filter { CharacterSet.lowercaseLetters.contains(UnicodeScalar(String($0))!) }
    var right = rightIndex
    if right == -100 {
        right = justCharsArr.count - 1
    }
    if leftIndex < right {
        if justCharsArr[leftIndex] == justCharsArr[right] {
            return isPalRecursion(str: str, leftIndex: leftIndex + 1, rightIndex: right - 1)
        } else {
            return false
        }
    } else {
        return true
    }
}

func isPal2(str: String, leftIndex: Int = 0, rightIndex: Int = -100) -> Bool {
    let strArr =  Array(str.lowercased().characters).filter { CharacterSet.lowercaseLetters.contains(UnicodeScalar(String($0))!) }
    
    let right = rightIndex == -100 ? strArr.count - 1 : rightIndex
    
    if leftIndex >= right {
        return true
    }
    return strArr[leftIndex] == strArr[right] && isPal2(str: str, leftIndex: leftIndex + 1, rightIndex: right - 1)
}

func recursivePalindromeWithNoArr(str: String, leftIndex: Int = 0, rightIndex: Int = -Int.max) -> Bool {
    
    var updatedRightIndex: Int = rightIndex
    if rightIndex == -Int.max {
        updatedRightIndex = str.characters.count - 1
    }
    //base case
    if leftIndex >= updatedRightIndex {
        return true
    }
    //recursive call
    let theNextPairOfCharsAreEqual = recursivePalindromeWithNoArr(str: str, leftIndex: leftIndex + 1, rightIndex: updatedRightIndex - 1)
    
    return str[str.index(str.startIndex, offsetBy: leftIndex)] == str[str.index(str.startIndex, offsetBy: updatedRightIndex)] && theNextPairOfCharsAreEqual
}




isPal(str: "Racecar")
isPalRecursion(str: "a,.b  a")

isPal2(str: "abcdcb")

recursivePalindromeWithNoArr(str: "trrt")


//Given an Int as input, return the sum of its digits. Then do it recursively

func sumOfDigits(num: Int) -> Int {
    let arr: [Int] = (Array(String(num).characters)).map { Int(String($0))! }
    var sum = 0
    for x in arr {
        sum += x
    }
    return sum
}

sumOfDigits(num: 1234)

let str5 = String(123)
let arr5: [Character] = Array(str5.characters)
let arr6 = arr5.map { String($0) }
let srr7 = arr6.map { Int($0)! }



func recurSumOfDigits(num: Int, sum: Int = 0, index: Int = 0) -> Int {
    let arr: [Int] = (Array(String(num).characters)).map { Int(String($0))! }
    if index == arr.count {
        return sum
    }
    return recurSumOfDigits(num: num, sum: sum + arr[index], index: index + 1)
}

recurSumOfDigits(num: 1234)

func waaaaaaayyyyyyyyBetterRecurSum(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    return n % 10 + waaaaaaayyyyyyyyBetterRecurSum(n: n / 10)
}

// think about this more often
var t = 123456789
for _ in 0...9 {
    print(t)
    t = t  / 10
}



// quick recursion example

//iterative

func power(base: Int, exponent: Int) -> Int {
    var product = 1
    for _ in 0..<exponent {
        product *= base
    }
    return product
}

//recursive

func recursePower(base: Int, exponent: Int) -> Int {
    if exponent == 0 {
        return 1
    }
    return base * recursePower(base: base, exponent: exponent - 1)
}

power(base: 2, exponent: 4)
recursePower(base: 2, exponent: 4)


func recursiveMultipy(numOne: Int, numTwo: Int) -> Int {
    //base case
    if numTwo == 0 {
        return 0
    }
    
    //recursive call
    
    return numOne + recursiveMultipy(numOne: numOne, numTwo: numTwo - 1)
}

recursiveMultipy(numOne: 5, numTwo: 6)




// Reverse a string recursively


func reverseString(str: String) -> String {
    
    let strArr = Array(str.characters)
    let reversedArr = reverseArray(arr: strArr)
    return String(reversedArr)
}

func reverseArray(arr: [Character]) -> [Character] {
    //base case
    print(arr)
    guard arr.count > 1 else {return arr }
    
    //recursive call
    
    let lastLetter: Character = arr.last!
    let restOfTheLetters: [Character] = Array(arr[0..<arr.count - 1])
    return [lastLetter] + reverseArray(arr: restOfTheLetters)
    
}




print(reverseString(str: "Hello Playground"))



func reverseString(_ s: String) -> String {
    
    //base case
    guard s.characters.count > 1 else { return s }
    
    //recursive call
    // remove last letter
    // return last letter + reverseString(rest of the letters)
    
    let newEnd = s.index(before: s.endIndex)
    let lastChar = String(s[newEnd])
    let theRest = String(s[s.startIndex..<newEnd])!
    return lastChar + reverseString(theRest)
}


reverseString("hello")


func recursiveReverseVowels(_ s: String) -> String {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U" ]
    
    //base case
    guard s.characters.count > 1 else { return s }
    
    //recursive call
    // 4 cases
    
    let firstChar = s[s.startIndex]
    let lastChar = s[s.index(before: s.endIndex)]
    let midChars = s.substring(with: s.index(after: s.startIndex)..<s.index(before: s.endIndex))
    
    if vowels.contains(firstChar) && vowels.contains(lastChar) {
        //vowel at the start and end
        return String(lastChar) + recursiveReverseVowels(midChars) + String(firstChar)
    } else if vowels.contains(firstChar) {
        //only first char is vowel
        return recursiveReverseVowels(s.substring(to: s.index(before: s.endIndex))) + String(lastChar)
    } else if vowels.contains(lastChar) {
        //only last char is vowel
        return String(firstChar) + recursiveReverseVowels(s.substring(from: s.index(after: s.startIndex)))
    } else {
        //no vowels on either end
        return String(firstChar) + recursiveReverseVowels(midChars) + String(lastChar)
    }
}

recursiveReverseVowels("Hello Playground")



/*
 
 Review: Write a function that returns the factorial of a given input Int.
 Sample input: 4
 Sample output: 4 * 3 * 2 = 24
 
 Reminders:
 0! = 1
 1! = 1
 
 */

    