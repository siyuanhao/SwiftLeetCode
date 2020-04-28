//
//  maxProfit.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/4/29.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class Solution3 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        var minValue = prices[0]
        var dp = [Int]()
        dp.insert(prices[0], at: 0)
        var maxValue = 0
        for i in 1..<prices.count {
          maxValue = max(maxValue, prices[i] - minValue)
          minValue = min(prices[i], minValue)
        }
        return maxValue
    }
}

