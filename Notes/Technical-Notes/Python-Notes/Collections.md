## collections 

---
`collections` module provides specialized **container datatypes**, offering alternatives to Python’s general purpose **built-in containers** like `dict`, `list`, `set`, and `tuple`.

![Table | 550](Pasted%20image%2020231114081949.png)

---
`defaultdict` : Return a default value when `KeyError` 

```python 
from collections import defaultdict

lst = [1,1,1,2,3,4,5]

count = defaultdict(int) # takes in a func as an argument for default value
for num in lst : 
  count[num] += 1

### with a normal dictionary 
count = dict()
for num in lst : 
  if num in count :
    count[num] += 1
  else :
    count[num] = 0
```

---
`Counter` : Count of each element in an iterable 



---
`deque` : A list-like container with fast appends and pops on either end.

```python
from collections import deque

d = deque('ghi')  # make a new deque with three items

d.append('j')     	# add a new entry to the right side
d.appendleft('f') 	# add a new entry to the left side
print(d)          	# Output: deque(['f', 'g', 'h', 'i', 'j'])
d.pop()				# return and remove the rightmost item
d.popleft()         # return and remove the leftmost item
print(d)          	# Output: deque(['g', 'h', 'i'])
```

---
### 3. Named Tuple


---