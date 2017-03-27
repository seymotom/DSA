//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/*
 You are given an unsorted array of Ints as input.  Find all the ints that are missing in between the minimum and maximum values of the array.
 Example: [2,6,3,8,5]
 Output: [4,7]
 */

func missingInts(arr: [Int]) -> [Int] {
    var res: [Int] = []
    guard arr.count > 0 else { return res }
    let setArr = Set(arr)
    let min = arr.min()!
    
    // example of reduce to be fancy
    let max = arr.reduce(Int.min) { ($0 > $1) ? $0 : $1 }
    
    //    for n in arr {
    //        if n > max {
    //            max = n
    //        }
    //        if n < min {
    //            min = n
    //        }
    //        setArr.insert(n)
    //    }
    
    for x in min..<max {
        if !setArr.contains(x) {
            res.append(x)
        }
    }
    return res
}


missingInts(arr: [2,6,3,8,5])




/*
 https://leetcode.com/problems/first-unique-character-in-a-string/
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 */

func firstUniqChar(_ s: String) -> Int {
    var countDict: [Character : Int] = [:]
    for c in s.characters {
        countDict[c] = (countDict[c] ?? 0) + 1
    }
    var uniqueSet: Set<Character> = []
    for (key, value) in countDict where value == 1 {
        uniqueSet.insert(key)
    }
    for (i, c) in s.characters.enumerated() {
        if uniqueSet.contains(c) {
            return i
        }
    }
    return -1
}


firstUniqChar("leetcode")


/*
 1) Write a function that takes an integer as input, and returns whether or not it is a prime number
 
 2) https://leetcode.com/problems/count-primes/
 
 Count the number of prime numbers less than a non-negative number, n.
 */


func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    if n <= 3 {
        return true
    }
    var x = 2
    while x * x <= n {
        if n % x == 0 {
            return false
        }
        x += 1
    }
    return true
}

func countPrimes(_ n: Int) -> Int {
    var count = 0
    for i in 0..<n {
        if isPrime(i) {
            count += 1
        }
    }
    return count
}

isPrime(6)


countPrimes(100)



/*
 3) https://leetcode.com/problems/third-maximum-number/
 
 Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number. The time complexity must be in O(n).
 
 Example 1:
 Input: [3, 2, 1]
 
 Output: 1
 
 Explanation: The third maximum is 1.
 Example 2:
 Input: [1, 2]
 
 Output: 2
 
 Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
 Example 3:
 Input: [2, 2, 3, 1]
 
 Output: 1
 
 Explanation: Note that the third maximum here means the third maximum distinct number.
 Both numbers with value 2 are both considered as second maximum.
 */


func thirdMax(_ nums: [Int]) -> Int {
    var maxOne = Int.min
    var maxTwo = Int.min
    var maxThree = Int.min
    
    for x in Array(Set(nums)) {
        if x > maxOne {
            maxThree = maxTwo
            maxTwo = maxOne
            maxOne = x
        } else if x > maxTwo {
            maxThree = maxTwo
            maxTwo = x
        } else if x > maxThree {
            maxThree = x
        }
    }
    
    if maxThree != Int.min {
        return maxThree
    } else {
        return maxOne
    }
}

thirdMax([3, 2, 1])
thirdMax([1, 2])
thirdMax([2, 2, 3, 1])


/*
 4) https://leetcode.com/problems/happy-number/
 
 Write an algorithm to determine if a number is "happy".
 
 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.
 
 Example: 19 is a happy number
 
 12 + 92 = 82
 
 82 + 22 = 68
 
 62 + 82 = 100
 
 12 + 02 + 02 = 1
 
 */

func isHappy(_ n: Int) -> Bool {
    var x = n
    var sumSet: Set<Int> = []
    while !sumSet.contains(x) {
        sumSet.insert(x)
        if x == 1 {
            return true
        }
        //        let charArr: [Character] = Array(String(x).characters)
        //        let strArr: [String] = charArr.map { String($0) }
        //        let intArr: [Int] = strArr.map { Int($0)! }
        //        let squIntArr: [Int] = intArr.map { $0 * $0 }
        //        x = squIntArr.reduce(0, +)
        x = Array(String(x).characters).map { String($0) }.map { Int($0)! * Int($0)! }.reduce(0, +)
    }
    return false
}

let a: Character = "4"
let b = Int(String(a))!


/*
 Write a function that takes a Stack and a value as input, and pushes the value to the bottom of the Stack.
 Input:  Value: 4
 6
 3
 2
 9
 1
 
 Output:
 6
 3
 2
 9
 1
 4
 
 */

class Stack<T> {
    
    private var arr = Array<T>()
    
    func pop() -> T? {
        return arr.popLast()
    }
    
    func push(element: T) {
        arr.append(element)
    }
    
    func peek() -> T? {
        guard arr.count > 0 else {
            return nil
        }
        return arr[arr.count - 1]
    }
    
    func isEmpty() -> Bool {
        return arr.count == 0
    }
    
    func printStack() {
        print(arr)
    }
}

func putTotheBottom<T>(stack: Stack<T>, value: T) {
    let tempStack = Stack<T>()
    while !stack.isEmpty() {
        tempStack.push(element: stack.pop()!)
    }
    tempStack.push(element: value)
    while !tempStack.isEmpty() {
        stack.push(element: tempStack.pop()!)
    }
}

let myStack = Stack<Int>()
myStack.push(element: 2)
myStack.push(element: 4)
myStack.push(element: 6)


myStack.printStack()

putTotheBottom(stack: myStack, value: 0)

myStack.printStack()


/*
 Write a function that takes a Queue and a value as input, and enqueues the value right in front of the value at the back of the line.
 Input: 3 - 6 -4 - 8 - 1, 2
 Output: 3 -2 -6 - 4  - 8 -1
 */

class Node<T> {
    var key: T?
    var next: Node<T>?
}

class LinekdList<T> {
    var head: Node<T>
    var tail: Node<T>
    init() {
        self.head = Node<T>()
        self.tail = head
    }
}

class Queue<T> {
    private var list = LinekdList<T>()
    
    func enQueue(newElement: T) {
        if list.head.key == nil {
            list.head.key = newElement
            return
        } else {
            let newNode = Node<T>()
            newNode.key = newElement
            list.tail.next = newNode
            list.tail = newNode
        }
    }
    
    func deQueue() -> T? {
        if let oldHeadKey = list.head.key {
            if let nextNode = list.head.next {
                list.head = nextNode
            } else {
                list.head.key = nil
            }
            return oldHeadKey
        } else {
            return nil
        }
    }
    
    func printQueue() {
        var currentNode = self.list.head
        while currentNode.next != nil {
            print(currentNode.key!)
            currentNode = currentNode.next!
        }
        print(currentNode.key!)
    }
    
    func isEmpty() -> Bool {
        return list.head.key == nil
    }
    
    func peek() -> T? {
        return list.head.key
    }
}

let myQueue = Queue<Int>()
myQueue.enQueue(newElement: 2)
myQueue.enQueue(newElement: 4)
myQueue.enQueue(newElement: 6)
myQueue.enQueue(newElement: 8)

myQueue.printQueue()

func cutQueue<T>(queue: Queue<T>, value: T) {
    var arr: [T] = []
    while !queue.isEmpty() {
        arr.append(queue.deQueue()!)
    }
    guard arr.count > 0 else { return }
    let last = arr.popLast()!
    arr.append(value)
    arr.append(last)
    for x in arr {
        queue.enQueue(newElement: x)
    }
}


cutQueue(queue: myQueue, value: 7)
myQueue.printQueue()


/*
 https://leetcode.com/problems/maximum-subarray/
 Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
 
 For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 */

//    var subArrDict: [Int: [Int]] = [Int: [Int]]()

func maxSubArray(_ nums: [Int]) -> Int {
    var maxSum = nums[0]
    for i in 0..<nums.count {
        var sum = 0
        for j in i..<nums.count {
            sum += nums[j]
            if sum > maxSum {
                maxSum = sum
            }
        }
    }
    return maxSum
}

//print(sumArr)
//print(sumArr.count)

maxSubArray([4,-1,2,1])


func maxSubArrayLF(_ nums: [Int]) -> Int {
    var biggestSum = nums[0]
    for i in 0..<nums.count {
        var currentSubArraySum = nums[i]
        for j in (i + 1)..<nums.count {
            if currentSubArraySum > biggestSum {
                biggestSum = currentSubArraySum
            }
            currentSubArraySum += nums[j]
            if currentSubArraySum > biggestSum {
                biggestSum = currentSubArraySum
            }
        }
        currentSubArraySum = 0
    }
    if nums[nums.count - 1] > biggestSum {
        biggestSum = nums[nums.count - 1]
    }
    return biggestSum
}


func maxSubArrayBen(_ nums: [Int]) -> Int {
    var maxSum = nums[0]
    var trackingSum = 0
    for num in nums {
        trackingSum += num
        if trackingSum > maxSum {
            maxSum = trackingSum
        }
        if trackingSum < 0 {
            trackingSum = 0
        }
    }
    return maxSum
}


/*
 Write a function that takes an array of Ints as input and returns how many numbers are odd, how many are even, and how many are divisible by three.
 
 */

func oddEvenThreeven(arr: [Int]) -> (Int, Int, Int) {
    var odd = 0
    var even = 0
    var threeven = 0
    for x in arr {
        if x % 2 == 0 {
            even += 1
        } else {
            odd += 1
        }
        if x % 3 == 0 {
            threeven += 1
        }
    }
    return (odd, even, threeven)
}


/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 */

func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
    for i in 0..<nums.count {
        if nums[i] >= target {
            return i
        }
    }
    return nums.count
}

searchInsert1([1,3,5,6], 5)
searchInsert1([1,3,5,6], 2)
searchInsert1([1,3,5,6], 7)
searchInsert1([1,3,5,6], 0)


func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    
    var high = nums.count
    var low = 0
    
    while low < high {
        let mid = low + (high - low) / 2
        if target > nums[mid] {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return low
}


/*
 Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Solve it without division and in O(n).
 
 For example, given [1,2,3,4], return [24,12,8,6].
 
 Follow up:
 Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)
 */

func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    let zeroCount = nums.reduce(0) { ($0 == 0 ? 1 : 0) + $1 }
    
    guard !nums.contains(0) else {
        let nonZeroP = nums.reduce(1){ ($0 != 0 ? $0 : 1) * $1 }
        var outputArr: [Int] = []
        for num in nums {
            if num != 0 {
                outputArr.append(0)
            } else {
                if zeroCount == 1 {
                    outputArr.append(nonZeroP)
                } else {
                    outputArr.append(0)
                }
            }
        }
        return outputArr
    }
    
    let p = nums.reduce(1, *)
    return nums.map { p/$0 }
}

productExceptSelf([1, 2, 3, 4])
