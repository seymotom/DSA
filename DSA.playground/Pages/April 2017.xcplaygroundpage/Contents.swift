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
