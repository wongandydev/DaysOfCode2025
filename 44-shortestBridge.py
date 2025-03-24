# 📌 Problem Recap: "Shortest Bridge"
# 💡 You're given a binary n x n grid where:

# 0 represents water.

# 1 represents land (exactly two separate islands exist).

# 🔹 Your goal:
# Find the minimum number of 0s to flip to 1s to connect the two islands.

# DFS then BFS Approach 

# Shortest Bridge My Attempt


# def shortestBridge(grid):
#     rows, col = len(grid), len(grid[0])
#     queue = deque()

#     def dfs(row, col):
#         directions = [(0, -1), (0, 1), (1, 0), (-1, 0)]
#         if 0 <= row < rows and 0 <= col < cols and grid[row][col] == 1:
#             queue.append((row, col))
#             grid[row][col] = -1

#             for dr, dc in directions: 
#                 dfs(row+dr, col + dc)

#     for row in range(rows): #fix 
#         for col in range(cols): #fix 
#             if grid[row][col] == 1:
#                 dfs(row, col)
#                 break #fix 


#     distance = 0 
#     while queue:
#         row, col = queue.popleft()
#         for dr, dc in directions:
#             new_row, new_col = row + dr, col + dc
            
#             # Check if the new position is within bounds
#             if 0 <= new_row < rows and 0 <= new_col < cols:
#                 if grid[new_row][new_col] == 1:
#                     return distance
#                 elif grid[new_row][new_col] == 0:
#                     grids[new_row][new_col] = -1
#                     queue.append((new_row, new_col))
#         distance += 1
#     return -1

# # BFS Appraoch 

# def shortestBridge(grid):
#     rows, col = len(grid), len(grid[0])
#     queue = deque()

#     for row in range(rows): #fix 
#         for col in range(cols) #fix 
#             if grid[row][col] == 1:
#                 queue.append((row, col))
#                 grid[row][col] = -1

#             # Didn't need 
#             # if queue: # not sure what this does 
#             #     return 

#     distance = 0 
#     while queue:
#         row, col = queue.popleft()
#         for dr, dc in directions:
#             new_row, new_col = row + dr, col + dc
            
#             # Check if the new position is within bounds
#             if 0 <= new_row < rows and 0 <= new_col < cols:
#                 if grid[new_row][new_col] == 1:
#                     return distance
#                 elif grids[new_row][new_col] == 0:
#                     grid[new_row][new_col] = -1
#                     queue.append((new_row, new_col))
#         distance += 1
#     return -1




# My Attempt

# First though her is that we should do BFS because it is asking for shortest path. 
# How do we know it's not DFS?? WHat keyword should I be looking there? 


# Find the lands (1) in the array and add them to the queue, 
# Loop as long as queue is not empty, 
# when we hit 1 we stop and return?
# "flip" every 0 to 1 and add them to the queue otherwise and keep going through the loop

def shortestBridge(grids):
    queue = deque()
    rows, cols = len(grids), len(grids[0])

    # Step 1: Find the first island and add its coordinates to the queue
    for row in range(rows):
        for col in range(cols):
            if grids[row][col] == 1:
                queue.append((row, col))
                grids[row][col] = -1  # Mark as visited

    # Step 2: Perform BFS to find the shortest path to the second island
    directions = [(0, -1), (0, 1), (1, 0), (-1, 0)]
    distance = 0    

    while queue: 
        row, col = queue.popleft()
        for dr, dc in directions:
            new_row, new_col = row + dr, col + dc
            
            # Check if the new position is within bounds
            if 0 <= new_row < rows and 0 <= new_col < cols:
                if grids[new_row][new_col] == 1:
                    return distance
                elif grids[new_row][new_col] == 0:
                    grids[new_row][new_col] = -1
                    queue.append((new_row, new_col))
        distance += 1
    return -1

# Example usage:
# grids = [
#     [0, 0, 1, 0],
#     [0, 0, 0, 0],
#     [1, 0, 0, 0],
#     [0, 0, 0, 1]
# ]
# print(shortestBridge(grids))  # Output: 2 (minimum number of flips to connect the two islands)
# The above example would output 2 because we need to flip two 0s to connect the two islands (1s).
#
# The function `shortestBridge` uses BFS to find the shortest path between two islands in a binary grid.
# It starts by finding the first island and adding its coordinates to a queue.
# Then, it performs BFS to explore the grid, flipping 0s to -1s (visited) until it finds the second island (1).
# The distance variable keeps track of the number of flips needed to connect the two islands.
# The function returns the minimum number of flips required to connect the two islands.
# Note: The function assumes that there are exactly two separate islands in the grid.
# If there are no islands or more than two, the function will return -1.
# This solution has a time complexity of O(n^2) in the worst case, where n is the size of the grid.
# This is because we may need to traverse the entire grid to find both islands.
# The space complexity is O(n) due to the queue used for BFS, where n is the number of cells in the grid.
# This solution is efficient for the problem at hand and should work well for reasonably sized grids.
# The BFS approach is suitable for finding the shortest path in an unweighted grid like this one.
# The function can be tested with different grid configurations to ensure its correctness and efficiency.
# Note: The function assumes that there are exactly two separate islands in the grid.
# If there are no islands or more than two, the function will return -1.        