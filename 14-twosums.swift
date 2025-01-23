/*
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

 

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]
 

Constraints:

2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.

https://leetcode.com/problems/two-sum/description/
*/

// My solution years ago - dictionary 
// This is O(n) space and time 
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index,value) in nums.enumerated() {
            if let targetIndex = dict[target-value] { 
                return [index,targetIndex]
            }
            dict[value] = index
        }
        
        return [-1,-1]
    }
}


// Another possible solution: Double For Loop O(n^2) though 

// First Attempt - Passed most but not all
// I was trying to hard to perfect this by not using .sorted but knew it was O(n log n )
// I was trying to do DP, one at left and right 
// But other problem with this being sorted and not working is that we will need to get firstIndex and lastIndex of left and right respectively since left and right index is refering to the sorted Array 
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0 
        var right = nums.count - 1 

        var nums = nums.sorted()
        while left < right {
            var sum = nums[left] + nums[right]
            if sum == target {
                return [left, right]
            } else if sum > target {
                right -= 1
            } else {
                left += 1
            }
        }
        return [-1, -1]// this will never hit based on prompt because we are guaranteed to always have an answer 
    }
}