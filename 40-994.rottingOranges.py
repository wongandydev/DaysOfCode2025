class Solution(object):
    def orangesRotting(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        queue = deque() #row, col, minute 
        fresh_orange_count = 0
        rows, cols = len(grid), len(grid[0])

        for row in range(rows):
            for col in range(cols):
                if grid[row][col] == 2:
                    queue.append((row, col, 0))  # Add all rotten oranges

                if grid[row][col] == 1:
                    fresh_orange_count += 1 #count all fresh oranges 

        if fresh_orange_count == 0:
            return 0

        # Step 2: BFS - Spread the rot
        directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        minutes = 0

        while queue: 
            row, col, minutes = queue.popleft()
            for dr, dc in directions:
                    new_r, new_c = row + dr, col + dc
                    if 0 <= new_r < rows and 0 <= new_c < cols and grid[new_r][new_c] == 1:
                        grid[new_r][new_c] = 2  # Rot the orange
                        fresh_orange_count -= 1
                        queue.append((new_r, new_c, minutes + 1))

        # Step 3: If there are still fresh oranges, return -1
        return minutes if fresh_orange_count == 0 else -1