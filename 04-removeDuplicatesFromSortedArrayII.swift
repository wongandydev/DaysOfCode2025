/**
Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
Return k.
Custom Judge:

The judge will test your solution with the following code:

int[] nums = [...]; // Input array
int[] expectedNums = [...]; // The expected answer with correct length

int k = removeDuplicates(nums); // Calls your implementation

assert k == expectedNums.length;
for (int i = 0; i < k; i++) {
    assert nums[i] == expectedNums[i];
}
If all assertions pass, then your solution will be accepted.

 

Example 1:

Input: nums = [1,1,2]
Output: 2, nums = [1,2,_]
Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
Example 2:

Input: nums = [0,0,1,1,1,2,2,3,3,4]
Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
 
https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
**/

// Better readability 
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0
        for num in nums {
            if k < 2 || nums[k - 2] != num {
                nums[k] = num
                k += 1
            }
        }
        return k
    }
}

// My Solution - already optimal 
class Solution {
    // nums = [1,1,1,2,2,3]
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0
        var lastAddedValue = nums[0]
        var hasAddedTwice = false // false 

        for (index, value) in nums.enumerated() {
            //1  , 1
            // k = 1 
            // 2, 1 
            // 3, 2 
            // 2 != 1 false [1,1] k = 2 ]1,1,2]
            // 4, 2 k = 3 [1, 1, 2, 2] true 
            // 5, 3 2 != 3 [1, 1, 2, 2, 3] false 
            if index == 0 {
                continue 
            }

            if nums[k] != value {
                hasAddedTwice = false 
                k += 1 
                nums[k] = value
                lastAddedValue = value
            } else {
                if value == lastAddedValue {
                    if hasAddedTwice {
                        continue 
                    } 
                    
                    k += 1
                    nums[k] = value
                    lastAddedValue = value
                    hasAddedTwice = true  
                } 
            }
        }

        return k + 1
    }
}