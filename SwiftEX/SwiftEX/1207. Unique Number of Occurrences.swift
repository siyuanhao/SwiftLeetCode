//
//  1207. Unique Number of Occurrences.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/10/28.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation
class Solution1207 {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var dictionary = [Int: Int]()
        for i in 0..<arr.count {
            let key = arr[i]
            let count = (dictionary[key] ?? 0) + 1
            dictionary.updateValue(count, forKey: key)
        }
        
        var nums = [Int]()
        for item in dictionary.values {
            if  nums.contains(item) {
                return false
            } else {
                nums.append(item)
            }
        }
        return true
    }
}
