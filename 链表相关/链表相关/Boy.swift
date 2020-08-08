//
//  Boy.swift
//  链表相关
//
//  Created by Tate on 2020/8/8.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation
class Boy {
    var no:Int = 0
    var next:Boy?

    
    init(_ no:Int) {
        self.no = no;
    }
    
    func toString() -> String {
        return "HeroNode [no=\(no)]"
    }
    
}

extension Boy: Equatable{
//    根据编号来判断两个对象是否相等
    static func == (lhs: Boy, rhs: Boy) -> Bool {
        return lhs.no == rhs.no
    }
    
}


