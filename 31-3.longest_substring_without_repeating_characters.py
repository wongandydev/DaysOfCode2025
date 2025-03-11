# 3. Longest Substring Without Repeating Characters
# Medium
# Hint
# Given a string s, find the length of the longest substring without duplicate characters.

# Example 1:
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# Example 2:
# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Example 3:
# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "p

class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """

        char_set = set() 
        left = 0 
        max_length = 0 

        for right in range(len(s)):
            while s[right] in char_set: 
                char_set.remove(s[left])
                left += 1
            char_set.add(s[right])
            max_length = max(max_length, right - left + 1)

        return max_length
        # left, right = 0, 1
        # hash_map = {s[left]:1}
        # max_count = 0 
        # count = 1

        # while left < right: 
        #     if right in hash_map:
        #         left += 1
        #         count -= 1
        #     else: 
        #         hash_map[right] = 1
        #         right += 1
        #         count += 1 
        #         max_count = max(max_count, count)
        # return max_count

        