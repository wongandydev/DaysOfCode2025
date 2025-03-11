// 209. Minimum Size Subarray Sum
// Medium
// Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

// Example 1:
// Input: target = 7, nums = [2,3,1,2,4,3]
// Output: 2
// Explanation: The subarray [4,3] has the minimal length under the problem constraint.

// Example 2:
// Input: target = 4, nums = [1,4,4]
// Output: 1

// Example 3:
// Input: target = 11, nums = [1,1,1,1,1,1,1,1]
// Output: 0

class Solution(object):
    def minSubArrayLen(self, target, nums):
        """
        :type target: int
        :type nums: List[int]
        :rtype: int
        """
        left = 0 
        min_count = float('inf')
        current_sum = 0

        for right in range(len(nums)):
            current_sum += nums[right]
            
            while current_sum >= target:
                min_count = min(min_count, right - left + 1)
                current_sum -= nums[left]
                left += 1
                
        return min_count if min_count != float('inf') else 0