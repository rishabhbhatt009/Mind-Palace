# Problem with **Mutable Default Arguments** in Functions

---
In Python, **default argument values are evaluated only once when the function is defined**, not each time the function is called. This means that if you use a mutable type like a list or dictionary as a default argument, and then modify it inside the function, the modified value will persist across future calls to the function. 

---
For example, consider the following scenario:

```python
def func(a=[], b=4):
   a.append(b)
   return a

print(func())  # Expected: [4], Actual: [4]
print(func())  # Expected: [4], Actual: [4, 4]
```
   
In the first call, `a` is modified to `[4]`. Since `a` is a mutable default argument, this change persists. In the second call, `a` starts as `[4]` and is further modified to `[4, 4]`.

---
**How to Avoid This Issue**: use `None` (**or another immutable type**) as the default value and then set the mutable type within the function if necessary. 

```python
def func(a=None, b=4):
   if a is None:
	   a = []
   a.append(b)
   return a
```

---