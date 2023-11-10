## Variable Scope 

---
- **scope** : determines the portion of a program where you can access a particular identifier 
- There are four levels of variable scope in Python:
	1. **Local Scope**: variables defined in the current function. These variables are only accessible from the point they are defined until the end of the function.
	2. **Enclosing Scope**: variables in the scope of any enclosing functions, from inner to outer. This comes into play with nested functions, we use `nonlocal` to **modify**.
	3. **Global Scope**: variables defined at the top level of a module () or declared global using the `global` keyword in a function.
	4. **Built-in Scope**: preassigned in the built-in namespace provided by Python.

--- 
- Python uses the **LEGB rule (Local, Enclosing, Global, Built-in)** to resolve names:
	- When you use an unqualified name inside a function, Python searches up to four scopes : #1 local (L) namespace, #2 local namespaces of any enclosing (E) functions and lambdas, #3 global (G) namespace, #4 the built-in (B) namespace. It **stops at the first place the name is found**
	- When you assign a value to a name inside a function (without using `global` or `nonlocal`), it always creates or changes the name in the local namespace.
	- When you assign a value to a name outside any function or class, it is in the global scope.

>[!Note] 
>Unlike some other languages, Python does not have block scope for loops or conditionals (`if`, `elif`, `else`, `while`, `for`). This means that a variable defined within a loop is accessible outside the loop as well. Scope of the variable is based on function/global.

---
- Class variable : 
	- variable inside a class but outside a function, class variables are **shared across all instances of the class** and are not bound to any one instance of the class
	- modifying through the class name `MyClass.class_variable` : the change is reflected in all instances because `class_variable` is shared b/w them
	- modifying though an instance `obj1.class_variable` :  we create a **new instance variable** in `obj` that shadows the class variable of the same name.

- Instance variable :
	- variables that are specific to each instance of a class
	- each object maintains its own copy of instance variables, **not shared among instances**
	- defined within methods & are prefixed with `self`, which refers to the current instance

---
