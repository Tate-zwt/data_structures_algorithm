//
//  Queue.swift
//  图相关
//
//  Created by Tate on 2021/10/10.
//

import Foundation
/*队列,特点:FIFO（ first-in first-out order：先进先出）*/
public struct Queue<T> {
    fileprivate var list = Array<T>()
    var isEmpty:Bool {
        return list.count == 0
    }

    //入列
    public mutating func addQueue(_ element:T) {
        list.append(element)
    }

    //出列
    public mutating func popQueue() ->T?{
        if list.isEmpty == false {
            let first = list.first
            list.remove(at: 0)
            return first
        } else {
            return nil
        }
    }

    //peek 查看队列的第一个元素
    public func peek() -> T? {
        return list.first
    }
}
