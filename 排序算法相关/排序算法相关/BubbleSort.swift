//
//  BubbleSort.swift
//  排序算法相关
//
//  Created by Tate on 2020/8/9.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
//常规冒泡排序
func bubbleSort(_ numbers:[Int]) -> [Int]{
    //改成可变数组
    var nums = numbers
//    时间复杂度 O(n^2)
    let n = nums.count
    for i in 0..<(n - 1)  {
        for j in 0..<(n - 1 - i) {
            //如果前面的数比后面的数大就交换
            if nums[j] > nums[j + 1] {
                nums.swapAt(j, j + 1)
//                let temp = result[i]
//                result[i] = result[j]
//                result[j] = temp
            }
        
        }
        print("第\(i + 1)趟排序后的数组")
        print(nums)
        
    }
    return nums

}



//优化后的冒泡排序
func bubbleSortOptimize(_ numbers:[Int]) -> [Int]{
    //改成可变数组
    var nums = numbers
//    时间复杂度 O(n^2)
    let n = nums.count
    
    var flag = false //标识变量，标识是否进行交换过，优化算法
    
    for i in 0..<(n - 1)  {
        for j in 0..<(n - 1 - i) {
            
            //如果前面的数比后面的数大就交换
            if nums[j] > nums[j + 1] {
                flag = true
                nums.swapAt(j, j + 1)
//                let temp = result[i]
//                result[i] = result[j]
//                result[j] = temp
            }
        }
        
        print("第\(i + 1)趟排序后的数组")
        print(nums)
        
        if !flag { //在一趟排序中，一次交换都没有发生过
            break
        }else{
            flag = false // 重置变量，进行下次判断
        }
    }
    return nums

}



