//
//  SingleLinkedList.swift
//  链表相关
//
//  Created by Tate on 2020/8/5.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation

class SingleLinkedList {
     //head单链表 head不能被修改 声明为let
     private let head:HeroNode = HeroNode(0,"")

     
    func getHead() -> HeroNode {
        return head
    }
    
     //添加新的节点
     func add(heroNode:HeroNode) {
         
         //因为head节点不能动，因此我们需要一个辅助变量temp
         var temp = head
         //遍历链表，找到最后
         while true {
           //找到链表的最后
             if temp.next == nil {
                 break
             }
             
            //如果没有找到最后，将temp后移
             temp = temp.next!
         }
         
         //当退出while循环时，temp就指向了链表的最后
         //将最后节点的next指向新的节点
         temp.next = heroNode
         
     }
     
     //根据编号排名添加新的节点
     func addByNo(heroNode:HeroNode) {
         
         //因为head节点不能动，因此我们需要一个辅助变量temp来帮助找到添加的位置
         //因为单链表，所以我们找的temp是位于添加位置的前一个节点的next来插入
         
         var temp = head
         //标志添加的编号是否存在，默认为false
         var flag = false
         //遍历链表，找到最后
         while true {
             //找到链表的最后
             if temp.next == nil {
                 break
             }
             
             if temp.next!.no > heroNode.no {
                 //位置找到，就在temp的后面插入
                 break
                 
             }else if temp.next?.no == heroNode.no{
                 //链表已经存在需要添加的编号了
                 flag = true
                 break
             }
            //如果没有找到最后，将temp后移
             temp = temp.next!
         }
         
         //判断 flag 的值
         if flag {
             print("准备插入的英雄的编号 \(heroNode.no) 已经存在了, 不能加入\n")
         }else{
             //把需要插入的后面的节点赋值给新的节点的next
             heroNode.next = temp.next
             //把新节点插入到前一个节点的next
             temp.next = heroNode
         }
         
     }

     //修改节点信息，根据no编号来修改，即no编号不能改
     func update(newHeroNode:HeroNode) {
         
        var temp = head.next
         var flag = false
         if temp == nil {
             print("链表为空~")
         }
                    
         while true {
              //已经遍历完链表
             if temp == nil {
                    break
                }
             
            if temp?.no == newHeroNode.no {
                 //找到
                 flag  = true
                 break
             }
             //如果没有找到最后，将temp后移
            temp = temp?.next!
         }
         
         //判断 flag 的值
         if flag {
            temp?.name = newHeroNode.name
         }else{
           //没有找到
             print("没有找到 编号 \(newHeroNode.no) 的节点，不能修改\n")
         }
             
             
     }

     
     func delete(no:Int){
         var temp = head
         var flag = false
          while true {
                 //已经遍历完链表
                if temp.next == nil {
                       break
                   }
                
                if temp.next!.no == no {
                    //找到
                    flag  = true
                    break
                }
                //如果没有找到最后，将temp后移
                temp = temp.next!
            }
         //判断 flag 的值
         if flag {
             temp.next = temp.next?.next
         }else{
           //没有找到
             print("要删除的 \(no) 节点不存在\n")
         }
         
         
     }
     
     
     
     func list() {
         if head.next == nil {
             print("链表为空")
         }else{
            var temp = head.next
             while true {
                  //判断是不是到链表的最后一个节点了
                 if temp == nil {
                        break
                 }
                print(temp!.toString())
                 //如果没有找到最后，将temp后移
                temp = temp?.next
             }
         }
     }
    
    
    // MARK:  求单链表中有效节点的个数
    // 获取到单链表的节点的个数（如果是带头节点的链表，需求不统计头节点）
       static func getLength(head:HeroNode) -> Int {
            if head.next == nil {
                return 0
            }else{
                var length = 0
                
                var cur = head.next
                
                while cur != nil {
                    length += 1
                    cur = cur?.next
                }
                
                return length
                
            }
        }
    
    // MARK:  查找单链表中的倒数第k个节点  index 就是随机数K
    static func findLastIndexNode(head:HeroNode,index:Int) -> (HeroNode)? {
               if head.next == nil {
                       return nil //没有找到
               }else{
                
                var cur = head.next
               
                let size = SingleLinkedList.getLength(head: head)
                
                //做个校验
                if index <= 0 || index > size{
                    return nil
                }
                
                for _ in 0..<size - index {
                    cur = cur?.next
                }
                
                return cur
                   
        }
        
    }
    
    
    // MARK:  实现单链表的反转
    // 思路:
    //1. 先定义一个节点 reverseHead = new HeroNode();
    //2. 从头到尾遍历原来的链表，每遍历一个节点，就将其取出，并放在新的链表reverseHead 的最前端.
    //3. 原来的链表的head.next = reverseHead.next

    static func reversetList(head:HeroNode) {
        
        //如果当前链表为空，或者只有一个节点，无需反正，直接返回
        if head.next == nil || head.next?.next == nil {
            return
        }
        
        //定义一个辅助的变量，帮助我们遍历原来的链表
        var cur  = head.next
        let reversetHead = HeroNode(0, "")
        //指向当前节点cur的下一个节点
        var next:HeroNode?
        //遍历原来的链表，每遍历一个节点，就将其取出，并放在新的链表reversetHead的最前端
        while cur != nil {
            next = cur!.next//先暂时保存当前节点的下一个节点，用来往后遍历
            cur?.next = reversetHead.next //将cur 的下一个节点指向新的链表的最前端
            reversetHead.next = cur //将cur 连接到新的链表上
            cur = next //cur 往后移
        }
        //将head.next 指向 reversetHead.next 实现单链表的反转
        head.next =  reversetHead.next
        
    }
    
    
    
        
    // MARK:  实现单链表的反转
    class ListNode {
        var no:Int = 0
        var name:String = ""
        var next:ListNode?
        init(_ no:Int,_ name:String) {
            self.no = no;
            self.name = name
        }
        func toString() -> String {
            return "ListNode [no=\(no), name=\(name)]"
        }
    }
    //    解题思路
    //
    //    特殊处理
    //    当头节点 == nil，或只有1个节点时，直接返回
    //    正常流程
    //    当前节点p，记录当前遍历节点
    //    新的头节点newHead，记录拆链后新链表的头节点
    //    while循环步骤：
    //    1、临时变量tmp = p.next记录拆链前的下一个节点；
    //    2、拆链，将当前p节点的next指向新的头节点（初始为nil）p.next = newHead；
    //    3、更新新的头节点newHead为当前节点p，newHead = p；
    //    4、更新当前遍历节点p为下一个将要遍历的节点，p = tmp；
    //    最后返回新链表头节点 return newHead
    func reverseList(_ head: ListNode?) -> ListNode? {
        
          //如果当前链表为空，或者只有一个节点，无需反正，直接返回
            if head == nil || head?.next == nil {
                return head
            }
           //定义一个辅助的变量，帮助我们遍历原来的链表
            var p = head
            var newHead: ListNode? = nil
            while p != nil {
                let tmp = p?.next
                p?.next = newHead
                newHead = p
                p = tmp
            }
            return newHead
        }

   
        



  

    
    // MARK:  单链表逆序打印
    //可以利用栈这个数据结构，将各个节点压入到栈中，然后利用栈的先进后出的特点，就实现了逆序打印的效果
    static func reversePrint(head:HeroNode) {
        
        if head.next == nil {
            return
        }
        
        //创建一个栈对象
        var stack = Stack<HeroNode>()
        
        //定义一个辅助的变量，帮助我们遍历原来的链表
        var cur  = head.next
        //将链表所有节点压入栈
        while cur != nil {
            stack.push(cur!)
            cur = cur?.next
        }
        
        for _ in 0..<stack.length() {
            print("单链表逆序打印---> \(String(describing: stack.pop()?.toString()))")
        }
        
    }
}
