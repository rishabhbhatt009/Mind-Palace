# Decorators 

---
## Decorators Used :
- Basic :
  1. `@property `
  2. `@staticmethod`
  3. `@abstractmethod`
- Interesting
  1. `@dataclass`
- `functools`
  1. `@cache_lru()` 

---
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

---
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

---
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

---
Resource : 
- https://realpython.com/primer-on-python-decorators/

---