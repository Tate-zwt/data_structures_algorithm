import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var container = Set<Int>() // 创建一个哈希表
       for (index, value) in nums.enumerated() { //遍历数组
           let match = target - value //相减 获取差值
           if container.contains(match) { //判断结果数组是否包含这个值
               let first  = nums.firstIndex(of: match)! //获取这个差值在哈希表的索引
               return [first,index] //添加第一个的索引,添加目前的索引,返回正确的结果
           }
           container.insert(value) //不包含的话就插入到哈希表里
       }
       return []

   }

twoSum([2,8,9,7,1,2], 9)

