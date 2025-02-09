/*
You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

 

Example 1:

Input: n = 5, bad = 4
Output: 4
Explanation:
call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true
Then 4 is the first bad version.
Example 2:

Input: n = 1, bad = 1
Output: 1
 

Constraints:

1 <= bad <= n <= 231 - 1

https://leetcode.com/problems/first-bad-version/description/
*/

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) ->å Bool{}
 */

// My solution Time: O(log n) Space O(1)  
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        // we can do a BS appraoch. Mid of the array, if true, then right goes to mid -1 if false left goes to mid + 1
        var left = 1 
        var right = n
        var answer = -1
        // n = 5 
        // 1 + (5 - 1)/2 
        // left = 4
        // 4 < 5 
        // 4 + (5-4)/2
        //mid = 4.5 aka 4 
        // right = 3 
        // 4 < 3 END WHILE 
        while left <= right {
            let mid = left + (right - left)/2
            print(mid)
            if isBadVersion(mid) {
                right = mid - 1
                answer = mid
            } else {
                left = mid + 1
            }
        }

        return answer


        // // brute foce
        // for i in 1...n {
        //     print(i)
        //     if isBadVersion(i) {
        //         return i
        //     }
        // }

        // return -1
    }
}