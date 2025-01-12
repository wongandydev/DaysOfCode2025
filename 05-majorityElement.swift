/**
Given an array nums of size n, return the majority element.

The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

Example 1:

Input: nums = [3,2,3]
Output: 3
Example 2:

Input: nums = [2,2,1,1,1,2,2]
Output: 2
 
https://leetcode.com/problems/majority-element/description/?envType=study-plan-v2&envId=top-interview-150
**/

// Better solution Boyer-Moore Voting Algorithm
// This is reliant on the prompt saying that we can assume the majority element always exists 
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0 
        var possibleMajorityCandidate = 0

        for num in nums {
            if count == 0 {
                count += 1
                possibleMajorityCandidate = num
            } else if num == possibleMajorityCandidate {
                count += 1
            } else {
                // Assuming that possibleMajorityCandidate was not overthrough and the num is not the same as the currentCandidate
                // So it loses a vote 
                
                count -= 1
            }
        }

        return possibleMajorityCandidate
    }
}

/// Another solution would be hash map, that would have been better than below in time complexity but not space complexity. Space and Time O(n)

// Brute Force - 1st Attempt Space: O(1) Time: O(n^2)
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var max = 0 
        var majorityElement = 0
        for num in nums {
            let occurenceOfNum = nums.filter({$0 == num}).count
            if occurenceOfNum > max && occurenceOfNum > nums.count/2 {
                max = occurenceOfNum
                majorityElement = num
                break
            }
        }

        return majorityElement
    }
}