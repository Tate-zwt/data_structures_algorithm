//
//  InsertionSort.swift
//  排序算法相关
//
//  Created by Tate on 2020/8/9.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
//插入排序
func insertionSort(_ numbers:[Int]) -> [Int]{
    //改成可变数组
    var nums = numbers
    let n = nums.count
    for i in 1..<n {
        //先保存起需要插入的值
        let insertVal = nums[i]
        var insertIndex = i - 1 // 插入的前一个索引，用来比较的值
        
        // 给 insertVal 找到插入的位置
        // 说明
        // 1. insertIndex >= 0 保证在给 insertVal 找插入位置，不越界
        // 2. insertVal < arr[insertIndex] 待插入的数，还没有找到插入位置
        // 3. 就需要将 arr[insertIndex] 后移
        while insertIndex <= 0 && nums[insertIndex + 1] < nums[insertIndex] {
            nums[insertIndex] = nums[insertIndex + 1]
            insertIndex -= 1 //注意这里每次都-1 所以后面需要加1
        }
        //当退出 while 循环时，说明插入的位置找到, insertIndex + 1
        if insertIndex + 1 != i { //如果位置相同的话，就没必要插入了
            //位置找到，插入最小值
            nums[insertIndex + 1] = insertVal
        }
        
    }
    return nums
}

