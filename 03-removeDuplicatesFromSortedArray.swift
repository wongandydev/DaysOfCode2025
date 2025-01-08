/**
Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
Return k.

https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
**/
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0 // this ts the number we will return where numbers before it are not duplicates. 
        var element = -101

        for num in nums { 
            guard k <= nums.count else { continue }
            guard num != element else { continue }

            nums[k] = num
            k+=1 
            element = num 
        }

        return k
    }
}