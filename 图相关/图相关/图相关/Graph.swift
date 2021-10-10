//
//  Graph.swift
//  图相关
//
//  Created by Tate on 2021/10/10.
//  深度优先算法就是栈 就是 优先从上一个结点查找
//  广度优先算法就是队列  就是 优先从队列第一个头结点查找

import Foundation

/**
 图遍历介绍
 所谓图的遍历，即是对结点的访问。一个图有那么多个结点，如何遍历这些结点，需要特定策略，一般有两种 访问策略:
 (1)深度优先遍历
 (2)广度优先遍历
 */

class Graph {
    /** 存储顶点集合 */
    var vertexList = [String]()
    /** 存储图对应的邻结矩阵 */
    var edges = [[Int]]()
    /** 表示边的数目 */
    var numOfEdges = 0
    /** 定义给数组[Bool]，记录某个结点是否访问 */
    var isVisited = [Bool]()
    
    init(n:Int) {
        edges = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    }
    
    /** 得到第一个邻结点的下标W
     如果存在就返回对应的下标，否则返回-1
     */
    func getFirstNeighbor(index:Int) -> Int {
        for j in 0..<vertexList.count {
            if edges[index][j] > 0 {
                return j
            }
        }
        return -1
    }
    
    /** 根据前一个邻结点的下标来获取下一个邻结点
     如果存在就返回对应的下标，否则返回-1
     v1 B结点
     v2:v2+1 下一个结点开始找D 所以是 B 找 D 结点
     
     A B C D E
     A 0 1 1 0 0
     B 1 0 1 0 0
     C 1 1 0 0 0
     D 0 1 0 0 0
     E 0 1 0 0 0
     */
    func getNextNeighbor(v1:Int,v2:Int) -> Int {
        for j in v2 + 1..<vertexList.count {
            if edges[v1][j] > 0 {
                return j
            }
        }
        return -1
    }
    
    /** 图的深度优先搜索(Depth First Search) 简称DFS
     深度优先遍历基本思想：
     1、深度优先遍历，从初始访问结点出发，初始访问结点可能有多个邻接结点，深度优先遍历的策略就是首先访问 第一个邻接结点，然后再以这个被访问的邻接结点作为初始结点，访问它的第一个邻接结点， 可以这样理解： 每次都在访问完当前结点后首先访问当前结点的第一个邻接结点。
     2、我们可以看到，这样的访问策略是优先往纵向挖掘深入，而不是对一个结点的所有邻接结点进行横向访问。
     3、显然，深度优先搜索是一个递归的过程
     
     深度优先遍历算法步骤：
     1、访问初始结点 v，并标记结点 v 为已访问。
     2、查找结点 v 的第一个邻接结点 w。
     3、若 w 存在，则继续执行 4，如果 w 不存在，则回到第 1 步，将从 v 的下一个结点继续。
     4、若 w 未被访问，对 w 进行深度优先遍历递归（即把 w 当做另一个 v，然后进行步骤 123）。
     5、查找结点 v 的 w 邻接结点的下一个邻接结点，转到步骤 3。
     */
    //对 dfs 进行一个重载, 遍历我们所有的结点，并进行 dfs
    func dfs(){
        isVisited = [Bool](repeating: false, count: vertexList.count)
        //遍历所有的结点，进行 dfs[回溯]
        for i in 0..<getNumOfVertex() {
            if !isVisited[i] {
                dfs(isVisited: &isVisited, i: i)
            }
        }
    }
    ///对一个结点进行深度优选遍历的代码
    //i 第一次就是 0 深度优先搜索算法核心代码
    private func dfs(isVisited:inout [Bool],i:Int) {
        //先把 isVisited let 改为 var
//        var isV = isVisited
        //inout 默认就是 var了
        
        //首先我们访问该结点,输出
//        print(getValueByIndex(i: i) + "->")
        //打印不换行
        print("\(getValueByIndex(i: i))->", terminator: "")
        
        //将结点设置为已经访问
//        //这里加入self代表访问全局变量所以是var，如果不加就是访问局部变量 let
//        self.isVisited[i] = true
        isVisited[i] = true
    
        //查找结点 i 的第一个邻接结点 w
        var w = getFirstNeighbor(index: i)
        while w != -1 {
            //说明有访问过
            if !isVisited[w]  {
                dfs(isVisited: &isVisited, i: w)
                
            }
            //如果 w 结点已经被访问过
            w = getNextNeighbor(v1: i, v2: w)
            
        }
        
    }
    
    /**
     图的广度优先搜索(Broad First Search) 简称BFS
     广度优先遍历基本思想:
     类似于一个分层搜索的过程，广度优先遍历需要使用一个队列以保持访问过的结点的顺序，以便按这个顺序来 访问这些结点的邻接结点
     广度优先遍历算法步骤:
     1、访问初始结点 v 并标记结点 v 为已访问。
     2、结点 v 入队列
     3、当队列非空时，继续执行，否则算法结束。
     4、出队列，取得队头结点 u。
     5、查找结点 u 的第一个邻接结点 w。
     6、若结点 u 的邻接结点 w 不存在，则转到步骤 3；否则循环执行以下三个步骤：
     1、若结点 w 尚未被访问，则访问结点 w 并标记为已访问。
     2、结点 w 入队列
     3、查找结点 u 的继 w 邻接结点后的下一个邻接结点 w，转到步骤 6。
     */
    
    //遍历所有的结点，都进行广度优先搜索
    func bfs() {
        isVisited = [Bool](repeating: false, count: vertexList.count)
        //遍历所有的结点，进行 bfs[回溯]
        for i in 0..<getNumOfVertex() {
            if !isVisited[i] {
                bfs(isVisited: &isVisited, i: i)
            }
        }
    }
    
    
    ///对一个结点进行广度优选遍历的代码
    private func bfs(isVisited:inout [Bool],i:Int) {
        
//        //先把 isVisited let 改为 var
//        var isV = isVisited
        //inout 默认就是 var了
        
        var u = 0// 表示队列的头结点对应下标
        var w = 0// 邻接结点 w
        //队列，记录结点访问的顺序
        var queue = Queue<Int>()
        //访问结点，输出结点信息
//        print(getValueByIndex(i: i) + "=>")
        //打印不换行
        print("\(getValueByIndex(i: i))=>", terminator: "")
        //标记为已访问
        isVisited[i] = true
        //将结点加入队列
        queue.addQueue(i)
        
        while !queue.isEmpty {
            //取出队列的头结点下标
            u = queue.popQueue() ?? 0
            //得到第一个邻接结点的下标 w
            w = getFirstNeighbor(index: u)
            
            while w != -1 {
                //找到
                //是否访问过
                if !isVisited[w]{
//                    print(getValueByIndex(i: w) + "=>")
                    //打印不换行
                    print("\(getValueByIndex(i: w))=>", terminator: "")
                    //标记已经访问
//                    //这里加入self代表访问全局变量所以是var，如果不加就是访问局部变量 let
//                    self.isVisited[w] = true
                    isVisited[w] = true
                    //入列
                    queue.addQueue(w)
                }
                
                //以 u 为前驱点，找 w 后面的下一个邻结点
                w = getNextNeighbor(v1: u, v2: w)//体现出我们的广度优先
                
            }
        }
        
    }
    
    
    //图中常用的方法
    /// 返回图结点个数
    func getNumOfVertex() -> Int {
        return vertexList.count
    }
    
    /// 显示图对应的矩阵
    func showGraph() {
        for i in edges {
            print(i)
        }
    }
    
    ///返回边的个数
    func getNumOfEdges() -> Int {
        return numOfEdges
    }
    
    ///返回结点i(下标)对应的数据0-> "A" 1->"B" 2->"C"
    func getValueByIndex(i:Int) -> String {
        return vertexList[i]
    }
    
    ///返回v1和v2的权值
    func getWeight(v1:Int,v2:Int) -> Int {
        return edges[v1][v2]
    }
    ///插入结点
    func insertVertex(vertex:String) {
        return vertexList.append(vertex)
    }
    
    
    ///插入结点和边 v1 和 v2 是否相连 0 没有 1 有
    func insertEdge(_ v1:Int,_ v2:Int,_ weight:Int) {
        //这里是有向图 只能连一边
        //        edges[v1][v2] = weight
        
        //这里是无向图
        edges[v1][v2] = weight
        edges[v2][v1] = weight
        
        //边 ++
        numOfEdges+=1
    }
    
}
