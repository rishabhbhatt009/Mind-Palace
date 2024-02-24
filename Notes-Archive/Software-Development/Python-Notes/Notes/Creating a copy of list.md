## Creating a copy of list (**Shallow v/s Deep copy**)

Different Types
- New Alias : reference (pointer) to the original list
- Shallow Copy : 
	- making a shallow copy of a compound list creates a new compound list and uses the references to the objects that the original list used.
	- Changes made to individual elements will not affect the original list, but changes to mutable objects within the list will be reflected in both. 
- Deep Copy : Creates a completly independent copy

| Different ways to copy      | Result                      |
|---------------------------- | --------------------------- |
| The assignment operator    | new pointer to the same list|
| The slicing syntax         | shallow copy                |
| The list.copy() method     | shallow copy                |
| The copy.copy() function   | shallow copy                |
| The copy.deepcopy() function | deep copy                  |

Conclusion : shallow Copy of a list containing immutable values ~ deep copy
Resource : [Link](https://www.dataquest.io/blog/python-copy-list/)
