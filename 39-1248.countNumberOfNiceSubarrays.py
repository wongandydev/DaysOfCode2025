class Solution(object):
    def numberOfSubarrays(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        # we need to store in the prefix the count of odd number in the current summ
        # key: # of odd numbers 
        # value: count this has occured 

        current_num_of_odd_number = 0
        prefix = {0:1} # this is to start the count, this should not matter? 
        count = 0 

        for num in nums:
            if num % 2 == 1:
                current_num_of_odd_number += 1
            if current_num_of_odd_number - k in prefix:
                count += prefix[current_num_of_odd_number - k]
            prefix[current_num_of_odd_number] = prefix.get(current_num_of_odd_number, 0) + 1
        return count 