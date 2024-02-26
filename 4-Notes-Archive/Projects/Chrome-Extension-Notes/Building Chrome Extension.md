# Building Chrome Extension 
---

Building chrome extensions can be valuable. They are useful when browsing. 

What I aim to achieve at the end of this ?  
- [x] start 
- [x] new technology 
- [x] rapid prototyping 


----
Technologies : HTML, CSS, JS 


---
## File template for extension : 

1. The manifest : 
	- required file that **must** have a specific file name and path (root dir)
	- actions, permissions, icons 

2. The service worker : 
	- handles and listens for browser events
	- can use all the Chrome APIs
	- cannot interact directly with the content of web pages

3. Content scripts :
	- execute Javascript in the context of a web page. 
	- they can also read and modify the [DOM](https://developer.mozilla.org/docs/Web/API/Document_Object_Model) of the pages they're injected into

4. The popup and other pages


---
## Resources : 

- [Chrome Developer Docs](https://developer.chrome.com/docs/extensions/) 
- [Publish in the Chrome Web Store](https://developer.chrome.com/docs/webstore/publish/)


---
## Extension 1 : URL Logger 

**Problem Statement** : Create a working extension that has the following functionalities 
1. [x] gets urls from all open tabs in active window and save them as a txt file, 
2. [x] extended feature : open all urls from a text file 
3. [x] extended feature : group and ungroup tabs based on domain name 

Learning : 
- rapid proto typing (within 2 hours)
- using web development tech : JS, HTML, CSS 
- what are `asyn` functions in JS

---
#projects #web-development