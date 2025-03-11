# answer
class Solution(object):
    def maxProduct(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        min_product = nums[0]
        max_product = nums[0]
        result = nums[0]

        for i in range(1, len(nums)):  # Iterate from index 1
            num = nums[i]

            # If num is negative, swap min and max
            if num < 0:
                min_product, max_product = max_product, min_product
            
            # Update max and min product for this index
            max_product = max(num, max_product * num)
            min_product = min(num, min_product * num)

            # Update global result
            result = max(result, max_product)

        return result


# second try 
class Solution(object):
    def maxProduct(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        min_product = 1
        max_product = nums[0]
        current_product = 1
        
        for num in nums {
            if num != 0 {
                current_product * num 
            }

            if nums[i] < 0:
                min_product, max_product = max_product, min_product
            
            min_product = min(min_product, current_product)
            max_product = max(max_product, current_product)
        }

# first try 
class Solution(object):
    def maxProduct(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        max_product = nums[0]
        i = 0

        while i < len(nums)-1:
            for j in range(i + 1, len(nums) - 1):
                max_product = max(max_product, nums[i] * nums[j])
            i+=1

        return max_product