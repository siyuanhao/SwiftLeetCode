//
//  File.swift
//  SwiftEX
//
//  Created by 郝思远 on 2020/10/28.
//  Copyright © 2020 郝思远. All rights reserved.
//
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

import Foundation
class SolutionLinkedList {
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? { //递归
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        var newHead:ListNode? = nil
        if l1!.val > l2!.val {
            newHead = l2
            newHead!.next = mergeTwoLists(l1,l2?.next)
        } else {
            newHead = l1
            newHead?.next = mergeTwoLists(l1?.next, l2)
        }
        return newHead
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? { //非递归
        var head = ListNode(0) //head
        var res = head
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        var p = l1
        var q = l2
        
        while p != nil && q != nil{
            if p!.val < q!.val {
                res.next = p
                p = p?.next
                res = res.next!
            } else {
                res.next = q
                q = q?.next
                res = res.next!
            }
        }
        if p != nil {
            res.next = p
        }
        if q != nil {
            res.next = q
        }
        return head.next
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre:ListNode? = nil
        var p:ListNode? = head

        while p != nil {
            let temp = p?.next
            p?.next = pre
            pre = p
            p = temp
        }
        return p
    }
}
