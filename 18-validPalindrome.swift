/*
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

 

Example 1:

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Example 2:

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
Example 3:

Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
*/

// More efficient 
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var s = Array(s)
        var left = 0
        var right = s.count - 1 

        while left < right {
            guard s[left].isLetter || s[left].isNumber else { left += 1; continue }
            guard s[right].isLetter || s[right].isNumber else { right -= 1; continue }

            guard s[left].lowercased() == s[right].lowercased() else { return false }
            left += 1
            right -= 1
        }

        return true 
    }
}


// Spce can be O of 1 if used a while or for loop to iterate through 
// My Solution - first approach
// Space O(n) Time O(n)
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        // rrim whilespace
        // filter out nonalphanumering characters
        // confirm current and .reversed() is the same 

        // might not be the most efficent since we are going through the array of character each time.
        // We may be able to use a DP aproach where we check the character is akphamnumber uf either left or right isn't we keep going until one is, Then check if character is the same if it is then we can proceed to confirm if they are equal. Once one is nto equal we can reuturn false. Else we return true 


        let trimmed = s.replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression).lowercased()
        print(trimmed)
        return trimmed == String(trimmed.reversed())
    }
}