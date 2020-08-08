//
//  DoubleLinkedList.swift
//  链表相关
//
//  Created by Tate on 2020/8/8.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation

class DoubleLinkedList {
 //head单链表 head不能被修改 声明为let
 private let head:HeroNode2 = HeroNode2(0,"")

 
func getHead() -> HeroNode2 {
    return head
}

 //添加新的节点
 func add(heroNode2:HeroNode2) {
     
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
     temp.next = heroNode2
     heroNode2.pre = temp
     
 }
 
 //根据编号排名添加新的节点
 func addByNo(heroNode2:HeroNode2) {
     
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
         
         if temp.next!.no > heroNode2.no {
             //位置找到，就在temp的后面插入
             break
             
         }else if temp.next?.no == heroNode2.no{
             //链表已经存在需要添加的编号了
             flag = true
             break
         }
        //如果没有找到最后，将temp后移
         temp = temp.next!
     }
     
     //判断 flag 的值
     if flag {
         print("准备插入的英雄的编号 \(heroNode2.no) 已经存在了, 不能加入\n")
     }else{
         //把temp的下一个的个个节点链接新节点
         temp.next?.pre = heroNode2
         //把需要插入的后面的节点赋值给新的节点的next
         heroNode2.next = temp.next
         //把新节点插入到前一个节点的next
         temp.next = heroNode2
         //新节点的上一个链接到temp
         heroNode2.pre = temp
         
     }
     
 }

 //修改节点信息，根据no编号来修改，即no编号不能改
 func update(newHeroNode2:HeroNode2) {
     
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
         
        if temp?.no == newHeroNode2.no {
             //找到
             flag  = true
             break
         }
//         已经是最后一个元素了 不再查找
        if temp?.next == nil {
             break
        }
        //如果没有找到最后，将temp后移
        temp = temp?.next!
     }
     
     //判断 flag 的值
     if flag {
        temp?.name = newHeroNode2.name
     }else{
       //没有找到
         print("没有找到 编号 \(newHeroNode2.no) 的节点，不能修改\n")
     }
         
         
 }

 
 func delete(no:Int){
    var temp = head.next
     var flag = false
      while true {
             //已经遍历完链表
            if temp == nil {
                   break
               }
            
            if temp!.no == no {
                //找到
                flag  = true
                break
            }
            //如果没有找到最后，将temp后移
            temp = temp?.next!
        }
     //判断 flag 的值
     if flag {
        temp?.pre?.next = temp?.next
        if temp?.next != nil {
            temp?.next?.pre = temp?.pre
        }
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
