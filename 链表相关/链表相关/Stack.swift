//
//  Stack.swift
//  链表相关
//
//  Created by Tate on 2020/8/6.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
//swift 栈的实现
struct Stack<Element> {
    var items = [Element]()
    //入栈
    mutating func push(_ item:Element) {
        if isFull() {
            print("栈满")
        }
        items.append(item)
    }
    //出栈
    mutating func pop() ->Element? {
        if isEmpty() {
            print("栈空")
            return nil
        }
        return items.removeLast()
    }
    //栈空
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    //栈满
    func isFull() -> Bool {
        return length() == items.count
    }
    
    func peek() ->Element? {
        return items.last
    }
    
    func length() ->Int {
        return items.count
    }
    
    
    
    
}
