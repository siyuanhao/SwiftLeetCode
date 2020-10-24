//
//  Robber.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/10/23.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class HouseRobber {
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
    
    func rob2(_ nums: [Int]) -> Int { //空间复杂度为O(1)
        if nums.count == 0 {
            return 0
        }
        var dp_i1 = 0
        var dp_i2 = 0
        for i in 0..<nums.count {
            let value = max(dp_i1+nums[i],dp_i2)
            dp_i1 = dp_i2
            dp_i2 = value
         }
         return dp_i2
     }
    
    func rob3(_ nums: [Int]) -> Int { //房间首尾相连
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return max(nums[0],nums[1])
        }
        
        var dp_i1 = 0
        var dp_i2 = 0
        var min1 = 0
        var min2 = 0
        for i in 0..<nums.count - 1 { //第0个和第n-2个
            min1 = max(dp_i1+nums[i],dp_i2)
            dp_i1 = dp_i2
            dp_i2 = min1
        }
        min1 = dp_i2
        
        
        dp_i1 = 0
        dp_i2 = 0
        for i in 1..<nums.count {//第1个和第n-1个
            min2 = max(dp_i1+nums[i],dp_i2)
            dp_i1 = dp_i2
            dp_i2 = min2
         }
         min2 = dp_i2
         return max(min1,min2)
     }
}
