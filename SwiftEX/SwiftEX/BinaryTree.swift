//
//  BinaryTree.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/10/25.
//  Copyright © 2020 郝思远. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init() { self.val = 0; self.left = nil; self.right = nil; }
}

//二叉树深度
class TreeSolution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if (root == nil) {
            return 0
        }
        let leftDepth = maxDepth(root?.left)+1
        let rightDepth = maxDepth(root?.right)+1
        return max(leftDepth, rightDepth)
    }
    
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        var maxIndex = 0
        var maxVal = nums[0]
        for i in 0..<nums.count {
            if nums[i] > maxVal {
                maxVal = nums[i]
                maxIndex = i
            }
        }
        let root = TreeNode(maxVal)
        let letfArray = Array(nums.prefix(maxIndex))
        let rightArray = Array(nums.suffix(nums.count-maxIndex - 1))
        root.left = constructMaximumBinaryTree(letfArray)
        root.right = constructMaximumBinaryTree(rightArray)
        return root
    }
    
    func mirrorTree(_ root: TreeNode?) -> TreeNode? { //镜像、翻转 是一个意思
        if root == nil {
            return nil
        }
        
        let tempNode = root?.left
        root?.left = root?.right
        root?.right = tempNode
        root?.left = mirrorTree(root?.left)
        root?.right = mirrorTree(root?.right)
        return root
    }
    
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil && t2 == nil {
            return nil
        }
        let node = TreeNode((t1?.val ?? 0) + (t2?.val ?? 0))
        node.left = mergeTrees(t1?.left, t2?.left)
        node.right = mergeTrees(t1?.right, t2?.right)
        return node
    }
    
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var curr:TreeNode? = root
        var stack = [TreeNode]()
        var nums = [Int]()
        while curr != nil || !stack.isEmpty {
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            curr = stack.removeLast()
            nums.append(curr!.val)
            curr = curr?.right
        }
        return nums[nums.count - k]
    }
    
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        if containNoOne(root) {
            return nil
        }
        root?.right = pruneTree(root?.right )
        root?.left =  pruneTree(root?.left)
        return root
    }
    
    func containNoOne(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if root?.val == 1 {
            return false
        }
        
        return root?.val != 1 && self.containNoOne(root?.left) && self.containNoOne(root?.right)
    }

    func lowestCommonAncestor(_ root: TreeNode?, p : TreeNode?, q : TreeNode?) -> TreeNode? {
        if root == nil || root?.val == p?.val || root?.val == q?.val {
            return root
        }
        
        let left = lowestCommonAncestor(root?.left, p: p, q: q)
        let right = lowestCommonAncestor(root?.right, p: p, q: q)
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        return root
    }
    
    func lowestCommonAncestor2(_ root: TreeNode?, p : TreeNode?, q : TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root?.val == p?.val || root?.val == q?.val {
            return root
        }
        let left = lowestCommonAncestor(root?.left, p: p, q: q)
        let right = lowestCommonAncestor(root?.right, p: p, q: q)
        if left != nil && right != nil {
            return root
        }
        return left == nil ? right : left
    }
    
}
