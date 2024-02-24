# Programming paradigms

A **paradigm** is a standard, perspective, or set of ideas. A **programming paradigm** is a fundamental approach or style of programming that provides a set of principles, concepts, and techniques for designing and implementing computer programs.

---
## Simple Taxonomy 

![](Pasted%20image%2020240108100308.jpg)

---
**Imperative Programming** : 
- Focuses on describing **how a program operates**. It consists of commands for the computer to perform actions. The programmer instructs the machine step by step. 
- **Key Characteristics**: State Changes, Sequence of commands, Control structures, Explicit manipulation of state. 
- Example: `C` and `Python` are imperative languages. 

Subtypes : 
- **Structured Programming** : 
	- extensive use of the structured control flow constructs of selection (if/then/else) and repetition (while and for), block structures, and subroutines.
	- **Key Characteristics**: Block Structuring of Code, Controlled Flow Using Loops and Conditionals, Local Variable Scope

- **Procedural Programming** : 
	- Structured + Procedures. Centered around the concept of **procedure calls**. Uses **procedures or functions** to organize code. 
	- **Key Characteristics**: Procedure Calls, Modularity, Local Variable Scope, Sequential Execution 
	- Example: `C` is also a procedural language

- **Object-Oriented Programming (OOP)**: 
	- Based on the concept of "objects", which are instances of classes. Objects encapsulate data and code. Data in the form of fields (often known as attributes), and code, in the form of procedures (methods). 
	- **Key Characteristics**: Objects and Classes, Abstraction, Encapsulation, Inheritance, Polymorphism
	- Example: `Java` and `Python` support OOP


---
**Declarative Programming** : 
- Focuses on **what the program should accomplish** without specifying how to achieve it. The code describes the logic of the computation without describing its control flow. 
- Example: `SQL` for database queries is declarative. You describe what data you want, not how to fetch it.

 Subtypes : 
- **Functional Programming** : 
	- Treats computation as the evaluation of mathematical functions and avoids changing-state and mutable data outside their scope. 
	- Key Characteristics : Pure Functions (does not change state), Immutability, First-Class and Higher-Order Functions, Recursion (for looping)
	- **First-Class and Higher-Order Functions**: Functions are treated as first-class citizens, meaning they can be assigned to variables, passed as arguments to other functions, and returned from other functions. Higher-order functions, which take other functions as arguments or return them, are a fundamental part of functional programming.
	- Example: `JavaScript`, `Python` is a functional language. 

- **Logic Programming** : 
	- Based on formal logic (instead of instructions). A program consists of a set of facts and rules which tell the computer what to do. 
	- Example: `Prolog`. Writing a rule to find a relationship between two people in a family tree is a logic programming example.

---
Other Paradigms :

- **Generic Programming** : 
	- Generic programming is a style of computer programming in which algorithms are written in terms of **data types to-be-specified-later** that are then instantiated when needed for specific types provided as parameters. 
	- Generic programming focuses on designing algorithms that are independent of any particular data type. 
	- Templates in C++ are a powerful feature for creating generic code, as they allow functions and classes to operate with generic types.

- **Event-Driven Programming** : 
	- based on the concept of events and event handlers. It involves programming the flow of a program based on events and the reactions to those events. 
	- GUI programming and asynchronous programming often use this paradigm. `JavaScript` is a language that prominently supports event-driven programming.

- **Concurrent Programming** : 
	- concerned with handling multiple tasks that run simultaneously and potentially interact with each other. 
	- It focuses on managing shared resources, synchronization, and communication between concurrent processes or threads. 
	- Languages like Java and Go provide built-in support for concurrent programming.

---

Programming paradigms supported by 8 frequently-used programming languages :
- C: imperative, procedural
- **C++**: imperative, object-oriented, generic, functional style(not functional)
- C#: imperative, declarative, functional, generic, object-oriented(class-based), component-oriented
- Java: concurrent, class-based, functional(Java8)
- JavaScript: imperative, functional, object-oriented
- **Python**: imperative, functional, procedural, object-oriented
- Ruby: imperative, functional, object-oriented
- **SQL**: declarative, data-driven

----
Resource : 
- [A Brief Survey of “Programming Paradigms”](https://medium.com/@jingchenjc2019/a-brief-survey-of-programming-paradigms-207543a84e2b)