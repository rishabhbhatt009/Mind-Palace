A closure in Python refers to a programming concept where a function remembers the values from its enclosing lexical scope even when the program flow is no longer in that scope. Closures are used to maintain state in a way that's both hidden and preserved across function calls.

Here's a more detailed explanation:

### How Closures Work

1. **Nested Functions**: In Python, closures typically involve nested functions. The inner function is defined within the scope of the outer function, and it's the inner function that becomes a closure.
    
2. **Access to the Outer Scope**: The inner function has access to variables from the scope of the outer function. This is possible due to Python's scope resolution rule, which allows an inner function to access variables from its enclosing scope.
    
3. **Preserving the Enclosing Scope**: When the outer function finishes execution, you might expect that its local variables are forgotten. However, with a closure, the inner function retains access to those variables even after the outer function has completed execution.
    
4. **Closure as an Object**: The inner function, along with the references to its enclosing scope’s variables, is treated as a single entity. This entity or object is what we call a closure.