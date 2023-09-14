# Dynamic Programming 

## Table Of Content 
- [Table Of Content](#table-of-content)
- [Characteristics of DP problems](#characteristics-of-dp-problems)
- [How is it different from other algorithm ?](#how-is-it-different-from-other-algorithm-)
- [Implementing DP algorithm](#implementing-dp-algorithm)
  - [What is **memoization** ?](#what-is-memoization-)
  - [Which implementation approach is better ?](#which-implementation-approach-is-better-)
- [Identifying a DP Problem ?](#identifying-a-dp-problem-)
- [Framework to solve DP Problems](#framework-to-solve-dp-problems)
  - [Vanilla DP Problem](#vanilla-dp-problem)

<hr>

## Characteristics of DP problems 
1. The problem can be broken into **subproblems**
2. The subproblems should **overlap** 
3. The problem has an **optimal substructure**

## How is it different from other algorithm ?
1. **Greedy Algorithm** : have optimal substructure, but these subproblems are not **overlapping**.
2. **Divide and Conquer** : break a problem into subproblems, but these subproblems are not **overlapping**.

## Implementing DP algorithm 

There are 2 implementation approaches :
1. ### Bottom-Up Approach (**Tabulation**) : 
   - Bottom-up is implemented with iteration 
   - starts at the base cases 
   - you have to navigate in a specific order 
2. ### Top-Down Approach (**Recursion + Memoization**) : 
   - implemented with recursion and made efficient with *memoization*
   - starts from the main problem which is broken down recursively till we reach the base case 

### What is **memoization** ?
Memoizing a result means to store the result of a function call, **this can be done using a hashmap or an array**, so that when the same function call is made again, we can simply return the memoized result instead of recalculating the result.

### Which implementation approach is better ?  
- **bottom-up approach** : runtime is usually faster, as iteration does not have the overhead that recursion does.
- **top-down approach** : usually much easier to implement, as the ordering of subproblems does not matter, whereas with tabulation, we need to go through a logical ordering of solving subproblems.

## Identifying a DP Problem ?
1. problem will ask for : 
   1. the optimum value (maximum/minimum/longest) of something
   2. the number of ways there are to do something
   3. if it is possible to reach a certain point
2. the problem has constraints that cause future "decisions" to depend on earlier decisions

The first characteristic filters problems down to 2 algorithm : Greedy or Dynamic Programming. The second one narrows it down to a DP problem. However these characteristics are just guidelines, which are extremely common in DP problems.

<hr>

## Framework to solve DP Problems

- A scenario (**state**) in a problem can be defined with a set of variables (**state variables**)
- We only care about a **relevant set** of these state variables 

The framework has the following 3 steps : 
1. **FUNCTION** / **DATA STRUCTURE** : 
   - this will compute/contain the answer to the problem for every given state.
   - Question : **What will be the relevant state variables to define a state**
2. **RECURRENCE RELATION** : 
   - this is an equation that relates different states with each other and controls transition between states.
   - Question :  **Finding the recurrence relation involves thinking about how moving from one state to another changes the answer to the problem.**
3. **BASE CASE** : 
   - this is used to terminate our recurrence relation and prevent it from going infinitely. 
   - Question : **What state(s) can I find the answer to without using dynamic programming.** 

Remarks : 
- it is easier to think about the top-down approach 
- DPT can be both a hashmap or an array 
- remember a `defaultdict(func)` from the `collections` library 

### Vanilla DP Problem 

```python
def Solution() : 
   
   ### init DPT
   DPT = hashmap/array 
   DPT[0] = constant # add base cases to DPT
   .
   .

   def func(stat_variables) -> optima of problem :

      ### update DPT
      if state_variables not in DPT : # since base case already in DPT will step over them 
         
         ### recurrence relation
         op1 = ...
         op2 = ...
         DPT[state_variables] = max(op1, op2) / min(op1,op2)

      return memo[state_variables] 
```





