# pipenv

Documentation : [link](https://pipenv.pypa.io/en/latest)

---

```bash 
pipenv --python VERSION # create a virtual environment 
pipenv shell 			# start virtual environment (cd path/to/your/project)
pipenv --venv 			# determine the venv path

pipenv install PACKAGE 	# install specific package
pipenv install PACKAGE --dev 
pipenv install PACKAGE --production
# Note : install packages + modify Pipfile and PipFile.lock
pipenv install 			# install dependencies from Pipfile.lock
# Note : install packages (does not modify Pipfile and PipFile.lock)
pipenv sync				# install dependencies from Pipfile.lock

pipenv --rm				# remove virtual environment (cd path/to/your/project)
rm Pipfile Pipfile.lock	# remove Pipfiles 

pipenv uninstall 		# uninstall dependencies 
# --all 	: purge all files from venv, but leave the Pipfile untouched.
# --all-dev : remove all of the development packages from venv and Pipfile

###############################################################################
# Virtual Environment Location 
# 1. DEFAULT GLOBAL LOCAITON 
# 2. CUSTOM GLOBAL LOCATION
export WORKON_HOME=~/.venvs 	# set environment variable
# 3. CREATE .venv IN PROJECT DIR
PIPENV_VENV_IN_PROJECT=1 		# set environment variable
###############################################################################

```

---

Note on the `Pipfile` and the Pipfile.lock
1. `Pipfile` :
	- human readable
	- managed by the developers invoking pipenv commands
2. `Pipfile.lock` :
	- replaces the requirements.txt file
	- managed automatically through locking actions.
Note : add both `Pipfile` and `Pipfile.lock` to the project’s source control

---