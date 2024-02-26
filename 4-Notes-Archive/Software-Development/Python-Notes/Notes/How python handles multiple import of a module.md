# How python handles multiple imports of a module ?

----
Scenario : 

```python 
# script1.py 
import os 
# ...
```

```python 
# script2.py 
import script1
import os
# ...
```

---
Explanation : 

- When `script1` imports `script2`, and both scripts import the `os` module, **Python will not import the `os` module twice**. Python modules use a system that ensures modules are only loaded once per interpreter session.
- This is managed through Python's **internal module cache**, which is stored in a dictionary named `sys.modules`. When a module is imported for the first time, it is executed and loaded into `sys.modules`. Subsequent import statements for that module will retrieve the already loaded module from `sys.modules` instead of importing it again.
- This mechanism efficiently handles module loading and ensures that each module is loaded only once, avoiding redundant imports.

---