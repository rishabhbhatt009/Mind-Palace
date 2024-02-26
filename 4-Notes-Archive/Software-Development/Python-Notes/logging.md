# Logging 

---
- Logging provides a set of convenience functions for simple logging usage (persistent)
- Logs have **level/severity**
- **Custom Logger** : 
	- Handler : `FileHandler`, `StreamHandler`
	- Formatter
- Attaching logging services for analysis 

---
```python 
import logging

###############################################################################
# Basic logger 
###############################################################################
# Config runs only once 
logging.basicConfig(
	level=logging.INFO, # level to print store 
	filename='test.log',
	filemode='',
	# s (type) = string 
	format='%(asctime)s - %(levelname)s - %(name)s | %(message)s' 
)

###############################################################################
# Custom Logger 
###############################################################################
logger = logging.getLogger(__name__)
handler = logging.FileHandler('test.log')
formatter = logging.Formatter(format)

logger.setLevel(logging.INFO)
handler.setFormatter(formatter)
logger.addHandler(handler) # can add multiple handler with diff config

###############################################################################
# Actual Loggging (use legger for custom logger)
###############################################################################
logging.debug()
logging.info()
logging.warning()
logging.exception() # gives the trace back 
logging.error(message, exc_info=True) # gives the trace back 
```


---
Resource : 
- https://docs.python.org/3/howto/logging.html
- https://www.youtube.com/watch?v=pxuXaaT1u3k&ab_channel=ArjanCodes
- https://www.youtube.com/watch?v=urrfJgHwIJA&ab_channel=TechWithTim

---