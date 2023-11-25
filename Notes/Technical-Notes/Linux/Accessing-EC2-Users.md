Accessing EC2 :
- `ssh -i /path/to/private_key.pem ec2-user@public_ip_or_dns_name`

Replace `/path/to/private_key.pem` with the actual path to your private key file, `ec2-user` with the appropriate username for your EC2 instance's operating system (for Amazon Linux, this is the default username), and `public_ip_or_dns_name` with the actual public IP address or DNS name of your EC2 instance.


### Giving people access to EC2 user : 
- Create user : 
	- `sudo adduser <username>`
	- `sudo passwd <username>`
- Add SSH Key : 
	- `sudo mkdir /home/<username>/.ssh `
	- `sudo touch /home/<username>/.ssh/authorized_keys`
- Set ownership and permissions for the authorized keys file : 
	- `sudo chown -R <username>:<username> /home/<username>/.ssh `
	- `sudo chmod 700 /home/<username>/.ssh `
	- `sudo chmod 600 /home/<username>/.ssh/authorized_keys`