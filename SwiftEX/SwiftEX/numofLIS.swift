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
                        arrayA[i] = arrayA[j]
                    } else if(dp[i] == dp[j]+1){
                        arrayA[i] += arrayA[j]
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
