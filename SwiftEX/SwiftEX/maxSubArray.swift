//
//  maxSubArray.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/4/29.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class Solution2 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxValue = nums[0];
        var result = [Int]();
        result.insert(nums[0], at: 0);
        if nums.count == 1 {
            return nums[0];
        }
        for i in 1..<nums.count {
            result.insert(max(nums[i],result[i-1]+nums[i]), at: i)
            maxValue = max(maxValue, result[i])
        }
        print(result)
        return maxValue;
    }
}

//f(n) = max (f(n-1)+x(n),f(n-1))
