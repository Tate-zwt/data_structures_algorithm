//
//  SeqSearch.swift
//  查找算法相关
//
//  Created by Tate on 2021/10/8.
//

import Foundation

//有一个数列： {1,8, 10, 89, 1000, 1234} ，判断数列中是否包含此名称【顺序查找】 要求: 如果找到了，就提 示找到，并给出下标值。

/*** 这里我们实现的线性查找是找到一个满足条件的值，就返回
 * @param arr
 * @param value
 * @return 就返回索引i，没有找到就返回 - 1
 */
//时间复杂度 O(n) 线性级 还不错。如果你有 100 个元素，这种算法就要做 100 次工作。数据量翻倍那么运行时间也翻倍。例子：线性查找。
func seqSearch(_ numbers:[Int] ,_ value:Int) -> Int {

    let n = numbers.count
    for i in 0..<n {
        if numbers[i] == value {
            return i
        }
    }
    
    return -1
    
    
}
