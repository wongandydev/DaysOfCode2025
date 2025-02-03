/*
Given two strings s and t, return true if t is an 
anagram
 of s, and false otherwise.

 

Example 1:

Input: s = "anagram", t = "nagaram"

Output: true

Example 2:

Input: s = "rat", t = "car"

Output: false

 

Constraints:

1 <= s.length, t.length <= 5 * 104
s and t consist of lowercase English letters.
 

Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

https://leetcode.com/problems/valid-anagram/
*/

/* Pretty sure my approach was best
LeetCode option one was to sort and then check if both arrays are the same
Option 2 uses a Dictionary but based of 26 letters of the alphabet and then using ascii to get the two arrays counted on number of letter occurence and confirming they are the same. O(n + k) time complexity since you have to introduce a new array of 26 elements. twice. 
*/

// Space ant time complexity is O(n)
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // Iterate through chars of s, check .contains t if no return false otherwise continue 
        // return true at end of array .contains O(n)
        // we can make s array as a set and that will make it unique and lead to O(1) when doing .contains 
        // var sSet: Set = Set(s.map { String($0) })
        // var tSet: Set = Set(t.map { String($0) })

        var dict = [Character: Int]()
        // Set both of the sets, and then set a combined, they should be the same when compared. 
        for character in s {
            dict[character, default: 0] += 1
        }
        
        for character in t {
            guard dict[character] != nil else {
                return false 
            }

            dict[character]! -= 1
        }

        return Set(dict.values).count == 1 && dict.values.first == 0 //dict.values.removeOccurrences(of: 0).isEmpty
    }
}