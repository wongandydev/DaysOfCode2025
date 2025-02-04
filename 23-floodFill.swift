/*
You are given an image represented by an m x n grid of integers image, where image[i][j] represents the pixel value of the image. You are also given three integers sr, sc, and color. Your task is to perform a flood fill on the image starting from the pixel image[sr][sc].

To perform a flood fill:

Begin with the starting pixel and change its color to color.
Perform the same process for each pixel that is directly adjacent (pixels that share a side with the original pixel, either horizontally or vertically) and shares the same color as the starting pixel.
Keep repeating this process by checking neighboring pixels of the updated pixels and modifying their color if it matches the original color of the starting pixel.
The process stops when there are no more adjacent pixels of the original color to update.
Return the modified image after performing the flood fill.

Example 1:

Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2

Output: [[2,2,2],[2,2,0],[2,0,1]]

Explanation:



From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.

Example 2: 

Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0

Output: [[0,0,0],[0,0,0]]

Explanation:

The starting pixel is already colored with 0, which is the same as the target color. Therefore, no changes are made to the image.

https://leetcode.com/problems/flood-fill/
*/

// Leet code's DFS
class Solution {
    public int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
        int color = image[sr][sc];
        if (color != newColor) {
            dfs(image, sr, sc, color, newColor);
        }
        return image;
    }
    public void dfs(int[][] image, int r, int c, int color, int newColor) {
        if (image[r][c] == color) {
            image[r][c] = newColor;
            if (r >= 1) {
                dfs(image, r - 1, c, color, newColor);
            }
            if (c >= 1) {
                dfs(image, r, c - 1, color, newColor);
            }
            if (r + 1 < image.length) {
                dfs(image, r + 1, c, color, newColor);
            }
            if (c + 1 < image[0].length) {
                dfs(image, r, c + 1, color, newColor);
            }
        }
    }
}

// Space & Time: O(m * n) according to leetcode, I thought it was O(n) but it isn't because this is 2D array not 1D. But it is also the most optimal.
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        let startingValue = image[sr][sc]
        var image = image

        // 1. Get the value of starting pixel. Adjacent means i +/- 1 and j +/- 1 where i and J > 0 but less than size of array 
        // diagonally is not adjacent. 
        // needs to be recursive because of point 4 in this problem, "process stops when there are no more adjacent pixels of the orignal color to update"
        func fill(_ image: inout [[Int]], i: Int, j: Int) {
            guard i >= 0, i < image.count, j >= 0, j < image[i].count else {
                return 
            }

            // I was missing this base case to stop. I had an infinite recursion becuase I kept making sure that value is the same as the starting value. Which can be the case for where the color is also that value and this would not stop because it kept setting the color. 
            if image[i][j] == color || image[i][j] != startingValue {
                return
            } 

            image[i][j] = color

            fill(&image, i: i + 1, j: j)
            fill(&image, i: i - 1, j: j)
            fill(&image, i: i, j: j + 1)
            fill(&image, i: i, j: j - 1)
        }

        fill(&image, i: sr, j: sc)
        return image
    }
}   