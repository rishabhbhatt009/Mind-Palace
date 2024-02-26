Explanation of `nonlocal` and `global`

The `nonlocal` keyword is used to declare that a variable refers to a previously bound variable in the **nearest enclosing scope** excluding globals. This is important for variables that are **not mutable** objects.

```python 
x = 0  					# Global variable
def outer():
    x = 1  				# This x is local to the outer function
    def inner():
        nonlocal x  	# Refers to x in outer function, not the global x
        x = 2  			# Modifies the x in the outer function
        def innermost():
            global x  	# Refers to the global x
            x = 3  		# Modifies the global x
        innermost()
        print("Inside inner, x is:", x)  # Will print 2 (nonlocal x)
    inner()
    print("Inside outer, x is:", x)  # Will print 2 (local x modified by inner)
outer()
print("In global scope, x is:", x)  # Will print 3 (global x)

```

---