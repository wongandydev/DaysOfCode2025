/*
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.
 

Example 1:

Input: s = "()"

Output: true

Example 2:

Input: s = "()[]{}"

Output: true

Example 3:

Input: s = "(]"

Output: false

Example 4:

Input: s = "([])"

Output: true

https://leetcode.com/problems/valid-parentheses/description/
*/

// Same thing as below but more readible 
class Solution {
    func isValid(_ s: String) -> Bool {
        // That doesn't work b/c we need to make sure the order is the same 
        var workingArray = [Character]()
        let matchingBrackets: [Character: Character] = ["}": "{", "]":"[", ")":"("]

        for character in s {
            if let expectedOpeningBracked = matchingBrackets[character] { 
                if workingArray.last == expectedOpeningBracked {
                    workingArray.popLast()
                } else {
                    return false 
                }
            } else {
                // this is an open bracket so we can append the open bracket 
                workingArray.append(character)  
            }
        }

        return workingArray.isEmpty

    }
}

// My attempt - works 10mins 
// Space and Time complexity is O(n) -- most optimal
// But this code could be more readible and more DRY 
class Solution {
    func isValid(_ s: String) -> Bool {
        var workingArray = [Character]()
        for character in s {
            if character == ")" {
                if workingArray.last == "(" {
                    workingArray.popLast()
                    continue // we don't want to append ends if we are about to free one up
                } else {
                    return false 
                }
            } else if character == "]" {
                if workingArray.last == "[" {
                    workingArray.popLast()
                    continue // we don't want to append ends if we are about to free one up
                }  else {
                    return false 
                }
            } else if character == "}" {
                if workingArray.last == "{" {
                    workingArray.popLast()
                    continue // we don't want to append ends if we are about to free one up
                } else {
                    return false 
                }
            } else {
                // this is an open bracket so we can append the open bracket 
                workingArray.append(character)  
            }
        }

        return workingArray.isEmpty
    } 
}