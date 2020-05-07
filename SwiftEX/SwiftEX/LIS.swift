//
//  LIS.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/5/6.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class LISSolution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int]();
        for index in 0..<nums.count {
            dp.insert(1, at: index) //赋初值
        }
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j]+1);
                }
            }
        }
        var result = 0;
        for i in 0..<dp.count {
            result = max(result, dp[i])
        }
        return result;
    }
}
