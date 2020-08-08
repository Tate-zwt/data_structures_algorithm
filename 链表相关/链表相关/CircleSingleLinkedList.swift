//
//  CircleSingleLinkedList.swift
//  链表相关
//
//  Created by Tate on 2020/8/8.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
//创建一个环形的单向链表
class CircleSingleLinkedList {
    // 创建一个 first 节点,当前没有编号
    var first:Boy?
    
    // 添加小孩节点，构建成一个环形的链表
    func addBoy(nums:Int) {
        // nums 做一个数据校验
        if nums < 1 {
            print("nums的值不正确");
            return
        }else{
            // 辅助指针，帮助构建环形链表
            var curBoy:Boy?
            // 使用 for 来创建我们的环形链表
            for i in 1...nums {
                // 根据编号，创建小孩节点
                let boy = Boy(i)
                // 如果是第一个小孩
                if i == 1 {
                    first = boy
                    first?.next = first// 构成环
                    curBoy = first // 让 curBoy 指向第一个小孩
                }else{
                    curBoy?.next = boy
                    boy.next = first
                    curBoy = boy
                }
                
            }
        }
    }
    
    // 遍历当前的环形链表
    func showBoy() {
        // 判断链表是否为空
        if first == nil {
           print("没有任何小孩~~")
        } else {
            // 因为 first 不能动，因此我们仍然使用一个辅助指针完成遍历
            var curBoy = first

            while(true) {
                print("小孩的编号 \(String(describing: curBoy?.no)) \n")
                // 说明已经遍历完毕
                if (curBoy?.next == first) {
                    break
                }

                curBoy = curBoy?.next // curBoy 后移
            }
        }
    }
    // 根据用户的输入，计算出小孩出圈的顺序
    /** @param startNo * 表示从第几个小孩开始数数
     * @param countNum * 表示数几下
     * @param nums * 表示最初有多少小孩在圈中 */
    func countBoy(startNo:Int,countNum:Int,nums:Int) {
        // 先对数据进行校验
        if first == nil || startNo < 1 || startNo > nums {
           print("参数输入有误， 请重新输入")
           return
        }
            
            // 创建要给辅助指针,帮助完成小孩出圈
            var helper = first
        
           // 需求创建一个辅助指针(变量) helper , 事先应该指向环形链表的最后这个节点
            while (true) {
                if  helper?.next == first {
                // 说明 helper 指向最后小孩节点
                break;
            }
            helper = helper?.next
                
        }
        //小孩报数前，先让 first 和 helper 移动 startNo - 1 次
            for _ in 0..<startNo - 1 {
               first = first?.next
               helper = helper?.next
            }
            
        //当小孩报数时，让 first 和 helper 指针同时 的移动 countNum - 1 次, 然后出圈 //这里是一个循环操作，知道圈中只有一个节点
            while true {
                
                if(helper == first) { //说明圈中只有一个节点
                    break
                }
                //让 first 和 helper 指针同时 的移动 countNum - 1
                for _ in 0..<countNum - 1 {
                    first = first?.next
                    helper = helper?.next
                }
                //这时 first 指向的节点，就是要出圈的小孩节点
                print("小孩%d出圈\(String(describing: first?.no))")
                first = first?.next
                helper?.next = first
            }
            
            print("最后留在圈中的小孩编号%d \(String(describing: first?.no))")
       
    
    }
}
