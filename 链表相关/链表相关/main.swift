//
//  main.swift
//  链表相关
//
//  Created by Tate on 2020/8/5.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation

    let hero1 = HeroNode(1, "孙悟空")
    let hero2 = HeroNode(2, "吕布")
    let hero3 = HeroNode(3, "李白")
    let hero4 = HeroNode(4, "伽罗")
    let hero5 = HeroNode(5, "李信")
    
    var singleLinkedList = SingleLinkedList()
   
    singleLinkedList.add(heroNode: hero1)
    singleLinkedList.add(heroNode: hero2)
    singleLinkedList.add(heroNode: hero3)
    singleLinkedList.add(heroNode: hero4)
    singleLinkedList.add(heroNode: hero5)

//
//    var length =  SingleLinkedList.getLength(head: singleLinkedList.getHead())
//
//     print("获取到单链表的节点的个数（如果是带头节点的链表，需求不统计头节点）-- \(length)")
    
//
//   var k = SingleLinkedList.findLastIndexNode(head: singleLinkedList.getHead(), index: 5)
//
//   print("查找单链表中的倒数第k个节点 -- \(String(describing: k!.name))")


    



     singleLinkedList.list()
     print("原来链表的情况~~")

//     SingleLinkedList.reversetList(head: singleLinkedList.getHead())
//     print("单向链表反转")
//     singleLinkedList.list()

    print("单链表逆序打印")
    SingleLinkedList.reversePrint(head: singleLinkedList.getHead())
    
     


//    singleLinkedList.delete(no: 3)
//
//    singleLinkedList.delete(no: 1)

//    singleLinkedList.addByNo(heroNode: hero3)


//    singleLinkedList.update(newHeroNode: HeroNode(5, "李信XXX"))

//     singleLinkedList.list()




    
//     print("测试逆序打印单链表, 没有改变链表的结构~~")
//    reversePrint(singleLinkedList.getHead())



