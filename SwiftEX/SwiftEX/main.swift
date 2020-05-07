//
//  main.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/4/28.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation

var solute = numOfLIS();
let nums = [1,2,3,1,2,3,1,2,3];

//solute.singleNumbers(nums);
var y = solute.findNumberOfLIS(nums);

print(y)

