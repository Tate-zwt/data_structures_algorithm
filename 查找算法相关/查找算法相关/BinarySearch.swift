//
//  BinarySearch.swift
//  查找算法相关
//
//  Created by Tate on 2021/10/8.
//

import Foundation
//二分查找
/***
 * @param arr
 * 数组
 *
 * @param left
 * 左边的索引
 * @param right
 * 右边的索引
 * @param findVal
 * 要查找的值
 * @return 如果找到就返回下标，如果没有找到，就返回 -1
 * 时间复杂度 O(log n) 对数级 相当好。这种算法每次循环时会把需要处理的数据量减半。如果你有 100 个元素，则只需要七步就可以找到答案。1000 个元素只要十步。100,0000 元素只要二十步。即便数据量很大这种算法也非常快。例子：二分查找。
 */
func binarySearch(_ numbers:[Int] ,_ findValue:Int,leftIndex:Int,rightIndex:Int) -> Int {
    // 当 left > right 时，说明递归整个数组，但是没有找到
    if leftIndex > rightIndex {
        return -1 //没有找到返回 - 1
    }
    
    let mid = (leftIndex + rightIndex) / 2
    let minValue = numbers[mid]
    
    if findValue > minValue{
        return binarySearch(numbers, findValue, leftIndex: mid + 1, rightIndex: rightIndex)
    }else if findValue < minValue {
        return binarySearch(numbers, findValue, leftIndex: leftIndex, rightIndex: mid - 1)
        
    }else{
        return mid
    }
}


/** 课后思考题： {1,8, 10, 89, 1000, 1000，1234} 当一个有序数组中，
 * 有多个相同的数值时，如何将所有的数值都查找到，比如这里的 1000 *
 * 思路分析
 * 1. 在找到 mid 索引值，不要马上返回
 * 2. 向 mid 索引值的左边扫描，将所有满足 1000， 的元素的下标，加入到集合 List
 * 3. 向 mid 索引值的右边扫描，将所有满足 1000， 的元素的下标，加入到集合 List
 * 4. 将 List 返回 */

func binarySearch2(_ numbers:[Int] ,_ findValue:Int,leftIndex:Int,rightIndex:Int) -> [Int] {
    
    
    
    // 当 left > right 时，说明递归整个数组，但是没有找到
    if leftIndex > rightIndex {
        return []
    }
    
    let mid = (leftIndex + rightIndex) / 2
    let minValue = numbers[mid]
    
    if findValue > minValue{
        return binarySearch2(numbers, findValue, leftIndex: mid + 1, rightIndex: rightIndex)
    }else if findValue < minValue {
        return binarySearch2(numbers, findValue, leftIndex: leftIndex, rightIndex: mid - 1)
        
    }else{
        var list = [Int]()
        
        
//        向 mid 索引值的左边扫描，将所有满足 1000， 的元素的下标，加入到集合 List
        var temp = mid - 1
        //先向左遍历查找相同的数
        while true {
            if temp < 0 || numbers[temp] != findValue { //因为是个有序数组相同的值都是连在一起的，所以一当不相等就要退出
                break // 退出
            }
            
            //否则，就 temp 放入到 resIndexlist
            list.append(temp)
            temp -= 1 //temp 左移
        }
        list.append(mid)
        
        //向 mid 索引值的右边扫描，将所有满足 1000， 的元素的下标，加入到集合 ArrayList
        temp = mid + 1
        //先向左遍历查找相同的数
        while true {
            
            if temp > numbers.count - 1 || numbers[temp] != findValue {
                //因为是个有序数组相同的值都是连在一起的，所以一当不相等就要退出
                break // 退出
            }
            
            //否则，就 temp 放入到 resIndexlist
            list.append(temp)
            temp += 1 //temp 左移
        }
        return list
    }
}


//二分查找的非递归实现
/****
 @param arr 待查找的数组, arr 是升序排序
 * @param target 需要查找的数
 * @return 返回对应下标，-1 表示没有找到
 */
func binarySearch3(_ numbers:[Int] ,_ findValue:Int) -> Int  {
    var left = 0
    var right = numbers.count - 1
    
    while left <= right { //说明继续查找
        let mid = (left + right) / 2
        if numbers[mid] == findValue {
            return mid
        }else if findValue > numbers[mid] {
            left = mid + 1 //需要向右边查找
        }else if findValue < numbers[mid] {
            right = mid - 1 //需要向左边查找
        }
    }
    
    return -1
}
