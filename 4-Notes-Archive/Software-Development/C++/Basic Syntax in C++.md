# Basics Syntax 

- Data Types : 
	- Fundamental (`int`, `long`, `long long`, `float`, `double`, `char`, `bool`) 
	- Derived (arrays, pointers, references) 
	- ==User Defined== (`struct`, `union`, `class`)
	- `sizeof()` and `numeric_limits<>::min()/max()`
	- type conversion : implicit and explicit 
	- type casting : c style `(int)`, `static_cast<int>` (compile time), `dynamic_cast` (run time)
	- `auto` ==(Automatic Type Deduction)== :  automatically deduces the type of a variable from the type of its initializer expression at compile time
- Scope of a variables : global and local (block, namespace and class)
- Operators 
	- Arithmetic Operators
	- Logical Operators
	- Bitwise Operators
- Control Flow : 
	- Conditionals 
	- Switch 
	- Loops, ==range-based for loop==
- Directives : `#`, include, define and conditional directives, ==macros==
- Functions : Function declaration (prototype) and definition, Inline Functions, 
- **Lambda Functions** : `auto func = [](int a, int b){return a+b;};`
- ==Memory Model== : Stack, Heap, Data and Code segments
- ==Pointer and References== : pointer declaration operator, address of operator, reference operator, dereference operator. Normal pointers (in stack), raw pointers (dynamic memory allocation in heap), memory leaks, smart pointers (unique and shared). **Function pointers**. Difference b/w a reference and pointer.
- Structuring Codebase : 
	- Code splitting : Separating header and source files
	- Forward declaration for functions and class
	- Include guards (header guards)
	- Namespaces : scope resolution operator `::`, `using` keyword

- Structures and Classes : Structures v/s Classes 

- Keywords : `auto`, `const`, `static`
