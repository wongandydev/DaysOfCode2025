# Input: nums = [1,1,1], k = 2
# Output: 2  # ([1,1], [1,1])

# Input: nums = [3,4,7,2,-3,1,4,2], k = 7
# Output: 4  # ([3,4], [7], [4,7,-3,-1], [1,4,2])

## My Solution 
# def solution(nums, k):
#     prefix = build_prefix(nums)

#     return prefix[k]

# def build_prefix(nums):
#     prefix = {} 

#     for i in range(0, len(nums)):
#         prefix[prefix[i-1] + nums[i]] = (0, prefix[prefix[i-1] + nums[i]] + 1)

#     return prefix

## Correct Solution 
# def solution(nums, k):
#     prefix = {0: 1}  # Track sum occurrences (Base case: sum 0 appears once)
#     current_sum = 0  # Running sum
#     count = 0  # Total number of subarrays that sum to k

#     for num in nums:
#         current_sum += num  # Build prefix sum
        
#         # If (current_sum - k) exists, we found valid subarrays
#         if (current_sum - k) in prefix:
#             count += prefix[current_sum - k]

#         # Store/update prefix sum count
#         prefix[current_sum] = prefix.get(current_sum, 0) + 1  

#     return count

## Try again 
# Given an array nums and an integer k, find the length of the longest contiguous subarray that sums t
# Input: nums = [1, -1, 5, -2, 3], k = 3
# Output: 4  # (Subarray: [1, -1, 5, -2])

# Input: nums = [-2, -1, 2, 1], k = 1
# Output: 2  # (Subarray: [-1, 2])

# Input: nums = [3, 1, 0, 1, 8], k = 4
# Output: 3  # (Subarray: [3, 1, 0])
## My Solution 
def solution(nums, k):
    prefix = {0:1}
    count = 0 
    current_sum = 0

    for num in nums:
        # check if previous subarray has it 
        if prefix.get(current_sum-k) != None {
            count += prefix[current_sum-k] 
        }
    prefix[current_sum] = (previous[current_sum], 0) + 1

    return count 
# Correct Solution 
def solution(nums, k):
    prefix = {0: -1}  # Stores prefix sum and its earliest index
    current_sum = 0
    max_length = 0  # Stores longest subarray length

    for i in range(len(nums)):
        current_sum += nums[i]  # Update running sum

        # If (current_sum - k) exists in prefix, check subarray length
        if (current_sum - k) in prefix:
            max_length = max(max_length, i - prefix[current_sum - k])

        # Store only the first occurrence of a prefix sum
        if current_sum not in prefix:
            prefix[current_sum] = i  

    return max_length
