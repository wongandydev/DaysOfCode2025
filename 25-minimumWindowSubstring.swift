/*
Given two strings s and t of lengths m and n respectively, return the minimum window 
substring
 of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

The testcases will be generated such that the answer is unique.

 

Example 1:

Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
Example 2:

Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.
Example 3:

Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.

https://leetcode.com/problems/minimum-window-substring/
*/

// ChatGPT Solution 
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // Edge case: if either string is empty, return an empty string
        if s.isEmpty || t.isEmpty { return "" }

        let sArray = Array(s) // Convert `s` to an array for easy indexing
        var charCount = [Character: Int]() // Dictionary to store frequency of characters in `t`
        
        // Populate dictionary with character frequencies from `t`
        for char in t {
            charCount[char, default: 0] += 1
        }
        
        var left = 0, right = 0 // Two pointers for the sliding window
        var requiredChars = charCount.count // Number of unique characters in `t` that must be present in the window
        var minLength = Int.max // Track the length of the smallest valid window
        var minWindowStart = 0 // Track the starting index of the minimum window substring
        var windowCount = [Character: Int]() // Dictionary to track character counts in the current window
        var formed = 0 // Number of unique characters that have met the required frequency in the window
        
        // Expand the window by moving `right`
        while right < sArray.count {
            let char = sArray[right] // Get the current character at `right`
            windowCount[char, default: 0] += 1 // Update window frequency
            
            // If the count of the character in the window matches the required count in `t`, update `formed`
            if let required = charCount[char], windowCount[char] == required {
                formed += 1
            }
            
            // Try to contract the window from the left while it still contains all required characters
            while left <= right && formed == requiredChars {
                // Update the minimum window if this one is smaller
                if right - left + 1 < minLength {
                    minLength = right - left + 1
                    minWindowStart = left
                }

                let leftChar = sArray[left] // Get the leftmost character
                windowCount[leftChar, default: 0] -= 1 // Reduce its count in the window

                // If the reduced count makes the window invalid (i.e., missing a required character), decrease `formed`
                if let required = charCount[leftChar], windowCount[leftChar] < required {
                    formed -= 1
                }

                left += 1 // Shrink the window from the left
            }

            right += 1 // Expand the window from the right
        }

        // If no valid window was found, return an empty string; otherwise, return the substring
        return minLength == Int.max ? "" : String(sArray[minWindowStart..<minWindowStart + minLength])
    }
}



// Failed 
// the approach where this is wrong is we want to move left after finding a desireable window. When not we move the right point one to the right 
// Time: O(N ^ 2 ) Space = O(n)
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // Double for loop? 
        // go through s with dp approach. i as the start j as end 
        // WE will have a new value of t as long as i has not + 1
        // When a substring of s is found, we compare current min substring count if the new one is shorter, we set that as the new min substring
        // if the substring is nil by the end, return ""

             /*
        "ADOBECODEBANC" "ABC"

        "ABC"
        A - yes removeFirstInstanceOf "BC"
        D. no continue "BC"
        O no continue "BC"
        B yes remove first instance "C"
        E no contnue 
        C yes remove first instsane "C"
        min is nil so set min to new array "ADOBEC"
        i is no i + 1, j is i + 1
        is i, "D" in "ABC", no "ABC"
        O no continue "ABC"
        B yes "AC"
        E no "AC"
        C yes "A"
        O no "A"
        D no "A"
        E no "A"
        B no "A"
        A yes ""
        is "DOBECODEBA" smaller than "ADOBEC"? no min stays 
        reset i to i+1, and j to i + 1 and start again.  
        */


        var i = 0 
        var j = i
        var temp = t 
        var min: [Character]?
        var s = Array(s)

        while i < s.count {
            var tempString = [Character]()
            while j < s.count, !temp.isEmpty {
                let character = s[j]
                if let index = temp.firstIndex(where: {$0 == character}) {
                    temp.remove(at: index)
                }
                tempString.append(character)
                j += 1
            }
        
            if temp.isEmpty {
                if let min1 = min {
                    min = min1.count > tempString.count ? tempString : min1  //if temp string count is less than what we had, set that as the new min.
                } else {
                    min = tempString 
                }
            }

            i += 1
            j = i
            temp = t
        }

        guard let min = min else {
            return ""
        }

        return String(min)
    }
}