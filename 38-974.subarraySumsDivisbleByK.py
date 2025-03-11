# My Solution
class Solution(object):
    def subarraysDivByK(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        prefix_sum = {0:1}
        current_sum = 0
        count = 0

        for num in nums: 
            print(prefix_sum)
            current_sum += num

            if current_sum % k == 0: 
                count += prefix_sum[current_sum / k]
            prefix_sum[current_sum / k] = prefix_sum.get(current_sum / k, 0) + 1

        return count

        # current_sum % k == 0

# correct solution: 
class Solution(object):
    def subarraysDivByK(self, nums, k):
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
            remainder = current_sum % k
            if remainder in prefix_sum: 
                count += prefix_sum[remainder]
            prefix_sum[remainder] = prefix_sum.get(remainder, 0) + 1
            print(prefix_sum)
        return count

        # current_sum % k == 0