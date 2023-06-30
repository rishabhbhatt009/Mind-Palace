# Programming Language : **Python** 

## Table Of Content <!-- omit from toc -->
- [Decorators](#decorators)
- [Collections](#collections)
  - [1. Default Dictionary](#1-default-dictionary)
  - [2. Counter](#2-counter)
  - [3. Named Tuple](#3-named-tuple)
- [FAQ](#faq)
  - [**Shallow v/s Deepcopy**, creating a copy of list](#shallow-vs-deepcopy-creating-a-copy-of-list)
  - [Binary Operation](#binary-operation)
  - [Dynamic Attribute Handling in Python](#dynamic-attribute-handling-in-python)
  - [Dataclass](#dataclass)

<hr>

<!------------------------------------------------------------------------------------------------>

## Decorators 

Resource : https://realpython.com/primer-on-python-decorators/

Decorators Used :
- Basic :
  1. `@property `
  2. `@staticmethod`
  3. `@abstractmethod`
- Intresting
  1. `@dataclass`
- Functools 
  1. `@cache_lru()` 



1. `@property`: The `property` decorator allows you to define a method as a property of a class. It provides a way to encapsulate attribute access and add logic for getting, setting, or deleting an attribute.

    Example:
    ```python
    class Circle:
        def __init__(self, radius):
            self._radius = radius

        @property
        def area(self):
            return 3.14159 * self._radius ** 2

    circle = Circle(5)
    print(circle.area)  # Output: 78.53975
    ```

2. `@staticmethod`: The `staticmethod` decorator is used to define a method that does not receive any special first argument (like the class or instance). It behaves like a regular function, except it is defined inside a class for organizational purposes.

    Example:
    ```python
    class StringUtils:
        @staticmethod
        def is_palindrome(word):
            return word.lower() == word.lower()[::-1]

    result = StringUtils.is_palindrome("radar")
    print(result)  # Output: True
    ```

3. `@abstractmethod`: The `abstractmethod` decorator is used to define abstract methods within abstract base classes (ABCs). Abstract methods are declared but have no implementation in the base class. Subclasses must provide an implementation for these methods.

    Example:
    ```python
    from abc import ABC, abstractmethod

    class Shape(ABC):
        @abstractmethod
        def calculate_area(self):
            pass

    class Rectangle(Shape):
        def __init__(self, width, height):
            self.width = width
            self.height = height

        def calculate_area(self):
            return self.width * self.height

    rect = Rectangle(5, 3)
    print(rect.calculate_area())  # Output: 15
    ```

<hr>

<!------------------------------------------------------------------------------------------------>

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

<!-- 
===================================================================================================
FAQs for random questions that pop up
===================================================================================================
 -->

## FAQ

<!------------------------------------------------------------------------------------------------>

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

<!------------------------------------------------------------------------------------------------>

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

<!------------------------------------------------------------------------------------------------>

### Dynamic Attribute Handling in Python
- Functions like `getattr()`, `setattr()`, `hasattr()`, `delattr()`
- Resource : https://www.youtube.com/watch?v=2C1BOPAMGHc&ab_channel=NeuralNine 

<!------------------------------------------------------------------------------------------------>

### Dataclass
- Use full for data heavy classes as it provides implementation for for `__init__` , `__repr__`, 
- Reduces the **amount of code** you have to re-write every time you add an attribute
- **Default Value** : We have the ability to set default values for attributes using `field`
- this is useful for mutable types like `list`. Setting `[]` as default values will result in all instances pointing to the same list upon initialization
- using a decorator `@dataclass()`
  - Parameters :
    - `frozen` : attributes can not be changed once declared 
    - `kw_only` : arguments have to be supplied with keywords on init
- You can also set parameters like 
  - `init` : include attribute in `init`
  - `repr` : include attribute in object `repr` 
- You can define functions : 
  - `def __postinit__(self)` : runs after initialization for attributed that depend on other attributes


- Resource : https://www.youtube.com/watch?v=CvQ7e6yUtnw&ab_channel=ArjanCodes

<!-- 
===================================================================================================
===================================================================================================
 -->
