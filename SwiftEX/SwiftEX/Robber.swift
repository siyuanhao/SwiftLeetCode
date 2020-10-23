//
//  Robber.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/10/23.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class SolutionRobber {
    func rob(_ nums: [Int]) -> Int {
         var dp = Array(repeating: 0, count: nums.count)
         if nums.count == 0 {
             return 0
         }
         for i in 0..<nums.count {
             if i==0 {
                 dp[i] = nums[0]
             } else if i==1 {
                 dp[i] = max(nums[0], nums[1])
             } else {
                 dp[i] = max(dp[i-2]+nums[i], dp[i-1])
             }
         }
         return dp[nums.count-1]
     }
}
