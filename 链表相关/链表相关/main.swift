//
//  main.swift
//  链表相关
//
//  Created by Tate on 2020/8/5.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
// MARK:  测试单向链表
//    let hero1 = HeroNode(1, "孙悟空")
//    let hero2 = HeroNode(2, "吕布")
//    let hero3 = HeroNode(3, "李白")
//    let hero4 = HeroNode(4, "伽罗")
//    let hero5 = HeroNode(5, "李信")
//
//    var singleLinkedList = SingleLinkedList()
//
//    singleLinkedList.add(heroNode: hero1)
//    singleLinkedList.add(heroNode: hero2)
//    singleLinkedList.add(heroNode: hero3)
//    singleLinkedList.add(heroNode: hero4)
//    singleLinkedList.add(heroNode: hero5)

//
//    var length =  SingleLinkedList.getLength(head: singleLinkedList.getHead())
//
//     print("获取到单链表的节点的个数（如果是带头节点的链表，需求不统计头节点）-- \(length)")
    
//
//   var k = SingleLinkedList.findLastIndexNode(head: singleLinkedList.getHead(), index: 5)

//   print("查找单链表中的倒数第k个节点 -- \(String(describing: k?.name))")


    


//
//     singleLinkedList.list()
//     print("原来链表的情况~~")

//     SingleLinkedList.reversetList(head: singleLinkedList.getHead())
//     print("单向链表反转")
//     singleLinkedList.list()
//
//    print("单链表逆序打印")
//    SingleLinkedList.reversePrint(head: singleLinkedList.getHead())
//
     


//    singleLinkedList.delete(no: 3)
//
//    singleLinkedList.delete(no: 1)

//    singleLinkedList.addByNo(heroNode: hero3)


//    singleLinkedList.update(newHeroNode: HeroNode(5, "李信XXX"))

//     singleLinkedList.list()




    
//     print("测试逆序打印单链表, 没有改变链表的结构~~")
//    reversePrint(singleLinkedList.getHead())




// MARK:  测试双向链表

//print("双向链表的测试")
//let hero1 = HeroNode2(1, "孙悟空")
//let hero2 = HeroNode2(2, "吕布")
//let hero3 = HeroNode2(3, "李白")
//let hero4 = HeroNode2(4, "伽罗")
//let hero5 = HeroNode2(100, "李信")
//let doubleLinkedList = DoubleLinkedList()
//doubleLinkedList.add(heroNode2: hero1)
//doubleLinkedList.add(heroNode2: hero2)
//doubleLinkedList.add(heroNode2: hero3)
//doubleLinkedList.add(heroNode2: hero4)
//doubleLinkedList.add(heroNode2: hero5)
//doubleLinkedList.list();
////let newHeroNode = HeroNode2(100, "光暗信")
////doubleLinkedList.update(newHeroNode2: newHeroNode)
////print("修改后的链表情况")
////doubleLinkedList.list()
//
//print("根据编号来插入")
//let hero6 = HeroNode2(60, "后裔")
//doubleLinkedList.addByNo(heroNode2: hero6)
//doubleLinkedList.list()
//
//doubleLinkedList.delete(no:3)
//print("删除后的链表情况~~")
//doubleLinkedList.list()


// MARK:  Josephu(约瑟夫、约瑟夫环)  问题
/**
 Josephu  问题为：设编号为1，2，… n的n个人围坐一圈，约定编号为k（1<=startNo<=n）的人从1开始报数，数到countNum 的那个人出列，它的下一位又从1开始报数，数到m的那个人又出列，依次类推，直到所有人出列为止，由此产生一个出队编号的序列。

 提示：用一个不带头结点的循环链表来处理Josephu 问题：先构成一个有n个结点的单循环链表，然后由k结点起从1开始计数，计到m时，对应结点从链表中删除，然后再从被删除结点的下一个结点又从1开始计数，直到最后一个结点从链表中删除算法结束。
 */

var circleSingleLinkedList =  CircleSingleLinkedList();
circleSingleLinkedList.addBoy(nums: 5)
//circleSingleLinkedList.showBoy()
circleSingleLinkedList.countBoy(startNo: 1, countNum: 2, nums: 5)

