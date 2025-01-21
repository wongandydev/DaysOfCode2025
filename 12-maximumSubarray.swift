/*
Given an integer array nums, find the 
subarray
 with the largest sum, and return its sum.

 

Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.
Example 2:

Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.
Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
 

Constraints:

1 <= nums.length <= 105
-104 <= nums[i] <= 104
 

Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

https://leetcode.com/problems/maximum-subarray/description/
*/

// Optimal O(n) solution from LeetCode editorial 
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //dp approach
        // 0, 1 to start, and we keep adding the sub array as long as that sum is > than lastSum. once it's not, we move 0 to 1 - b/c moving to j would skip some potenetial possibilties
        var currentSum = 0
        var maxSum = nums[0]
        for (idx, val) in nums.enumerated() {
            // idea here is whatever the sum is before, if negative we 0 it out and take the currentValue as the final possible index value.
            // When currentSum is < 0, it will be zeroed 
            currentSum = max(0, currentSum) + val
            // this will decide is the current final value is max. 
            maxSum = max(maxSum, currentSum)
        }

        return maxSum
    }
}

// Solution using double for loop
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //dp approach
        // 0, 1 to start, and we keep adding the sub array as long as that sum is > than lastSum. once it's not, we move 0 to 1 - b/c moving to j would skip some potenetial possibilties
        // Time O(n^2) Space O(1)
        var maxSum = nums[0]
        for a in 0..<nums.count {
            var workingSum = 0
            for b in a...nums.count - 1 {
                workingSum += nums[b]
                maxSum = max(maxSum, workingSum)
            }
        }

        return maxSum
        
    }
}

// FAIELD attempt at brute force
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //dp approach
        // 0, 1 to start, and we keep adding the sub array as long as that sum is > than lastSum. once it's not, we move 0 to 1 - b/c moving to j would skip some potenetial possibilties

        var a = 0
        var b = 1 
        var maxSum = nums[0]
        while a < nums.count - 1 {
            var workingSum = 0
            while b < nums.count-1 {
                b += 1
                workingSum += nums[b]
                maxSum = max(maxSum, workingSum)
            }
            a += 1
        }

        return maxSum
        
    }
}