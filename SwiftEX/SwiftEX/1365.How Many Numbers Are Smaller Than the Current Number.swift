//
//  1365.How Many Numbers Are Smaller Than the Current Number.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/10/26.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class Solution1365 {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        for i in 0..<nums.count {
            var index = 0
            for j in 0..<nums.count {
                if nums[j] < nums[i] {
                    index += 1
                }
            }
            result.insert(index, at: i)
        }
        return result
    }
}
