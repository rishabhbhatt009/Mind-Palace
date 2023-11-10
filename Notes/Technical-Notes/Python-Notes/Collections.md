## Collections 

---
### 1. `defaultdict` 

Return a default value when `KeyError` 

```python 
from collections import defaultdict

lst = [1,1,1,2,3,4,5]

count = defaultdict(int) # takes in a func as an argument for default value

for num in lst : 
  count[num] += 1
```

With a normal dictionary 

```python 
lst = [1,1,1,2,3,4,5]

count = dict()

for num in lst : 
  if num in count :
    count[num] += 1
  else :
    count[num] = 0
```

---
### 2. Counter 

---
### 3. Named Tuple


---