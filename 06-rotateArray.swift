/**
Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

Example 1:

Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
Example 2:

Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]

https://leetcode.com/problems/rotate-array/description/?envType=study-plan-v2&envId=top-interview-150
**/

// Using Modulo and reverse Time O(n) Space O(1)
// Explaination https://www.youtube.com/watch?v=BHr381Guz3Y
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty ||  k > 0  else { return }

        // Pointers
        let n = nums.count
        let k = k % n

        // Reverse entire array
        // We can reimplement the reverse array on our own if we are asked to create the reverse function 
        // two points, left and right, swap till left is > than right 
        nums.reverse()

        // Reverse first k elements
        nums[0..<k].reverse() 
        // Reverse remaining n-k elements
        nums[k..<n].reverse()
    }
}

// First attempt Time O(n*k)  Space O(1)
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var count = 0
        // stop when count == k 
        while count < k {
            // hold pointed at end of array 
            let lastItem = nums[nums.count - 1]
            var index = nums.count - 1
            // shift everything to the right, replce [0] with last pointer
            while index > 0 {
                nums[index] = nums[index - 1]
                index -= 1
            }
            
            nums[0] = lastItem
            // iterate counter
            count += 1
        }
    }
}

