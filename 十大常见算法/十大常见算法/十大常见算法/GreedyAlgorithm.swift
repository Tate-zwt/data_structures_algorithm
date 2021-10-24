//
//  GreedyAlgorithm.swift
//  十大常见算法
//
//  Created by Tate on 2021/10/24.
//

import Foundation
//贪心算法，查找最优广播台
func testGreedyAlgorithm() -> [String] {
    //创建广播电台,放入到 Map
    var broadcasts = [String:Set<String>]()
    
    //将各个电台放入到 broadcasts
    var set1 = Set<String>()
    set1.insert("北京")
    set1.insert("上海")
    set1.insert("天津")
    
    var set2 = Set<String>()
    set2.insert("广州")
    set2.insert("北京")
    set2.insert("深圳")
    
    var set3 = Set<String>()
    set3.insert("成都")
    set3.insert("上海")
    set3.insert("杭州")
    
    var set4 = Set<String>()
    set4.insert("上海")
    set4.insert("天津")

    
    var set5 = Set<String>()
    set5.insert("杭州")
    set5.insert("大连")
    
    //加入到 map
    broadcasts["K1"] = set1
    broadcasts["K2"] = set2
    broadcasts["K3"] = set3
    broadcasts["K4"] = set4
    broadcasts["K5"] = set5
    
    //allAreas 存放所有的地区
    var allAreas = Set<String>()
    allAreas.insert("北京")
    allAreas.insert("上海")
    allAreas.insert("天津")
    allAreas.insert("广州")
    allAreas.insert("深圳")
    allAreas.insert("成都")
    allAreas.insert("杭州")
    allAreas.insert("大连")
    
    
    //创建 ArrayList, 存放选择的电台集合
    var selects = [String]()
    //定义一个临时的集合， 在遍历的过程中，存放遍历过程中的电台覆盖的地区和当前还没有覆盖的地区的交集
    
    var tempSet = Set<String>()
    //定义给 maxKey ， 保存在一次遍历过程中，能够覆盖最大未覆盖的地区对应的电台的 key
    //如果 maxKey 不为 null , 则会加入到 selects
    
    var maxKey:String? = nil
    
    while allAreas.count != 0 {
        // 如果 allAreas 不为 0, 则表示还没有覆盖到所有的地区
        //每进行一次 while,需要
        maxKey = nil
        //遍历 broadcasts, 取出对应 key 注意这里的key是无序的，所以结果元素一样，但是顺序不一样
        for key in broadcasts.keys {
            //每进行一次 for 需要清空
            tempSet.removeAll()
            //当前这个 key 能够覆盖的地区
            let areas = broadcasts[key]
            tempSet = areas ?? Set<String>()
            //求出 tempSet 和 allAreas 集合的交集, 交集会赋给 tempSet
            tempSet = tempSet.intersection(allAreas)
            //如果当前这个集合包含的未覆盖地区的数量，比 maxKey 指向的集合地区还多
            //就需要重置 maxKey
            //maxKey == nil || tempSet.count > broadcasts[maxKey ?? ""]?.count ?? 0 体现出贪心算法的特点,每次都选择最优的
            if tempSet.count > 0 && (maxKey == nil || tempSet.count > broadcasts[maxKey ?? ""]?.count ?? 0){
                maxKey = key
            }
        }
        
        //maxKey != null, 就应该将 maxKey 加入 selects
        if maxKey != nil {
            selects.append(maxKey ?? "")
            //将 maxKey 指向的广播电台覆盖的地区，从 allAreas 去掉
            
            for k in broadcasts[maxKey ?? ""] ?? Set<String>() {
                allAreas.remove(k)
            }
        }
    }
    
    
    
    return selects
}
