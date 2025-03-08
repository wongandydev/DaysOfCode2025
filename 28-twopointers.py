# Input: nums = [2, 7, 11, 15], target = 9
# Output: [1, 2]  # nums[0] + nums[1] = 2 + 7 = 9

# Input: nums = [1, 3, 4, 6, 8], target = 10
# Output: [2, 4]  # nums[1] + nums[3] = 3 + 7 = 10

def solution(nums, target): 
    left = 0
    right = len(nums) - 1

    while left < right: 
        sum_value = nums[left] + nums[right]
        if sum_value > target: 
            right -= 1
        elif sum_value < target: 
            left += 1
        else:
            return [left + 1, right + 1]
    return -1 # not found