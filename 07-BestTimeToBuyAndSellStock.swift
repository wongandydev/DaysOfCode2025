/**
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
Example 2:

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
 
https://leetcode.com/problems/best-time-to-buy-and-sell-stock/editorial/?envType=study-plan-v2&envId=top-interview-150
**/

// One Pass Approach O(n) Time O(1) Space
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // Iterate through the array of prices.
        // Since we are iterating, I don't need to worry about moving it left and right based on best buy AND sell, since what we saw in the past would have been the best buy day if there was min and we don't care for max since it's bad to buy high.
        // Save the best min price (best buy day)
        // Since it is the new lowest it means it woun't be a good day to sell.
        // otherwise we would save the max profit of currentProfit bs our stored max profit
        // return the difference 
        var minBuyPrice = Int.max
        var bestDifference = 0

        for price in prices {
            if price < minBuyPrice {
                minBuyPrice = price   
            } else {
                bestDifference = max(bestDifference, price - minBuyPrice)
            }
        }

        return bestDifference 
    }
}

// Failed approach 
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // we can go with a DP approach.
        // pointer on the left is buy, pointer on right is sell. 
        // profilt = right - left (what you sold - what you bought it for )
        // if profit is < 0, move left one over 
        // otherwise move right 
        // save profit when it is > than last profit. 
        /**
        Test this out 
        [7,1,5,3,6,4]
        7 ,4  = -3 
        1 , 4 = 3
        1 , 6 = 5 * 
        1, 3 = 3
        1, 5 = 4

        [7,6,4,3,1]
        7 , 1 = -6 
        6, 1 = -5 
        4, 1 = -3 
        3, 1 = -2 
        0 * 
        **/ 
        var left = 0
        var right = prices.count - 1 
        var minBuy = prices[left]
        var maxSell = prices[right]

        
        while right > left {
            minBuy = min(minBuy, prices[left])
            maxSell = max(maxSell, prices[right])
            right -= 1 
            left += 1
        }
        print(maxSell)
        print(minBuy)
        let profit = maxSell - minBuy
        return profit > 0 ? profit : 0
    }
}