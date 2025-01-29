/*
You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

 

Example 1:


Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]
Example 2:

Input: list1 = [], list2 = []
Output: []
Example 3:

Input: list1 = [], list2 = [0]
Output: [0]

https://leetcode.com/problems/merge-two-sorted-lists/description/
*/



/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

// What I was going for 
// Time O(n + m) - M being count of one of the list node and n being the count of the other . Space O(1)
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2

        let preHead = ListNode()
        // tracking 
        var tail = preHead
        
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                // set next value
                tail.next = list1
                // iterate through list 
                list1 = list1?.next
            } else {
                tail.next = list2
                list2 = list2?.next
            }
            // iterate tail 
            tail = tail.next!
        }
        // add rest of the linked list based on which one is empty
        tail.next = list1 == nil ? list2 : list1
        return preHead.next        
    }
}

// My approach - 
/* I think i was close, missing some linkest list correction. Was not sure how to write to the result linked list, then iterate*/
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // two for loops to start 
        var result: ListNode? 

        var currentNode1 = list1
        var currentNode2 = list2
        var currentResultNode = result
        while currentNode1 != nil && currentNode2 != nil {
            // we are forcing because we checked in the while loop that these value are good 
            guard let node1 = currentNode1 else {
                result!.next = ListNode(currentNode2!.val)
                result = result!.next
                break
            }

            guard let node2 = currentNode2 else {
                result!.next = ListNode(node1.val)
                result = result!.next
                break
            }

            if node1.val <= node2.val {
                // we did not need to do this, could have set the node here and when we iterate we can move it and it will set again. Handling this for us.
                currentResultNode = ListNode(node1.val, ListNode(node2.val))
                result = currentResultNode
                currentResultNode = result!.next!.next
                
            } else {
                result = ListNode(node2.val)
                result!.next = ListNode(node1.val)
                result = result!.next!.next
            }


            currentNode1 = node1.next
            currentNode2 = node2.next
        }

        

        // Splicing? 
        return result
    }
}