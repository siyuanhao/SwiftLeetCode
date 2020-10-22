//
//  numofLIS.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/5/6.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class numOfLIS {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int]()
        var arrayA = [Int]()
        for index in 0..<nums.count {
            dp.insert(1, at: index) //赋初值
            arrayA.insert(1, at: index)
        }
        var maxValue = 0
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    if dp[i] < dp[j]+1 {
                        dp[i] = dp[j]+1
                        arrayA[i] = arrayA[j] //如果+1长于当前LIS 则组合数不变
                    } else if(dp[i] == dp[j]+1){
                        arrayA[i] += arrayA[j] //如果+1等于当前LIS 则说明找到了新组合，
                    }
                }
            }
            maxValue = max(maxValue, dp[i])
        }
        var count = 0
        for i in 0..<nums.count {
            if dp[i] == maxValue {
                count += arrayA[i]
            }
        }
        return count
    }
}
