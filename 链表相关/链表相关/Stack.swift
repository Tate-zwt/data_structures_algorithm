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
    mutating func push(_ item:Element) {
        items.append(item)
    }
    mutating func pop() ->Element? {
        return items.removeLast()
    }
    func empty() -> Bool {
        return items.isEmpty
    }
    func peek() ->Element? {
        return items.last
    }
    
    func length() ->Int {
        return items.count
    }
    
    
    
    
}
