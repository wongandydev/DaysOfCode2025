# this is my attempt to use BFS for numberOfIslands like we did for DFS

# Fixed 
from collections import deque 
def numberOfIslands(grid):
    if not grid: 
        return 0

    queue = deque()
    rows, cols = len(grid), len(grid[0])
    count = 0 

    for row in range(rows):
        for col in range(cols):
            if grid[row][col] == "1":
                count += 1
                queue.append((row, col)) # row, col, count
                grid[row][col] = 0

    directions = [[0, -1], [0, 1], [1, 0], [-1, 0]]

    while queue:
        row, col = queue.popleft()
        for dr, dc in directions: 
            # how will we append count... we 
            new_row, new_col = row + dr, col + dc
            if 0 <= new_row < rows and 0 <= new_col < cols and grid[new_row][new_col] == "1":
                grid[new_row][new_col] = "0"
                queue.append((new_row, new_col))


# First try 

from collections import deque 
def numberOfIslands(grid):
    queue = deque()

    rows, cols = len(grid), len(grid[0])

    for row in range(rows):
        for col in range(cols):
            if grid[row][col] == "1":
                queue.append(row, col, 1) # row, col, count

    directions = [[0, -1], [0, 1], [1, 0], [-1, 0]]

    while queue:
        row, col, count = queue.popleft()
        grid[row][col] = 0 # not sure we need t his 
        for dr, dc in directions: 
            # how will we append count... we 
            if 0 <= row + dr < rows and 0 <= col + dc < cols and grid[dr][dc] == "1":
                queue.append(row + dr, col + dc, count + 1)
