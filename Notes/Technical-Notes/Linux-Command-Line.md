# Linux-Command-Line

- Linux is open source
- Linux distribution (distro) : Ubuntu, Debian, Alpine

---

```bash 
###############################################################################
# Managing Packages : 
###############################################################################
apt update 
apt list 
apt install nano
apt remove nano

```

---

```bash
###############################################################################
# Navigating the file system : 
###############################################################################
pwd 			# print the working directory
ls 				# list the files and directories
ls -l 			# to print a long list 
cd / 			# to go to the root directory
cd bin 			# to go to the bin directory
cd .. 			# to go one level up
cd ~ 			# to go to the home directory

###############################################################################
# Manipulating files and directories
###############################################################################
mkdir test 				# to create the test directory
mv test docker 			# to rename a directory 
touch file.txt 			# to create file.txt
mv file.txt hello.txt 	# to rename a file 
rm hello.txt 			# to remove a file 
rm -r docker 			# to recursively remove a directory

###############################################################################
# Editing and viewing files
###############################################################################
nano file.txt 			# to edit file.txt
cat file.txt 			# to view file.txt
less file.txt 			# to view with scrolling capabilities
head file.txt 			# to view the first 10 lines
head -n 5 file.txt 		# to view the first 5 lines 
tail file.txt 			# to view the last 10 lines 
tail -n 5 file.txt 		# to view the last 5 lines


###############################################################################
# Searching for text
# - grep : global regular expression print 
###############################################################################

grep hello file.txt 		# to search for hello in file.txt
grep -i hello file.txt 		# case-insensitive search 
grep -i hello file*.txt 	# to search in files with a pattern
grep -i -r hello . 			# to search in the current directory

###############################################################################
# Finding files and directories
###############################################################################
find 				# to list all files and directories
find -type d 		# to list directories only
find -type f 		# to list files only
find -name “f*” 	# to filter by name using a pattern

###############################################################################
# Managing environment variables
###############################################################################
printenv 			# to list all variables and their value
printenv PATH 		# to view the value of PATH
echo $PATH 			# to view the value of PATH
export name=bob 	# to set a variable in the current session

# Note : to set it permanently 
nano ~/.bashrc		# Step 1 : edit ~/.bashrc / ~/.bash_profile
export name=bob		# Step 2 : set variable 
source ~/.bashrc	# Step 3 : reload  

###############################################################################
# Managing processes
###############################################################################
ps 			# to list the running processes
kill 37		# to kill the process with ID 37

```

---

```bash 
###############################################################################
# Chaining commands
###############################################################################
# - Chaining cmd 			: ; 
# - Conditional 			: && || 
# - Pipe 					: |
# - xargs 					: cmd1 | xargs cmd2
# - $() 					: cmd1 $(cmd2)

###############################################################################
# Redirecting 
###############################################################################
# - Redirection 			: > 
# - Redirection with append : >> 

```

---

```bash
###############################################################################
# Managing users and groups
###############################################################################

# Users 
useradd -m john 		# (low level) to create a user with a home directory
adduser john 			# (high level) to add a user interactively
usermod					# to modify a user
userdel					# (low level) to delete a user
deluser					# (high level) to delete a user

su 						# switch user 
logout 					# signout 
cat /etc/passwd 		# view all users 
cat /etc/group 			# view all groups 

# Groups 
# - primary and secondary group 

groupadd devs	 		# to create a group 
groups john 			# to view the groups for john
groupmod 				# to modify a group
groupdel devs			# to delete a group

usermod -a -G groupname username # add user to group
usermod -G groupname -d username # remove user from group
getent group # list groups 
cat /etc/group | grep john # groups for john 
getent passwd | cut -d : -f 1 | xargs groups # list users with groups 

```

---

```bash 
###############################################################################
#### File permissions
# How they look like (ls- l) and what they mean ? 
# - drwxr-xr-x 				=> directory [read write exec] * 3
# - [read write exec] * 3 	=> 1. user, 2. group and 3. everyone-else
###############################################################################

chmod u+x deploy.sh		# give the owning user execute permission
chmod g+x deploy.sh		# give the owning group execute permission
chmod o+x deploy.sh		# give everyone else execute permission
chmod ug+x deploy.sh 	# to give the owning user and group execute permission
chmod ug-x deploy.sh 	# to remove the exec. permission from the owning user & group

###############################################################################
```

---
Functionality 

```bash 
###############################################################################
# Un-zip .tgz file
# - `x` for extract
# - `v` for verbose
# - `z` for gnuzip
# - `f` for file, should come at last just before file name.
###############################################################################

tar -xvzf /path/to/yourfile.tgz -C /path/where/to/extract/

```

---
Resources 
- Linux Users and Groups : [Linux Users and Groups | YT](https://www.youtube.com/watch?v=b-9j2jiCOEA&ab_channel=Linode)

---
