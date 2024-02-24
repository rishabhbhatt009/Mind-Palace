# Managing remote development environment

---
### Accessing remote server

- `ssh` = **Secured Shell**
- Accessing EC2 : `ssh -i /path/to/private_key.pem ec2-user@public_ip_or_dns_name`
- Note : Replace `/path/to/private_key.pem` with the actual path to your private key file, `ec2-user` with the appropriate username for your EC2 instance's operating system, and `public_ip_or_dns_name` with the actual public IP address or DNS name of your EC2 instance.

---
### Transferring Files b/w Local and EC2
Resource : [Link](https://asf.alaska.edu/how-to/data-recipes/moving-files-into-and-out-of-an-aws-ec2-instance-windows/)

Using command line 
- `scp` =  **Secure Copy Protocol**, which is part of `ssh`  
- flags : `-i` to specify identity file (private key), `-r` to recursively copy the directory  
- **Upload :** `scp -i <key> <local_file_path> user@public_ip:<destination_folder>`
- **Download :** `scp -i <key> user@public_ip:<remote file> <local_destination_folder> `
- Copy directory : `scp -r -i ...`

Using software : 
- WinSCP

---
### Giving people access to EC2 user 

- Create user : 
	- `sudo adduser <username>`
	- `sudo passwd <username>`
- Login/switch to new user 
- Add SSH Key : 
	- `sudo mkdir /home/<username>/.ssh `
	- `sudo touch /home/<username>/.ssh/authorized_keys`
	- `authorized_keys` file in a text editor : `nano ~/.ssh/authorized_keys` 
	- Copy and paste the contents of the .pub key 
- Set ownership and permissions for the authorized keys file : 
	- `sudo chown -R <username>:<username> /home/<username>/.ssh `
	- `sudo chmod 700 /home/<username>/.ssh `
	- `sudo chmod 600 /home/<username>/.ssh/authorized_keys`

---
