//
//  singleNumbers.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/4/28.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation

class Solution {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var sum = 0;
        for x in nums {
            sum ^= x;
        }
        var index = 0
        while sum&1 == 0 {
            index+=1;
            sum >>= 1
        }
        var result = [Int]()
        var a = 0;
        var b = 0;
        for y in nums {
            if (y >> index) & 1 == 0  {
                a ^= y;
            } else {
                b ^= y;
            }
        }
        result.insert(a, at: 0)
        result.insert(b, at: 1)
        return result;
    }
}
