/*
Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.

 

Example 1:


Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
Example 2:

Input: root = [1,2]
Output: 1
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

// My version
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        // Recurrsion, we would start a left and a right, store a counter in the function. 
        var diameter = 0

        iterate(root, diameter: &diameter)
        return diameter
    }

    func iterate(_ node: TreeNode?, diameter: inout Int) -> Int {
        guard node != nil else {
            return 0
        }

        var leftPath = iterate(node?.left, diameter: &diameter)
        var rightPath = iterate(node?.right, diameter: &diameter)

        diameter = max(diameter, leftPath + rightPath)

        return max(rightPath, leftPath) + 1
    }
}

// Working solution after going through Editorial 
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        // Recurrsion, we would start a left and a right, store a counter in the function. 
        var diameter = 0

        func iterate(_ node: TreeNode?) -> Int {
            guard node != nil else {
                return 0
            }

            var leftPath = iterate(node?.left)
            var rightPath = iterate(node?.right)

            diameter = max(diameter, leftPath + rightPath)

            return max(rightPath, leftPath) + 1
        }

        iterate(root)
        return diameter
    }
}

 // My approach - failed 
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        // Recurrsion, we would start a left and a right, store a counter in the function. 
        var diameter = 0

        return max(diameter, iterate(root?.left, counter: 0), iterate(root?.right, counter: 0))
    }

    func iterate(_ node: TreeNode?, counter: Int) -> Int {
        guard node != nil else {
            return counter
        }

        return max(iterate(node?.right, counter: counter + 1), iterate(node?.left, counter: counter + 1))
    }
}