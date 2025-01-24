/*
Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

The distance between two cells sharing a common edge is 1.
 
Example 1:

Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
Output: [[0,0,0],[0,1,0],[0,0,0]]
Example 2:


Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
Output: [[0,0,0],[0,1,0],[1,2,1]]


https://leetcode.com/problems/01-matrix/description/
*/

// New attempt with BFS
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rows = mat.count
        let cols = mat[0].count
        
        // Create a result matrix initialized with -1 for unvisited cells
        var result = [[Int]](repeating: [Int](repeating: -1, count: cols), count: rows)
        
        // Queue to store cells for BFS, initialized with all `0` cells
        var queue = [(row: Int, col: Int)]()
        
        // Step 1: Add all `0` cells to the queue and set their distance to 0
        for row in 0..<rows {
            for col in 0..<cols {
                if mat[row][col] == 0 {
                    result[row][col] = 0
                    queue.append((row, col)) // Add zero cell to the queue
                }
            }
        }
        
        // Step 2: Define directions for moving up, down, left, and right
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        // Step 3: Perform BFS
        while !queue.isEmpty {
            // Dequeue the current cell
            let (currentRow, currentCol) = queue.removeFirst()
            
            // Check all four directions
            for (dRow, dCol) in directions {
                let newRow = currentRow + dRow
                let newCol = currentCol + dCol
                
                // Ensure the new cell is within bounds and unvisited
                if newRow >= 0, newRow < rows, newCol >= 0, newCol < cols, result[newRow][newCol] == -1 {
                    // Update the distance for the new cell
                    result[newRow][newCol] = result[currentRow][currentCol] + 1
                    
                    // Enqueue the new cell to process its neighbors
                    queue.append((newRow, newCol))
                }
            }
        }
        
        return result
    }
}


// Failed attempt with recursion
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rows = mat.count
        let cols = mat[0].count
        var result = [[Int]](repeating: [Int](repeating: -1, count: cols), count: rows)

        for row in 0..<rows {
            for col in 0..<cols {
                if mat[row][col] == 0 {
                    result[row][col] = 0
                } else {
                    result[row][col] = getDistanceToZero(row: row, col: col, result: &result, mat: mat)
                }
            }
        }

        return result
    }

    func getDistanceToZero(row: Int, col: Int, result: inout [[Int]], mat: [[Int]]) -> Int {
        // Base cases
        if row < 0 || row >= mat.count || col < 0 || col >= mat[0].count {
            return Int.max // Out of bounds
        }

        if mat[row][col] == 0 {
            return 0 // Already at a zero cell
        }

        if result[row][col] != -1 {
            return result[row][col] // Use cached value
        }

        // Temporarily mark the cell to avoid revisiting it
        result[row][col] = Int.max

        // Recursively compute the minimum distance from the neighbors
        let top = getDistanceToZero(row: row - 1, col: col, result: &result, mat: mat)
        let down = getDistanceToZero(row: row + 1, col: col, result: &result, mat: mat)
        let left = getDistanceToZero(row: row, col: col - 1, result: &result, mat: mat)
        let right = getDistanceToZero(row: row, col: col + 1, result: &result, mat: mat)

        // Calculate the minimum distance for the current cell
        let minDistance = min(top, down, left, right) + 1
        result[row][col] = minDistance

        return minDistance
    }
}
