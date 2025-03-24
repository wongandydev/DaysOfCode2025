# AlgoMonster - The Peak of a Mountain Array 

# Solution 
# I was close but need to thinking about the feasible funciton 
# I know that before getting to the peak, it would be incrementing
# But once we find the peak everything will be decreasing 

def peak_of_mountain_array(arr: List[int]) -> int:
    arrLen = len(arr)
    left, right = 0, arrLen - 1
    boundary_index = -1 

    while left <= right:
        mid = (left + right) // 2
        if arr[mid] > arr[mid + 1]:
            boundary_index = mid
            right = mid - 1 # we know this is the highest so far so we need right to mid we were just at -1 to see if that is the peak or it's some where else 
        else: 
            left = mid + 1 # we didn't find the peak so lets move up 

# My Attempt 
def peak_of_mountain_array(arr: List[int]) -> int:
    # WRITE YOUR BRILLIANT CODE HERE
    if len(arr) < 3: # A mountain array is defined as an array that has at least 3 elemebtns 
        return 0 
    
    left, right = 0, len(arr) - 1
    while left <= right: # if we cross then we explored all options 
        midpoint = (left + right) // 2
        # should we split in two and go left and right here? 
        if arr[midpoint-1] < arr[midpoint] > arr[midpoint+1]:
            return midpoint 
        elif arr[midpoint-1] > arr[midpoint]:
            right = arr[midpoint-1]
        else:
            left = arr[midpoint+1]
        
    return 0

if __name__ == "__ma in__":
    arr = [int(x) for x in input().split()]
    res = peak_of_mountain_array(arr)
    print(res)
