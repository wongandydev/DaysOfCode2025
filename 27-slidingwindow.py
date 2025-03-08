# Correct Solution 
def solution(s):
    char_set = set()  # To track unique characters in the window
    left = 0  # Left pointer of the sliding window
    max_length = 0  # Stores the longest substring length

    for right in range(len(s)):  # Expand the window with `right`
        while s[right] in char_set:  # If duplicate found, shrink from `left`
            char_set.remove(s[left])
            left += 1
        
        char_set.add(s[right])  # Add new unique character
        max_length = max(max_length, right - left + 1)  # Update max length

    return max_length


# My Solution 
# def solution(s): 
#     i, j = 0 
#     longestSubtring = 0 
#     lastValue = s[i]
#     while i < j {
#         if s[j] != lastValue {
#             j += 1
#         } else {
#             # they equal 
#             i = j
#             longestSubtring = max(longestSubtring, (j - i)+1)
#         }
#     }

#     return longestSubtring

# Input: s = "abcabcbb"
# Output: 3  # ("abc" is the longest substring)

# Input: s = "bbbbb"
# Output: 1  # ("b" is the longest substring)

# Input: s = "pwwkew"
# Output: 3  # ("wke" is the longest substring)
