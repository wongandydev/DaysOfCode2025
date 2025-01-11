// Better readability 
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0
        for num in nums {
            if k < 2 || nums[k - 2] != num {
                nums[k] = num
                k += 1
            }
        }
        return k
    }
}

// My Solution - already optimal 
class Solution {
    // nums = [1,1,1,2,2,3]
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k = 0
        var lastAddedValue = nums[0]
        var hasAddedTwice = false // false 

        for (index, value) in nums.enumerated() {
            //1  , 1
            // k = 1 
            // 2, 1 
            // 3, 2 
            // 2 != 1 false [1,1] k = 2 ]1,1,2]
            // 4, 2 k = 3 [1, 1, 2, 2] true 
            // 5, 3 2 != 3 [1, 1, 2, 2, 3] false 
            if index == 0 {
                continue 
            }

            if nums[k] != value {
                hasAddedTwice = false 
                k += 1 
                nums[k] = value
                lastAddedValue = value
            } else {
                if value == lastAddedValue {
                    if hasAddedTwice {
                        continue 
                    } 
                    
                    k += 1
                    nums[k] = value
                    lastAddedValue = value
                    hasAddedTwice = true  
                } 
            }
        }

        return k + 1
    }
}