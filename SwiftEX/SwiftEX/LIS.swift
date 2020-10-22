//
//  LIS.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/5/6.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class LisSolution {
    //最长递增子序列
    func findLengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int]()
        for i in  0..<nums.count{
            dp.insert(1, at: i)
        }
//        var cookies = [[Int]]()
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        var result = 0
        for i in  0..<dp.count{
            result = max(result, dp[i])
        }
        return result
    }
    
    //最长连续递增子序列
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
            if nums.count == 0 {
                return 0
            }
            var result = 1
            var maxNum = result
            for i in 0..<nums.count-1 {
                if nums[i+1] > nums[i] {
                    result += 1
                } else {
                    maxNum = max(result, maxNum)
                    result = 1
                }
            }
            result = max(result, maxNum)
            return result
    }
}
