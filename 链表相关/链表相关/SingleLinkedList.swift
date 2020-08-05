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
    
}
