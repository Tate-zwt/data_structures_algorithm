//
//  main.swift
//  图相关
//
//  Created by Tate on 2021/10/10.
//

import Foundation

print("图相关")

//let vertexs = ["A", "B", "C", "D", "E"]
let vertexs = ["1", "2", "3", "4", "5", "6", "7", "8"]

let n = vertexs.count

let graph = Graph(n: n)

for value in vertexs {
    graph.insertVertex(vertex: value)
}

//A-B A-C B-C B-D B-E
//graph.insertEdge(0, 1, 1); // A-B
//graph.insertEdge(0, 2, 1); //
//graph.insertEdge(1, 2, 1); //
//graph.insertEdge(1, 3, 1); //
//graph.insertEdge(1, 4, 1); //


graph.insertEdge(0, 1, 1);
graph.insertEdge(0, 2, 1);
graph.insertEdge(1, 3, 1);
graph.insertEdge(1, 4, 1);
graph.insertEdge(3, 7, 1);
graph.insertEdge(4, 7, 1);
graph.insertEdge(2, 5, 1);
graph.insertEdge(2, 6, 1);
graph.insertEdge(5, 6, 1);

graph.showGraph()

print("深度优先算法遍历")
graph.dfs() // A->B->C->D->E [1->2->4->8->5->3->6->7]
print("")// 换行
print("广度优先算法遍历")
graph.bfs() // A->B->C->D->E [1->2->3->4->5->6->7->8]
print("")// 换行
