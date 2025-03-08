# Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
# Output: 6  # (Subarray: [4,-1,2,1])

# Input: nums = [1]
# Output: 1  # (Subarray: [1])


# Input: nums = [5,4,-1,7,8]
# Output: 23  # (Subarray: [5,4,-1,7,8])

# My Solution 
# def solution(nums):
#     current_sum = 0
#     max_sum = 0 

#     for i in range(0, len(nums) - 1):
#         current_sum = max(nums[i], current_sum + nums[i])
#         max_sum = max(max_sum, current_sum)

#     return max_sum

# Correct Solution 
def solution(nums):
    max_sum = nums[0]
    current_sum = nums[0]

    for i in range(1, len(nums)):
        current_sum = max(nums[i], current_sum + nums[i])
        max_sum = max(max_sum, current_sum)
    return max_sum