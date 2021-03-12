//
//  main.swift
//  二叉树相关
//
//  Created by Tate on 2021/3/1.
//

import Foundation


//翻转一棵二叉树。
//
//示例：
//
//输入：
//
//     4
//   /   \
//  2     7
// / \   / \
//1   3 6   9
//输出：
//
//     4
//   /   \
//  7     2
// / \   / \
//9   6 3   1
//备注:
//这个问题是受到 Max Howell 的 原问题 启发的 ：
//
//谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。

class TreeNode {
   var val: Int
   var left: TreeNode?
   var right: TreeNode?
   init(_ val: Int) {
       self.val = val
       self.left = nil
       self.right = nil
  }
}

func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        _ = invertTree(root.left)
        _ = invertTree(root.right)
    
        let temp = root.left
        root.left = root.right
        root.right = temp

        return root
}




