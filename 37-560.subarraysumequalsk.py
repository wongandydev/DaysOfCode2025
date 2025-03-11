# my Solution 
class Solution(object):
    def subarraySum(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        prefix_sum = {}
        current_sum = 0
        count = 0 

        for num in nums: 
            if current_sum - num in prefix_sum: 
                count += 1
            prefix_sum.get(num), 0 = current_sum - num
        return count 

# Correect Solution 
class Solution(object):
    def subarraySum(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        prefix_sum = {0:1}
        current_sum = 0
        count = 0 

        for num in nums: 
            current_sum += num

            if current_sum - k in prefix_sum: 
                count += prefix_sum[current_sum - k] 

            prefix_sum[current_sum] = prefix_sum.get(current_sum, 0) + 1
        return count 