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


     singleLinkedList.list()
     print("原来链表的情况~~")

//    singleLinkedList.delete(no: 3)
//
//    singleLinkedList.delete(no: 1)

//    singleLinkedList.addByNo(heroNode: hero3)


//    singleLinkedList.update(newHeroNode: HeroNode(5, "李信XXX"))

//     singleLinkedList.list()




    
//     print("测试逆序打印单链表, 没有改变链表的结构~~")
//    reversePrint(singleLinkedList.getHead())

