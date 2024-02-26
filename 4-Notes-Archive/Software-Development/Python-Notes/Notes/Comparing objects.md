# Comparing objects 

---
Difference b/w `obj1==obj2`, `obj1 is obj2`, `id(obj1) == id(obj2)`

- `obj1==obj2` : True if 2 objects are considered equal. Uses `__eq__` to determine equality. If not overridden default behavior is to compare memory
- `obj1 is obj2` : Compare the memory location of the objects
- `id(obj1) == id(obj2)` : Compare the memory location of the objects

---