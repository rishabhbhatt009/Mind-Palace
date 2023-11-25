# Transferring Files b/w Local and EC2
Resource : [Link](https://asf.alaska.edu/how-to/data-recipes/moving-files-into-and-out-of-an-aws-ec2-instance-windows/)


### Command :
- `scp -i /path/to/private_key.pem /path/to/public_key.pub ec2-user@public_ip_or_dns_name:/home/ec2-user/.ssh/authorized_keys`

- **Upload :** `scp -i <key> <local_file_path> <public ip> : <destination_folder>`
- **Download :** `scp -i <key> <public ip> : <remote file> <local_destination_folder> `



 
### Software : WinSCP
