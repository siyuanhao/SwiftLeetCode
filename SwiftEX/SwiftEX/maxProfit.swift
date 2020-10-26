//
//  maxProfit.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/4/29.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class Solution3 {
    func maxProfit(_ prices: [Int]) -> Int { //只能交易一次
        let stateDP = [Int](repeating: 0, count: 2)
        var dp = [[Int]](repeating: stateDP, count: prices.count)
        if prices.count == 0 {
            return 0
        }
        for i in 0..<prices.count {
            if i == 0 {
                dp[0][0] = 0
                dp[0][1] = -prices[i]
            } else {
                dp[i][0] = max(dp[i-1][1]+prices[i], dp[i-1][0])
                dp[i][1] = max(dp[i-1][1],dp[i-1][0]-prices[i])//交易无数次
            }
        }
        let n = prices.count
        return dp[n-1][0]
    }
    
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int { //可以交易k次
        let buyState = [Int](repeating: 0, count: 2)
        let times = [[Int]](repeating: buyState, count: k+1)
        var dp = [[[Int]]](repeating: times, count: prices.count)
        
        let value = prices.count / 2
        if k == 0 {
            return 0
        } else if value < k {
            return maxProfit(prices)
        }

        for i in 0..<prices.count {
            for j in (1...k).reversed() {
                if i == 0 {
                    dp[i][j][0] = 0
                    dp[i][j][1] = -prices[i]
                } else {
                    dp[i][j][0] = max(dp[i-1][j][0], dp[i-1][j][1]+prices[i])
                    dp[i][j][1] = max(dp[i-1][j][1], dp[i-1][j-1][0]-prices[i])
                }
            }
        }
        return dp[prices.count-1][k][0]

    }
}

