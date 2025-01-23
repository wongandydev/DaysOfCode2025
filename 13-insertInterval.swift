/*
You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return intervals after the insertion.

Note that you don't need to modify intervals in-place. You can make a new array and return it.

 

Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
 

Constraints:

0 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 105
intervals is sorted by starti in ascending order.
newInterval.length == 2
0 <= start <= end <= 105

https://leetcode.com/problems/insert-interval/description/
*/


/// After watching video submission Sapce O(n)
/// https://www.youtube.com/watch?v=A8NUOmlwOlM
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        // CHeck if the start of the newINtervial is after the end of the current itereating interval
        // check ifn the end of the newInterval is before ht estart of the curent interating interval 
        // otherwise check min of both starts and max of both ends

        var newInterval = newInterval
        var result = [[Int]]()

        for (index, interval) in intervals.enumerated() {
            let newIntervalStart = newInterval[0]
            let newIntervalEnd = newInterval[1]

            let start = interval[0]
            let end = interval[1]

            if start > newIntervalEnd{
                // this means the insertingInterval is before the current interval 
                result.append(newInterval)
                return result + intervals.suffix((intervals.count)-index)
                // return the rest here.... 
            } else if end < newIntervalStart {
                // this means the insertingInterval is after this current interval 
                result.append(interval)
            } else {
                newInterval = [min(start, newIntervalStart), max(end, newIntervalEnd)]
            }
        }

        // When we are at end of array and didn't find another interval to merge, this is the last. 
        result.append(newInterval)

        return result
    }
}

// Failed My Attempt
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        // index 1 on newInterval needs to be < start or end of interval 0 & 1 once it is => than that is the new end. We also need to know the start index of the new interview.
        let flatIntervals = intervals.reduce([], +)
        var newIntervals = [[Int]]()
        print(flatIntervals)
        
        var newIntervalStart = newInterval[0]
        var newIntervalEnd = newInterval[1]

        var currentStart = -1
        var currentEnd = -1
        for interval in intervals {
            let start = interval[0]
            let end = interval[1]
            print(currentStart)
            print(currentEnd)
            
            if newIntervalStart > start && newIntervalStart < end && currentStart == -1  {
                currentStart = start
            } else {
                if newIntervalEnd < start && newIntervalEnd < end {
                    continue 
                } else if newIntervalEnd < start && newInterval > end {
                    currentEnd = newIntervalEnd
                }
            }
        }

        return newIntervals
    }
}
