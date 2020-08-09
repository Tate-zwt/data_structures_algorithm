//
//  ShellSort.swift
//  排序算法相关
//
//  Created by Tate on 2020/8/9.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation

//希尔排序(Shell Sort) 对交换式的希尔排序进行优化->移位法
//func shellSort(_ numbers:[Int]) -> [Int]{
//
//    for (int gap = arr.length / 2; gap > 0; gap /= 2) {
//        // 从第 gap 个元素，逐个对其所在的组进行直接插入排序
//        for (int i = gap; i < arr.length; i++) {
//                int j = i;
//                int temp = arr[j];
//               if (arr[j] < arr[j - gap]) {
//                while (j - gap >= 0 && temp < arr[j - gap]) {
//                    //移动
//                    arr[j] = arr[j-gap];
//                    j -= gap;
//
//                }
//                //当退出 while 后，就给 temp 找到插入的位置
//                arr[j] = temp;
//
//             }
//
//            }
//
//        }
//
//    }

