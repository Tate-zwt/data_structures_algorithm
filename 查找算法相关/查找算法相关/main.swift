//
//  main.swift
//  查找算法相关
//
//  Created by Tate on 2021/10/8.
//

import Foundation

//线性查找
//有一个数列： [1,8, 10, 89, 1000, 1234] ，判断数列中是否包含此名称【顺序查找】 要求: 如果找到了，就提 示找到，并给出下标值。
let nums = [1,8, 10, 89, 1000, 1234]
//let index =  seqSearch(nums, 1234)
//print("线性查找索引为 ---- \(index)")

//二分查找算法
//let index =  binarySearch(nums, 1000, leftIndex: 0, rightIndex: nums.count - 1)
//print("二分查找索引为 ---- \(index)")

let index =  binarySearch3(nums, 8)
print("非递归二分查找索引为 ---- \(index)")
//插值查找算法
//let index =  insertValueSearch(nums, 1000, leftIndex: 0, rightIndex: nums.count - 1)
//print("插值查找索引为 ---- \(index)")
