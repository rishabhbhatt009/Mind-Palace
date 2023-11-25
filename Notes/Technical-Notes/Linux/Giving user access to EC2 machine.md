1. Make User 
2. Log in to the EC2 machine using their existing credentials (e.g., username and password).
3. Create a directory called ".ssh" in their home directory if it doesn't already exist: `mkdir ~/.ssh`
4. Create a file called "authorized_keys" in the ".ssh" directory if it doesn't already exist: `touch ~/.ssh/authorized_keys`
5. Open the "authorized_keys" file in a text editor: `nano ~/.ssh/authorized_keys` 
6. Copy and paste the contents of the .pub key that you shared with them into the "authorized_keys" file.
7. Save and close the "authorized_keys" file
8. `chmod 400 mykey.pem`
9. add `export PATH="/opt/miniconda3/bin:$PATH"` to `.bashrc`
10. `source ~/.bashrc`

Message : 
You guys now have your users ready in the dev-gpu instance :  
- access using the command :  `ssh -i <PATH TO PRIVATE KEY> <USER-NAME>@ec2-34-230-6-99.compute-1.amazonaws.com`
	- replace `<PATH TO PRIVATE KEY>` with path to your private key on your system example : `~/.ssh/rsa_key`
	- replace `<USER-NAME>` with you user name (shared on DM)
- run : `groups` to check they belong to `evoquer` group
- run : `conda activate cobot` to activate python environment  / or create a new user specific environment
- run command to verify system requirements for cobot : `bash <(curl -H "x-api-key:rRiCFn1bFQ5Qa2tLqgypS2lMuGsAum4u4dkoZths" -s https://olbp4j9ali.execute-api.us-east-1.amazonaws.com/prod/)`
- follow the steps in [https://mainline.d1rg0zke5cd0dg.amplifyapp.com/doc/htm/getting_started.html](https://mainline.d1rg0zke5cd0dg.amplifyapp.com/doc/htm/getting_started.html) to setup cobot directory and configure aws

