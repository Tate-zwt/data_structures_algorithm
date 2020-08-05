//
//  HeroNode.swift
//  链表相关
//
//  Created by Tate on 2020/8/5.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation

class HeroNode {
    var no:Int = 0
    var name:String = ""
    var next:HeroNode?

    
    init(_ no:Int,_ name:String) {
        self.no = no;
        self.name = name
    }
    
    func toString() -> String {
        return "HeroNode [no=\(no), name=\(name)]"
    }
    
}
