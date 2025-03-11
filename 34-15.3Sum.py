
#Correct Solution O(n^2) 
class Solution(object):
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        nums.sort()  # Sort in place
        result = []  # Store triplets

        for i in range(len(nums) - 2):
            if i > 0 and nums[i] == nums[i - 1]:  # Skip duplicate `i`
                continue  

            j, k = i + 1, len(nums) - 1  # Two pointers
            while j < k:
                three_sum = nums[i] + nums[j] + nums[k]

                if three_sum == 0:  # Found a valid triplet
                    result.append([nums[i], nums[j], nums[k]])
                    
                    # Skip duplicate values for `j` and `k`
                    while j < k and nums[j] == nums[j + 1]:
                        j += 1  
                    while j < k and nums[k] == nums[k - 1]:
                        k -= 1  

                    j += 1
                    k -= 1
                
                elif three_sum < 0:
                    j += 1  # Increase sum by moving `j` right
                else:
                    k -= 1  # Decrease sum by moving `k` left

        return result


# My Solution 
class Solution(object):
    def threeSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        sorted_nums = nums.sort()
        i,j = 0, 1
        k = len(nums) - 1

        distinct_triplets = set()

        while j < k:
            #0
            if nums[j] + nums[k] == -abs(nums[i]):
                distinct_triplets.appemd([i, j, k])
            elif  nums[j] + nums[k] + nums[i] > 0:
                k -= 1
            else: 
                j += 1

        return distinct_triplets