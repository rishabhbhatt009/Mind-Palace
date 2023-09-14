# Theory 
Reference : Version Control Systems, Missing Semester MIT - [Lecture Video](https://www.youtube.com/watch?v=2sjqTHE0zok&list=PLyzOVJj3bHQuloKGG59rS43e29ro7I57J&index=6&ab_channel=MissingSemester) | [Lecture Notes](https://missing.csail.mit.edu/2020/version-control/)

Lecture Notes : *a different approach to study Git*
- Version Control Systems **for txt files** : Git 
- GitHub is a just host for Git repositories
- Git Data Models :
	- sample directory structure :
		- `(root)`
		- `folder-1`
			- `folder-2`
			- `file-1`
			- `file-2`
	- folders => **trees** 
	- files => **blobs** 
	- **metadata** : author, message, etc. 
	- **snap shots** (copies of folders which are dated and time stamped) => **commit** = struct {parents, metadata, snapshots} 
	- commits are chained together 
	- liner sequence of snap shots = **history** ==(git doesn't use this)==, git uses a **directed acyclic graph** to model history 
	- **object** and **references** (human readable)
- *(HEAD -> master)* : 
	- **HEAD** : pointer to the <s>current state</s> latest committed state, which may be behind the cwd 
	- **master** : branch name

