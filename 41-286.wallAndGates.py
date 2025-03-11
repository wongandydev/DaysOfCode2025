def solution(grid):
    queue = deque() #row, col, distance
    INF = 2**31 - 1  # Representation of INF
    
    rows, cols = len(grid), len(grid[0])

    for starting_row in range(rows):
        for starting_col in range(cols):
            if grid[starting_row][starting_col] == 0: 
                queue.append((starting_row, starting_col, 0))

    directions = [[0, -1],[0, 1], [1, 0], [-1, 0]]
    while queue: 
        row, col, distance = queue.popleft()
        
        for dr, dc in directions:
            new_row, new_col = row + dr, col + dc

            if 0 <= new_row < rows and 0 <= new_col < cols:
                new_location = grid[new_row][new_col]
                
                if new_location == INF:
                    grid[new_row][new_col] = distance + 1
                    queue.append((new_row, new_col, distance + 1))
    return grid