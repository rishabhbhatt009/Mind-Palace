# Environment Setup 

### 1. Creating User and User-Groups 
1. `sudo adduser username`
2. `sudo groupadd groupname`
3. `sudo usermod -a -G groupname username`

### 2. Install Miniconda
1. Download miniconda version for Linux : `wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`
2. Verify the integrity of the downloaded file (optional) : `sha256sum Miniconda3-latest-Linux-x86_64.sh`
3. Make the file executable : `chmod +x Miniconda*.sh`
4. Run the installation script `sudo ./Miniconda*.sh` , set path to `/opt/miniconda3`
5. Add the Miniconda directory to the system PATH environment variable : `echo 'export PATH="/opt/miniconda3/bin:$PATH"' | sudo tee /etc/profile.d/miniconda3.sh`
6. Make the changes to the PATH variable effective : `source /etc/profile.d/miniconda3.sh` 
7. Add line to `.bashrc` to run automatically on startup
8. sometime you have to do : `conda init`
10. **Test** : `conda --version` *(Restart before testing)* 
11. **Path** : `echo $CONDA_PREFIX` / `which conda`
9. To **setup for multiple users** : 
	1. Set installation path to `/opt/miniconda3`
	2. make the Miniconda installation directory accessible to the user group : 
		1. `sudo chgrp -R groupname /opt/miniconda3` 
		2. `sudo chmod -R g+rwX /opt/miniconda3`

### 3. Install AWS CLI 
1. `pip install 'awscli>=1.18.187,<2.0'`
2. To **setup for multiple users** : if miniconda installation for multiple users this should automatically be for multiple users

### 4. Install NodeJS and NPM
1. Update the package manager index : `sudo apt update`
2. Install the build-essential and curl packages : `sudo apt install build-essential curl`
3. Download the Node.js installation script : `curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -`
4. Install Node.js and npm : `sudo apt-get install -y nodejs`
5. **Test installation** : `node -v` and `npm -v`
6. To **setup for multiple users** :
	1. Change the owner of the Node.js installation directory to the user group : `sudo chown -R root:<group name> /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share /usr/local/share/doc /usr/local/share/man/man1`
	2. Grant read, write, and execute permissions to the user group on the Node.js installation directory and its subdirectories by running the following command : `sudo chmod -R g+rwX /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share /usr/local/share/doc /usr/local/share/man/man1`

### 5. ASK CLI :
1. `sudo npm install -g ask-cli@">=1.7.0 <2.0.0"`
2. To **setup for multiple users** :
	1. ask should be available to all users if node js was
	2. `sudo chown -R root:<user group> /usr/local/lib/node_modules/ask-cli` 
	3. `sudo chmod -R g+rwX /usr/local/lib/node_modules/ask-cli`

### 6. AWS CDK Toolkit 
1. `sudo npm install -g aws-cdk@2.41.0`
2. To **setup for multiple users** :
	1. should be available to all users if node js was
	2. `sudo chown -R root:root /usr/local/lib/node_modules/aws-cdk` 
	3. `sudo chmod -R g+rwX /usr/local/lib/node_modules/aws-cdk`

---

Message : 
You guys now have your users ready in the dev-gpu instance :  
- access using the command :  `ssh -i <PATH TO PRIVATE KEY> <USER-NAME>@ec2-34-230-6-99.compute-1.amazonaws.com`
	- replace `<PATH TO PRIVATE KEY>` with path to your private key on your system example : `~/.ssh/rsa_key`
	- replace `<USER-NAME>` with you user name (shared on DM)
- run : `groups` to check they belong to `evoquer` group
- run : `conda activate cobot` to activate python environment  / or create a new user specific environment
- run command to verify system requirements for cobot : `bash <(curl -H "x-api-key:rRiCFn1bFQ5Qa2tLqgypS2lMuGsAum4u4dkoZths" -s https://olbp4j9ali.execute-api.us-east-1.amazonaws.com/prod/)`
- follow the steps in [https://mainline.d1rg0zke5cd0dg.amplifyapp.com/doc/htm/getting_started.html](https://mainline.d1rg0zke5cd0dg.amplifyapp.com/doc/htm/getting_started.html) to setup cobot directory and configure aws

---
