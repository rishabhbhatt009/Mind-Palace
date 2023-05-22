# Dynamic Programming 

## Table Of Content 

<hr>

## Characteristics of DP problems 
1. The problem can be broken into **subproblems**
2. The subproblems should **overlap** 
3. The problem has an **optimal substructure**

## How is it different from other algorithm ?
1. **Greedy Algorithm** : have optimal substructure, but not overlapping subproblems.
2. **Divide and Conquer** : break a problem into subproblems, but these subproblems are not overlapping

## Implementing DP algorithm 
1. ### Bottom-Up Approach (Tabulation) : 
   - Bottom-up is implemented with iteration 
   - starts at the base cases
2. ### Top-Down Approach (Memoization) : 
   - implemented with recursion and made efficient with *memoization*
   - starts from the main problem which is broken down recursively till we reach the base case 

### What is memoization ?
**Memoizing a result** means to store the result of a function call, usually in a hashmap or an array, so that when the same function call is made again, we can simply return the memoized result instead of recalculating the result.

### Which implementation approach is better ?  
- A bottom-up implementation's runtime is usually faster, as iteration does not have the overhead that recursion does.
- A top-down implementation is usually much easier to write. This is because with recursion, the ordering of subproblems does not matter, whereas with tabulation, we need to go through a logical ordering of solving subproblems.



