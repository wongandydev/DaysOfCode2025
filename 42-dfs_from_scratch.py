


# My Solution take 2 


# 1 0 0
# 0 0 0
# 0 0 1

def numberOfIslands(grid): 
    count = 0
    for r in range(len(grid)):
        for c in range(len(grid[0])):
            if grid[r][c] == "1": 
                count += 1     
                dfs(r, c, grid)

    return count

def dfs(row, col, grid):
    # if row and col is not within the grid or island is visited or zero, stop dfs
    if 0 > row or row >= len(grid) or 0 > col or col >= len(grid[0]) or grid[row][col] == "0":
        return

    grid[row][col] = "0"  # Mark as visited

    dfs(row - 1, col, grid) # UP
    dfs(row + 1, col, grid) # Down 
    dfs(row, col - 1, grid) # Left
    dfs(row, col + 1, grid) # Right
    



# My Solution 

class Solution: 
    # 1 0 0
    # 0 0 0
    # 0 0 1

    def numberOfIslands(grid): 
        count = 0

        for r in range(len(grid)):
            for c in range(leng(grid[0])): # ERROR misspelled 
                current = grid[r][c]

                if current == 1: 
                    count += 1     
                    dfs(r, c)

        def dfs(row, col):
            # if row and col is not within the grid or island is visited or zero, stop dfs

            # ERROR - you got lazy and for to check out of bounds rather than or-ing correct statements 
            if 0 <= row < len(grid) or 0 <= col < len(grid[0]) or grid[row][col] == "0":
                # this is our base case to end the recursion otherwise it will keep going 
                return 
            # ERROR forgot to set just visited to zero now

            dfs(row + 1, col)
            dfs(row - 1, col)
            dfs(row, col + 1)
            dfs(row, col - 1)
