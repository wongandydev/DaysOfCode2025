/**
You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

Merge nums1 and nums2 into a single array sorted in non-decreasing order.

The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

https://leetcode.com/problems/merge-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
**/

// Brute force / My solution 
class Solution {

}

// Ideal Solution 
class Solution {
    // - Complexity:
    //   - time: O(m + n), where m is the number of elements in nums1, and n is the number of elements in nums2.
    //   - space: O(1), only constant space is used.

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // We haave the number of elements (m and n) for nums1 and 2 repspectively 
        var lastA = m - 1 // this would be 2 in nums1 not 5 in this example [1,2,3,0,0,0]
        var lastB = n - 1
        var curr = nums1.count - 1 // This is for the actual array 

        // We are going to move from the end of the array since we know that this is already sorted so which ever array has the largest element should be there first 
        while lastA >= 0, lastB >= 0 {
            if nums1[lastA] >= nums2[lastB] {
                nums1[curr] = nums1[lastA]
                lastA -= 1
            } else {
                nums1[curr] = nums2[lastB]
                lastB -= 1
            }
            curr -= 1
        }

        while lastB >= 0 {
            nums1[curr] = nums2[lastB]
            lastB -= 1
            curr -= 1
        }
    }

}