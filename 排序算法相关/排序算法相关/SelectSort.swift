//
//  SelectSort.swift
//  排序算法相关
//
//  Created by Tate on 2020/8/9.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
//选择排序
func selectSort(_ numbers:[Int]) -> [Int]{
    //改成可变数组
    var nums = numbers
//    时间复杂度 O(n^2)
    let n = nums.count
    for i in 0..<(n - 1)  {
        var minIndex = i
        var min = nums[i] //最小值用来遍历比较的值
        for j in i+1..<n {
            //说明假定的最小值，并不是最小
            if min > nums[j] {
                min = nums[j]//重置min
                minIndex = j//重置minIndex
            }
        
        }
        // 将最小值，放到nums[i]，即交换
        if minIndex != i {
            nums[minIndex] = nums[i]
            nums[i] = min
        }
        
        
//        print("第\(i + 1)趟排序后的数组")
//        print(nums)
        
    }
    return nums

}
