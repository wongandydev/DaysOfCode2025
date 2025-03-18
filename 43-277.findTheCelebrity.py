# https://leetcode.com/problems/find-the-celebrity/

# 📌 Problem: "Find the Celebrity" (Medium)
# 💡 You are at a party with n people (labeled 0 to n-1).
# A celebrity is defined as:

# Everyone knows them (knows(x, celebrity) == True for all x ≠ celebrity).

# They know no one (knows(celebrity, x) == False for all x ≠ celebrity).

# 🔹 You have access to a helper function:

# knows(a, b) → bool  # Returns True if 'a' knows 'b'



# 🔹 Your task: Find the celebrity, or return -1 if there isn't one.
# 🔹 Optimize it to run in O(n) time.


# is this array of people sorted from number of know? probably not. 
# don't think it is two pointer of sliding window since none of these are sorted. It feels like an algorithm that requries us to look everywhere. 
# I want to say bfs but that usually requires a concept of neighbors like nodes/linked list which this is not, it is a list


# Boyer-Moore Voting Algorithm 
# We start with holding the first "candidate" that satisfies our requirement. +1 if that is true -1 if not and when it hits 0 we find a new one. 

# My Attempt
def findTheCelebrity(nums):
    celebrity, count = None, 0
    
    for num in range(0, len(nums)-1):
        if count == 0:
            celebrity = num
        count += 1 if not knows(num, celebrity) else celebrity = None

    return celebrity if celebrity is not None else -1

# Solution
def findTheCelebrity(n):
    candidate = 0  # Assume person 0 is the celebrity

    # Step 1: Find the potential celebrity using elimination (O(n))
    for i in range(1, n):
        if knows(candidate, i):  
            candidate = i  # If candidate knows i, candidate is NOT a celebrity

    # Step 2: Verify if the candidate is actually a celebrity (O(n))
    for i in range(n):
        if i != candidate and (knows(candidate, i) or not knows(i, candidate)):
            return -1  # If candidate knows someone OR someone doesn’t know them → Not a celeb

    return candidate
