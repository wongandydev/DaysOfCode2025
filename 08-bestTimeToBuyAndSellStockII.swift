/**
You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.

Find and return the maximum profit you can achieve.

 

Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 7
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
Total profit is 4 + 3 = 7.
Example 2:

Input: prices = [1,2,3,4,5]
Output: 4
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
Total profit is 4.
Example 3:

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
 

Constraints:

1 <= prices.length <= 3 * 104
0 <= prices[i] <= 104

https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/?envType=study-plan-v2&envId=top-interview-150
**/

// Better Solution - Same Time and space complexity but less lines and variables to look at 
class Solution {    
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        
        var profit = 0
        
        for i in 1..<prices.count {
            guard prices[i] > prices[i - 1] else { continue }
            profit += prices[i] - prices[i - 1]
        }
        
        return profit
    }

}

// My Attempt O(n) Time O(1) Space
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0 
        var lastStockBoughtAt = -1
        for (index, num) in prices.enumerated() {
            // if possible bought is larger than num, we should buy at num
            if lastStockBoughtAt > -1 {
                let priceStockBought = prices[lastStockBoughtAt]
                if priceStockBought > num {
                    lastStockBoughtAt = index
                } else {
                    profit += num - priceStockBought
                    lastStockBoughtAt = index
                }
            } else {
                lastStockBoughtAt = index
            }
        }  

        return profit 
    }
}