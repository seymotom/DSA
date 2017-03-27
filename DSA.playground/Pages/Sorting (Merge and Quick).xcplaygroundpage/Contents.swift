//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


// Merge Sort


/*
 Merge sort has a runtime of O(n * log(n))
 
 Here's how it works:
 
 If the array only has one element, return it
 
 Call this function on the left side and the right side. Set these calls equal to variables left and right
 
 Merge left and right together (assuming that left and right are sorted) and return that array
 
 */

func mergeSort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    
    let midIndex = arr.count / 2
    
    let left = mergeSort(arr: Array(arr[0..<midIndex]))
    let right = mergeSort(arr: Array(arr[midIndex..<arr.count]))
    
    return mergeRecursivelyTakeTwo(leftArr: left, rightArr: right)
}

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var leftPointer = 0
    var rightPoiner = 0
    var mergedArr: [Int] = []
    
    while leftPointer < leftArr.count && rightPoiner < rightArr.count {
        if leftArr[leftPointer] < rightArr[rightPoiner] {
            mergedArr.append(leftArr[leftPointer])
            leftPointer += 1
        } else {
            mergedArr.append(rightArr[rightPoiner])
            rightPoiner += 1
        }
    }
    return mergedArr + leftArr[leftPointer..<leftArr.count] + rightArr[rightPoiner..<rightArr.count]
}

func mergeRecursively(leftArr: [Int], rightArr: [Int], leftIndex: Int = 0, rightIndex: Int = 0, finalArr: [Int] = []) -> [Int] {
    
    var finalArr = finalArr
    var leftIndex = leftIndex
    var rightIndex = rightIndex
    // base case
    guard leftIndex < leftArr.count && rightIndex < rightArr.count else {
        return finalArr + leftArr[leftIndex..<leftArr.count] + rightArr[rightIndex..<rightArr.count]
    }
    
    if leftArr[leftIndex] < rightArr[rightIndex] {
        finalArr.append(leftArr[leftIndex])
        leftIndex += 1
    } else {
        finalArr.append(rightArr[rightIndex])
        rightIndex += 1
    }
    return mergeRecursively(leftArr: leftArr, rightArr: rightArr, leftIndex: leftIndex, rightIndex: rightIndex, finalArr: finalArr)
    
}

func mergeRecursivelyTakeTwo(leftArr: [Int], rightArr: [Int]) -> [Int] {
    // base case
    guard leftArr.count > 0 && rightArr.count > 0 else {
        return leftArr + rightArr
    }
    // recursive call
    if leftArr.last! > rightArr.last! {
        return mergeRecursivelyTakeTwo(leftArr: Array(leftArr[0..<leftArr.count - 1]), rightArr: rightArr) + [leftArr.last!]
    } else {
        return mergeRecursivelyTakeTwo(leftArr: leftArr, rightArr: Array(rightArr[0..<rightArr.count - 1])) + [rightArr.last!]
    }
}





mergeRecursively(leftArr: [1, 3, 5], rightArr: [2, 3, 4, 5, 7, 9])
mergeRecursivelyTakeTwo(leftArr: [1, 3, 5], rightArr: [2, 3, 4, 5, 7, 9])




mergeSort(arr: [1, 7, 3, 0, 23, 4, 1, 12, 23, 34, 6, 12, 3])



/*
 Quicksort
 Here's how it works:
 
 If the array has only one element, return it.
 Find the middle element of the array and name it pivot.
 Move all the elements smaller than the pivot into an array called less.
 Move all the elements equal to the pivot into an array called equal.
 Move all the elements greater than the pivot into an array called greater
 Return the following:
 This function passing in less as input + equal + this function passing in greater as input.
 
 
 */


func quicksort(arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    
    let pivot = arr[arr.count / 2]
    let less = arr.filter { $0 < pivot }
    let equal = arr.filter { $0 == pivot }
    let greater = arr.filter { $0 > pivot }
    
    return quicksort(arr: less) + equal + quicksort(arr: greater)
}

