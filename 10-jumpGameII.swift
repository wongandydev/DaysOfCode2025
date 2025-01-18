/*
You are given a 0-indexed array of integers nums of length n. You are initially positioned at nums[0].

Each element nums[i] represents the maximum length of a forward jump from index i. In other words, if you are at nums[i], you can jump to any nums[i + j] where:

0 <= j <= nums[i] and
i + j < n
Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].

 

Example 1:

Input: nums = [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
Example 2:

Input: nums = [2,3,0,1,4]
Output: 2
 

Constraints:

1 <= nums.length <= 104
0 <= nums[i] <= 1000
It's guaranteed that you can reach nums[n - 1].

https://leetcode.com/problems/jump-game-ii/description/?envType=study-plan-v2&envId=top-interview-150
*/

// Greedy Solution Time O(n) Space O(1)
// We will keep iterating. We know the furtherst we can reach is where we are now + the value (number of jumps available) so we don't officially make the jump till index gets to the end marks (last possible starting index). We store another value far which is furthest we can jump. When we hit index == end, we replace end with the furthest we can jump. This will give us the min. And we are updated far every iteration of the array to see if we can go further. 
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var end = 0 // Starting index
        var far = 0 // Furthest reaching index
        var answer = 0

        for index in 0..<nums.count-1 {
            far = max(far, index + nums[index])
            if index == end {
                end = far
                answer += 1
            }
        }

        return answer 
    }
}

// FAILED - My approach, use recurssion to keep going through and find the minJump when you hit the end
// Got Fatal error: Error when serializing long: 9223372036854775807 out of range
class Solution {
    func jump(_ nums: [Int]) -> Int {
        // It is reachable. We don't need to worry about that.
        // We need to figure out min jumps to get to end.
        var minNumOfJump = Int.max
        jumping(nums, jumpsDone: 0, index: 0, minNumOfJump: &minNumOfJump)
        return minNumOfJump
    }

    func jumping(_ nums: [Int], jumpsDone: Int, index: Int, minNumOfJump: inout Int) -> Int {
        print(index)
        if index >= nums.count - 1 {
            // reached the end 
            minNumOfJump = min(jumpsDone, minNumOfJump)
            return 0
        }

        // Meaning where we landed hae no value we can jump 
        if nums[index] != 0 {
            for jumpValue in 1...nums[index] {
                return jumping(nums, jumpsDone: jumpsDone + 1, index: index + jumpValue, minNumOfJump: &minNumOfJump)
            }
        } 

        return 0
    }
}