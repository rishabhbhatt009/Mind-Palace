# Linux-Command-Line

- Linux is free 
- different Linux distribution : Ubuntu, Debian, Alpine

## Command Database

### Linux Users and Groups
Resource : [Linux Users and Groups | YT](https://www.youtube.com/watch?v=b-9j2jiCOEA&ab_channel=Linode)

- #### USERS
	- **VIEW USERS ON SYSTEM** : 
		- command : `cat /etc/passwd`
		- with details/groups : `getent passwd | cut -d : -f 1 | xargs groups`
	- **ADD USER** : 
		- command : `adduser <user-name>`
		- add password 
		- add details
	- **SIGN-IN TO A USER**
	- **SIGN-OUT FROM USER**
		- command : `logout` 
		- note : might prompt to sign-out from a user
	- **DELETE USER**
		- command : `deluser <user-name>`
	- **CHANGE USER PASSWORD**
		- command : `passwd <user-name>`
	- **SWITCH USER**
		- command : `su <user-name>`
		- enter password 

- #### USER GROUPS
	- **CREATE USER GROUP**
		-  command : `sudo groupadd groupname`
	- **DELETE USER GROUP**
		- command : `sudo groupdel <group_name>`
	- **ADD USER TO USER GROUP**
		- command : `sudo usermod -a -G groupname username`
	- **REMOVE USER FROM USER GROUP**
		- command : `sudo usermod -G <group_name> -d <user_name>`
	- **LIST USER GROUPS** : `getent group`
	- 

- #### FUNCTIONALITY
	- **UNZIP** `.tgz` : 
		- command : `tar -xvzf /path/to/yourfile.tgz -C /path/where/to/extract/` 
		- flags : 
			-   `x` for extract
			-   `v` for verbose
			-   `z` for gnuzip
			-   `f` for file, should come at last just before file name.
		- 