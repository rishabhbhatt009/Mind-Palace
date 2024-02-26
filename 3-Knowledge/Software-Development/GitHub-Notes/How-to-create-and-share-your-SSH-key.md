# How to create and share your SSH key

- SSH = Secure Shell Protocol (SSH),
- SSH keys used to authenticate user for GitHub or online software or work network
- we use keygen to generate a {public key, private key} pair 
- only share/copy the public key to the server 

### Steps (Linux)
- open terminal 
- cd `.ssh` under home user directory 
- command to generate key : `ssh-keygen -t rsa -C 'label-name'` 
	- `rsa` | `ed25519` = algorithm
	- ==do not overwrite keys==
- enter file name 
- enter passphrase 
- two pairs are created :
	- `file-name` = private key
	- `file-name.pub` = public key 
- copy and share the `.pub` content only 


### Resources : 
- [Creating and finding SSH Key | YouTube](https://www.youtube.com/watch?v=NX_IQrQA1FE&ab_channel=EricCavazos)
- [SSH Key | GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [How to use SSH Public Key authentication](https://www.youtube.com/watch?v=du-nWMCRkqE&ab_channel=AverageLinuxUser) : Good info
- [Website](https://www.ssh.com/academy/ssh/keygen) : Good algo info

