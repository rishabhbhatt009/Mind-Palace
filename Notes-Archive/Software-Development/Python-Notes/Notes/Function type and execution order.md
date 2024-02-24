# Functions types, and execution order 

---
- Types of functions :
	1. Instance Methods (with `self`)
	2. Class Methods (with `cls` and `@classmethod`)
	3. Static Method (without `self` or `cls` with `@staticmethod`)

---
- **Execution order of functions** : 
	- **when the class body is executed**, all of the method definitions are processed to create function objects, and then they are attached to the class namespace. So, by the time you actually instantiate an object of the class and start calling its methods, all other methods are already defined and available to be called.
	- Exception : **when methods are called within other methods**, or during the class's initialization, they need to be defined by the time they are called. Therefore, when a method is referenced by another method within the class definition body, and **not through the `self` reference or through the class name**, Python will raise a `NameError` because it is called before it has been defined.

---

