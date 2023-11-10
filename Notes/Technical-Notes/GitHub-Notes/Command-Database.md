# Commands Database 

#### Basic Commands

^c9226d

- `git help`
- **initializing repository on local** : `git init` 
	- creates a new git repo, with data stored in the `.git` directory  
	- multiple ways to initialize
- `git status`
	- tells you what’s going on
- **ADD files to staging area** : `git add <file1> <file2> | <.> | <*.txt>`
	- - `<.>` : all files 
	- `<*.txt>` : all files with .txt extension
	- git add advance : `<-p>` flag to select pieces you want to add instead of entire document 
	- [?] Un-staging :
- **creates a new commit** : `git commit <-m> "message" <-a>`
	- `-m` : short message
	- `-a` : commit all changes 
- **show commit history** : `git log <--all> <--graph> <--decorate> <--oneline>`
- **switch branch** : `git checkout <commit hash> <file>`
	- *moves the head pointer* and mutates the content of the cwd
	- change the state of the working dir to what it was at given commit
	- `git checkout file1` : *discard the changes in cwd* (not staged) are resets to state that HEAD points to 
	- `git checkout branch-name` : head starts pointing to the location of branch-name (*switch branches*)
	- `git checkout -b branch-name` : combines `git branch new-branch` and `git checkout new-branch`, **creates and switches to new branch** 


- Not so important : 
	- `git cat-file <-p> <hash>` 
		- **gives contents** of the  `<hash>` commit
	- `git diff <hash> <file> <--cached>`
		- **what changed** since the last snapshot 
		- what changed from `<hash>` to `<hash | pointer>` or cwd (staged)

#### Branching and Merging

- `git branch <branch name>`
	- creates a new branch pointing to the current state/commit
	- *list all branches* that are present in the local repo : `git branch`
		- `<-vv>` : be extra verbose and print extra information 
	- *(HEAD -> master, branch-name)* : ==note, head is associated with master==   
	- Flags : 
		- **create new branch** : `git branch <branch name>`
		- **lists all remote branches** : `git branch --remote`  
		- **delete branch** : `git branch -D <branch name>` 
		- **creates and switches to new branch**  : `git checkout -b <branch-name>` 
		- **shortcut to --move --force** : `git branch -M <branch anme>` 

Note : Mostly manager review and approves merge requests after adding comments 

- `git merge <branch-name>` 
	- merges `<branch-name>` to current branch 
	- **merge branches** : `git merge <branch-name>` 
	- [?] **fast-forwarding** 
	- [i] **merge conflict** : 
		- `git mergetool` or manually remove *conflict markers* 
			- make changes 
			- `git add conflict-file `
			- `git merge --continue` : will ask for commit message
- [?] `git rebase` 


#### Collaborating with others
- **download repository from remote** : `git clone <url> <folder name> <--shallow>`
	- taking a remote repo and initialize a local repo from that copy 
	- `<--shallow>` : download just the latest snapshot and not the entire history 
- **REMOTE** : `git remote <add/remove>`
	- `git remote` : **list all remotes** that git knows of the current repo 
	- `git remote add <name> <url>`  : **adding remotes** 
	- [?] *removing remotes* : 

- **PUSH** : `git push <-u> <remote> <local branch>:<remote branch>` 
	- sending changes from local to remote 
	- `git push <remote> <local branch>`  : <u>upload changes from local branch to remote</u> 
	- `<-u>` | `git branch --set-upstream-to=<remote>/<remote branch>` : set up correspondence between local and remote branch

- **FETCH** : `git fetch` 
	- retrieving changes from remote to local  
- **PULL** : `git pull <remote> <branch>` 
	- = `git fetch; git merge`
	- pulls changes from the remote to local and merge with local branch 

##### NOTE : `PULL REQUEST` <font color=white>: pulls from branch to origin/master </font>

#### git config 
- `git config` command, or 
	- Levels - System, Global, Local
	- **Name** : `git config --global user.name "rishabhbhatt009"`
	- **Email** : `git config --global user.email "rishabhbhatt009@gmail.com"`
	- **Default Editor** : `git config --global core.editor "PyCharm"`
	- **Line Ending** : `git config --global core.autoclrf <True / input>`
- creating a `~./gitconfig` in the home folder with plain text configuration
- 


#### Git Ignore File
- ignore certain files / pattern of file names

#### Advance Commands 
- `git blame`
- `git show`
- `git stash` / `git stash pop`
- `git bisect`

