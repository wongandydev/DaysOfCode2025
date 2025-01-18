/*
Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.

According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.

 

Example 1:

Input: citations = [3,0,6,1,5]
Output: 3
Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
Example 2:

Input: citations = [1,3,1]
Output: 1
 

Constraints:

n == citations.length
1 <= n <= 5000
0 <= citations[i] <= 1000

https://leetcode.com/problems/h-index/description/?envType=study-plan-v2&envId=top-interview-150
*/

//TODO: See if there is something faster 

//Solution 
// https://www.youtube.com/watch?v=mgG5KFTvfPw
// Time O(n) Space O(n)
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        var paperCountDict = [Int: Int]()

        for (index, citation) in citations.enumerated() {
            paperCountDict[min(n, citation), default: 0] += 1 
        }

        var h = n
        var papers = paperCountDict[n] ?? 0

        while papers < h {
            h -= 1
            papers += paperCountDict[h] ?? 0
        }

        return h 
    }
}


// Working Brute Force
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        for h in 0...citations.count {
            var numsOfPaper = 0 

            for citation in citations {
                if citation >= h {
                    numsOfPaper += 1
                } 
            }

            if numsOfPaper < h {
                return h - 1
            }
        }

        return citations.count
    }
}


/* My appraoch - brute force only passed less than half the test cases. But passed the examples 
I didn't read the prompt all the way through. It also needs to be h papers with h citations i.e 3 papers, 3 citations. That's why [100] is 1 

The correct brute force here is to increment a count say h up till size of array, and see if we have h papers with h citations. IF so increment h till we can't the last h is our answer*/

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        guard citations.count > 1 else { if citations[0] == 0 { return 0 } else { return 1 }}

        var sortedCitations = citations.sorted() 
        let median = sortedCitations[citations.count/2]
        return median
    }
}