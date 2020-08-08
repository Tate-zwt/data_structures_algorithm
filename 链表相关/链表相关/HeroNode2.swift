//
//  HeroNode2.swift
//  链表相关
//
//  Created by Tate on 2020/8/8.
//  Copyright © 2020 Tate. All rights reserved.
//

import Foundation

class HeroNode2 {
    var no:Int = 0
    var name:String = ""
    var next:HeroNode2?
    var pre:HeroNode2?

    
    init(_ no:Int,_ name:String) {
        self.no = no;
        self.name = name
    }
    
    func toString() -> String {
        return "HeroNode2 [no=\(no), name=\(name)]"
    }
    
}
