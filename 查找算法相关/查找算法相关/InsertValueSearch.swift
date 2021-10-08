//
//  InsertValueSearch.swift
//  查找算法相关
//
//  Created by Tate on 2021/10/8.
//

import Foundation
//插值查找原理介绍: 插值查找算法类似于二分查找，不同的是插值查找每次从自适应 mid 处开始查找。
//插值查找算法

//请对一个有序数组进行插值查找 {1,8, 10, 89, 1000, 1234} ，输入一个数看看该数组是否存在此数，并且求出下 标，如果没有就提示"没有这个数"。

//编写插值查找算法
//说明：插值查找算法，也要求数组是有序的
/**** @param arr 数组
 * @param left 左边索引
 * @param right 右边索引
 * @param findVal 查找值
 * @return 如果找到，就返回对应的下标，如果没有找到，返回-1
 */
func insertValueSearch(_ arr:[Int] ,_ findVal:Int,leftIndex:Int,rightIndex:Int) -> Int {
  
    //注意：findVal < arr[0] 和 findVal > arr[arr.length - 1] 必须需要 //否则我们得到的 mid 可能越界
    if leftIndex > rightIndex  || findVal < arr[0] || findVal > arr[arr.count - 1] {
        return -1 //没有找到返回 - 1
    }
    
    // 求出 mid, 自适应 插值查找算法公式 与二分查找的区别
    let mid = leftIndex + (rightIndex - leftIndex) * (findVal - arr[leftIndex]) / (arr[rightIndex] - arr[leftIndex])
    let midVal = arr[mid]
    
    if findVal > midVal { // 说明应该向右边递归
        return insertValueSearch(arr, findVal, leftIndex: mid + 1, rightIndex: rightIndex)
        
    }else if findVal < midVal   { // 说明向左递归查找
        return insertValueSearch(arr, findVal, leftIndex: leftIndex, rightIndex: mid - 1)
        
    }else{
        return mid
    }
}
