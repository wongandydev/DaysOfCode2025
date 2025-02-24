from typing import List

def sort_list(unsorted_list: List[int]) -> List[int]:
    #bubble sort
    # top down, bubble sort, highest value bubbles to the top so we can go from last to first 
    arrLength = len(unsorted_list)
    for index in reversed(range(arrLength)): 
        swapped = False 
        print(index)
        # we will iterated from 0 - end of array - 1 to swap until the max is the last value.
        for j in range(index): #python is right exclused
            if unsorted_list[j] > unsorted_list[j+1]:
                print(unsorted_list)
                unsorted_list[j], unsorted_list[j+1] = unsorted_list[j+1], unsorted_list[j]
                print("after swap", unsorted_list)
                swapped = True
                
        # if we did not ned to swap that mean list is sorted
        if not swapped:
            return unsorted_list
    return unsorted_list
        
    
    # selection sort 
    for index in range(len(unsorted_list)): 
        min_index = index
        for j in range(index, len(unsorted_list)):
            if unsorted_list[j] < unsorted_list[min_index]:
                min_index = j
        unsorted_list[min_index], unsorted_list[index] = unsorted_list[index], unsorted_list[min_index]
    return unsorted_list
    
    
    # Insertion Sort
    for index in range(len(unsorted_list)):
        current = index
         # previous value is larger than currrent value
        while current > 0 and unsorted_list[current] < unsorted_list[current - 1]:
            # swap
            unsorted_list[current], unsorted_list[current - 1] = unsorted_list[current-1], unsorted_list[current]
            # we want to interate through the values to before and make sure they are sorted to otherwise swap. THen we keep iterating
            current -= 1 

    return unsorted_list

if __name__ == "__main__":
    unsorted_list = [int(x) for x in input().split()]
    res = sort_list(unsorted_list)
    print(" ".join(map(str, res)))
