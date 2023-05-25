# Programming Language : **Python** 

<hr>

## Table Of Content <!-- omit from toc -->
- [Object Oriented Programming](#object-oriented-programming)
- [Collections](#collections)
  - [1. Default Dictionary](#1-default-dictionary)
  - [2. Counter](#2-counter)
  - [3. Named Tuple](#3-named-tuple)
- [FAQ](#faq)
  - [**Shallow v/s Deepcopy**, creating a copy of list](#shallow-vs-deepcopy-creating-a-copy-of-list)
  - [Binary Operation](#binary-operation)

<hr>

## Object Oriented Programming

<hr>

## Collections 

### 1. Default Dictionary 
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

### 2. Counter 
### 3. Named Tuple

<hr>

## FAQ

### **Shallow v/s Deepcopy**, creating a copy of list 
Resource : [Link](https://www.dataquest.io/blog/python-copy-list/)

- New Alias : reference (pointer) to the original list
- Shallow Copy : 
  - making a shallow copy of a compound list creates a new compound list and uses the references to the objects that the original list used.
  - Changes made to individual elements will not affect the original list, but changes to mutable objects within the list will be reflected in both. 
- Deep Copy : 
  - Creates a completly independent copy

| Different ways to copy      | Result                      |
|---------------------------- | --------------------------- |
| The assignment operator    | new pointer to the same list|
| The slicing syntax         | shallow copy                |
| The list.copy() method     | shallow copy                |
| The copy.copy() function   | shallow copy                |
| The copy.deepcopy() function | deep copy                  |

### Binary Operation

```python
### convert to int binary 
decimal = 10
binary = bin(decimal) # = 'xb1010' this can be converted back using int(binary,2)

### convert bin to int 
binary = '11'
dec = int(binary,2) # = 3

### xor 
a = 1
b = 2
c = a ^ b # = 3
```

Base conversion : [link](https://www.rapidtables.com/convert/number/base-converter.html)
