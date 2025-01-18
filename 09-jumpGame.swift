/**
You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

Return true if you can reach the last index, or false otherwise.

Example 1:

Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
Example 2:

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
 

https://leetcode.com/problems/jump-game/description/?envType=study-plan-v2&envId=top-interview-150
**/

//https://www.youtube.com/watch?v=Yan0cv2cLy8
// Greedy Solution
/* Start from the back, if currentPosition + value in currentPostion is greater tha goalPost (starting at last position of array; keep going. If we hit 0, it's true else is false */
// Time O(n) Space O(1)

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goalPost = nums.count - 1

        for i in stride(from: nums.count-1, to: -1, by: -1) {
            if i + nums[i] >= goalPost {
                goalPost = i
            }
        }

        return (goalPost == 0 ? true : false)
    }
}

// My Approach = Failed 
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        // can I past the max count i.e does not perfect land at the end 

        return jump(numOfJump: nums[0], currentIndex: 0, nums: nums)
    }

    func jump(numOfJump: Int, currentIndex: Int, nums: [Int]) -> Bool {
        if currentIndex == nums.count - 1 {
            return true
        }

        for i in Array(1...numOfJump) {
            if currentIndex+1 >= nums.count {
                return true
            }
            jump(numOfJump: nums[currentIndex+i], currentIndex: currentIndex + i, nums: nums)
        }

        return false
    }
}