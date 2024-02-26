# Shell Scripting

```bash
#!/bin/bash 

# This is a comment 
echo "Hello, World!"
mkdir test
echo "Directory created"
```

Steps : 
- Create a shell script : `myscript.sh`
- Make the Script Executable : `chmod +x myscript.sh`
- Run : `./myscript.sh`

**Note** : The first line, `#!/bin/bash`, is called the **shebang**/**hashbang**. It tells the system that this script should be run with `/bin/bash`, the Bash shell. 

---

Example of Shebang Lines:
- For Bash scripts: `#!/bin/bash`
- For Python scripts: `#!/usr/bin/env python3`
- For Perl scripts: `#!/usr/bin/perl`

Importance of shebang: 
- **Interpreter Directive** : This is crucial because different scripts can be written for different shells or scripting languages (such as Bash, Python, Perl, etc.), and the shebang line ensures that the correct interpreter is used, regardless of the shell from which the script is invoked.
- **Script Portability** : Including a shebang line makes the script more portable. Without it, users would have to know which interpreter to use and invoke the script with that interpreter explicitly (e.g., `bash script.sh` or `python script.py`). With the shebang, the script can be executed directly (`./script.sh`), making it easier to use and distribute.

---