//
//  QuickSort.swift
//  排序算法相关
//
//  Created by Tate on 2020/8/9.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
//快速排序（Quicksort）是对冒泡排序的一种改进。基本思想是：通过一趟排序将要排序的数据分割成独立的两 部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排 序，整个排序过程可以递归进行，以此达到整个数据变成有序序列
func quickSort(_ arr: inout [Int],left:Int,right:Int) {
        var l = left //左下标
        var r = right //右下标
        //pivot 中轴值
        let pivot = arr[(left + right) / 2]
        var temp = 0 //临时变量，作为交换时使用
        //while 循环的目的是让比 pivot 值小放到左边
        //比 pivot 值大放到右边
        while l < r {
                    //在 pivot 的左边一直找,找到大于等于 pivot 值,才退出
                    while arr[l] < pivot {
                        l += 1
            
                    }
                    //在 pivot 的右边一直找,找到小于等于 pivot 值,才退出
                    while(arr[r] > pivot) {
                        r -= 1
                
                    }
                    //如果 l >= r 说明 pivot 的左右两的值，已经按照左边全部是
                    //小于等于 pivot 值，右边全部是大于等于 pivot 值
                    if( l >= r) {
                        break
                    }
                    //交换
                    temp = arr[l]
                    arr[l] = arr[r]
                    arr[r] = temp
                    //如果交换完后，发现这个 arr[l] == pivot 值 相等 r--， 前移
                    if arr[l] == pivot {
                        r -= 1
                        
                    }
                    //如果交换完后，发现这个 arr[r] == pivot 值 相等 l++， 后移
                    if arr[r] == pivot  {
                        l += 1
                        
                    }
                }
                // 如果 l == r, 必须 l++, r--, 否则为出现栈溢出
                if l == r {
                    l += 1
                    r -= 1
                    
                }

            //向左递归
            if left < r {
               quickSort(&arr, left:left, right:r)
                
            }
            //向右递归
            if right > l {
              quickSort(&arr, left:l, right:right)
                
            }
    
   
    
}

