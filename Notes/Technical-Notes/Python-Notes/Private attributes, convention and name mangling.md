# Private attributes

---

```python
class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    # ... rest of the class ...
```

- The attributes `width` and `height` of `Rectangle` class are **not private**. 
- **Python does not enforce access restrictions** as strictly as languages like C++ or Java
- In Python, all attributes are essentially public, and it relies more on convention and discipline to control access to them

---
Python does have a convention for indicating that an attribute is intended for internal use:

- **Single Leading Underscore (`_`):** By convention, a name prefixed with an underscore (e.g., `_width`) *should be treated as a non-public part of the API or any Python code*, whether it is a function, a method, or a data member. This convention is for internal use and is *not enforced* by the Python interpreter.

- **Double Leading Underscores (`__`):** This causes **name mangling**, where the interpreter changes the name of the variable in a way that makes it harder to create subclasses that accidentally override the private attributes and methods. For example, `__width` would be mangled to `_ClassName__width`.
 
But remember, this is more about signaling intent and adhering to convention than enforcing strict access control. The Python philosophy tends to lean towards "*we are all consenting adults here*" when it comes to accessing class members.

---