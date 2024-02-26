# Standard Library & STL in C++

**C++ Standard Library** includes all of the STL, but it also encompasses more.
- Standard Template Library (STL) 
- Strings
- Error Handling : `stdexcept`
- iostream : `cin`, `cout`, `cerr`, `clog`, `iomanip`
- date/time : `chrono`
- others : `cmath`, `ctime`, `limits`, `memory`, `array`

---
Standard Template Library (STL)
- Containers : 
	- sequence containers (`vector`, `list`, `deque`), 
	- associative containers (`set`, `map`), 
	- unordered associative containers (`unordered_set`, `unordered_map`), and 
	- container adaptors (`stack`, `queue`, `priority_queue`)
- Algorithm : 
	- **non-modifying sequence** : Batch operations, Search operations, Fold operations
	- **modifying sequence** : Copy operations, Swap operations, Transformation operations, Generation operations, Removing operations, Order-changing operations, Sampling operations
	- Sorting Operations : `std::sort`, `std::stable_sort`, and `std::partial_sort`, custom comparison functions or lambda expressions to change the sorting order
	- Searching Operations : `std::find`, `std::binary_search`, and `std::find_if`
	- Numeric Operations
- **Iterators** : `begin()` and `end()`
- Function Objects

---