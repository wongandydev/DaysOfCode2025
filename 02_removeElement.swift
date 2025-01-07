/**
Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.

Consider the number of elements in nums which are not equal to val be k, to get accepted, you need to do the following things:

Change the array nums such that the first k elements of nums contain the elements which are not equal to val. The remaining elements of nums are not important as well as the size of nums.
Return k.

https://leetcode.com/problems/remove-element/?envType=study-plan-v2&envId=top-interview-150
**/

// Brute Force/ My Solution 
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll(where: { $0 == val})
        return nums.count
    }
}

// Ideal Solution
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0 

        for num in nums {
            guard num != val else { continue }
            nums[i] = num 
            i += 1
        }

        return i
    }
}