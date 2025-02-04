/*
Given an m x n grid of characters board and a string word, return true if word exists in the grid.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.


https://leetcode.com/problems/word-search/
*/



// Working version of using backtraking and DFS.
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let rows = board.count
        let cols = board[0].count
        let word = Array(word)

        func backtrack(_ row: Int, _ col: Int, _ index: Int) -> Bool {
            // Base case: all characters in `word` are found
            if index == word.count {
                return true
            }
            
            // Boundary and character match check
            if row < 0 || row >= rows || col < 0 || col >= cols || board[row][col] != word[index] {
                return false
            }

            // Temporarily mark the cell as visited
            let temp = board[row][col]
            board[row][col] = "#" // this is so when we call the four backtrack funcs we won't come back to a value we had vistied. 

            // Explore all four directions
            let found = backtrack(row, col + 1, index + 1) || // Right
                        backtrack(row + 1, col, index + 1) || // Down
                        backtrack(row, col - 1, index + 1) || // Left
                        backtrack(row - 1, col, index + 1)    // Up

            // Restore the cell after backtracking
            board[row][col] = temp
            
            return found
        }

        for i in 0..<rows {
            for j in 0..<cols {
                if backtrack(i, j, 0) { return true }
            }
        }
        
        return false
    }
}


// FAILED 
// Based on the editorial my mistake here is not using backtracing and DFS. I am not tryng to go deep and find the word before trying a new direction. 
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        // Helper func pss board, direction, currentlocation and returns a i Index and j index
        // check if any of those chars are the character we want, if yes retuirn the index 
        // return false at end of going throuhg all of array because. that means we never hit it. Can't return false before 
        // return true immeditely once we have found the word. 

        var charsFoundInBoard = 0 // This acts as a counter and a index. 
        var word = Array(word)
        var hasFoundWord = false

        func findNextCharacter(row: Int, col: Int, charsFoundInBoard: Int) { // can't be in out becuase it will always be 0 cause we are sharing 
            guard row >= 0, row < board.count, col >= 0, col < board[row].count else {
                return
            }

            if charsFoundInBoard == word.count {
                hasFoundWord = true 
            }

            // need base case to end. 
            // Do we need it? Maybe it will all out of bound eventually and it will end 

            let character = board[row][col]
            
            if character != word[charsFoundInBoard] && charsFoundInBoard != 0  {
                // reset counter
                findNextCharacter(row: row, col: col, charsFoundInBoard: 0)
            } else {
                findNextCharacter(row: row - 1, col: col, charsFoundInBoard: charsFoundInBoard + 1) // up
                findNextCharacter(row: row + 1, col: col, charsFoundInBoard: charsFoundInBoard + 1) // down
                findNextCharacter(row: row, col: col - 1, charsFoundInBoard: charsFoundInBoard + 1) // left
                findNextCharacter(row: row, col: col + 1, charsFoundInBoard: charsFoundInBoard + 1) // right
            }
        }

        findNextCharacter(row: 0, col: 0, charsFoundInBoard: 0)
        return hasFoundWord             
    }
}