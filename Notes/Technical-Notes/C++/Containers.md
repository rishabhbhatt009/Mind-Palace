# Containers

- Pair 
- C Arrays / STD Arrays 
- STD Vectors 
- STD List 
- STD Deque
- STD Set / Unordered Set
- STD Map / Unordered Map

---
C-Arrays : 
- Have to be contiguous 
- **Compile time allocation** -> array created in **stack** -> garbage collection when it goes out of scope. **Run time allocation** -> array created in **heap** -> manually delete 
- Limitation : Does not provide `index out of range`

STD Arrays :
- directive : `#include <array>`
- declaration : `std::array<int, 10> arr ;`
- operations : `size()`, `data()`, `begin()`, `end()`
- traversal : 
	- `for (int i=0, i<arr.size(), i++) {arr[i]=1}`
	- `for (auto itr = arr.begin(); itr != arr.end(); i++) { *itr = 1;}`
		- where `auto` = `std::array<int, 10>::iterator`
	- ranged for loops : 
		- `for (auto& i : arr) {i=1}` : `i` is reference, modifies original array 
		- `for (auto i : arr) {i=1}` : `i` is copy, doesn't modifies original array 

---
STD Vectors : 
- directive : `#inclide <vector>`
- declaration : 
	- empty vector : `std::vector<int> a;`
	- vector with size (initialize to 0): `std::vector<int> a(10);`
	- vector with size and initialize to value : `std::vector<int> a(10,1);` 
	- `std::vector<int> a = {0,1,2,3,4,5,6,7,8,9};`
- When we add elements to a vector and there isn't enough space all elements are copied to a new location with enough space. Therefore old pointers might not be valid anymore
- operations : `push_back()`, `pop_back()`

---
STD List : 
- doubly linked list 
- directive : `#include <list>`
- declaration : `std::list<int> lst`
- insertion, deletion is easy, however you have to go through all elements/node to get size/access elements

---
STD Deque : 
- double ended queue 
- similar to vector but more efficient insertion and deletion 
- directive : `#include <deque>`
- declaration : `std::deque<int> lst`

---
STD Set : 
- `std::set` : implemented as balanced binary search trees (like Red-Black Trees)
- `std::unordered_set` : implemented as hashmap 

---
STD Map : 
- `std::map` : implemented as a balanced binary search tree (like a Red-Black tree)
- `std::unordered_map` : implemented as hashmap (more efficient)

---
