# Streamlit
[Streamlit-Code-Snips](Streamlit-Code-Snips.md)

**Fast prototyping** of web-application for data dashboarding / projects demos

---
Main Concepts 

- Elements (for output) : Text, Data, Chart, Media, Chat, Status  
- Widgets (for inputs) 
- Layouts : Sidebar, Columns, Tabs, Expander, Container
- **Control Flow**
- Multi Page Application
- Utilities : Project Structure, Pages, Page Configuration

- Performance : 
	- Caching (`@chace_data`, `@cahce_resource`) 
	- Session State : **persisting data** across pages 
	- This about how long you want to information to persist, and where you want to access it.
	- Where is session v/s  cache data stored 

- Components : 3rd part libraries used as Streamlit extension 
	- https://echarts.apache.org/en/index.html
	- Developer Tools : Site analytics 
	- Authentication : [Streamlit-Authenticator](https://github.com/mkhorasani/Streamlit-Authenticator) 


---
Practical Concepts  

- How do we adding an Authentication Layer 
- How do we deploy ? 
	- Where : Heroku, AWS, Railway 
	- Authentication 
	- Cost

---
Project Structure 

```bash 
Project_Dir 
- data				# load and store local data
- docs				# documentation 
- pages 			# multi pages for the application 
	- page1.py 
	- page2.py
	- page3.py
- util
	- __init__.py
	- data_prcessing.py # load and process data
	- data_viz.py
	- views.py 
- app.py 			# entry point for the stramlit app (main page)
- launch.sh
```

---
Resources :

Streamlit : [Documentation](https://docs.streamlit.io/) | [Gallery](https://streamlit.io/gallery) | [3rd party components](https://streamlit.io/components ) | [RoadMap](https://roadmap.streamlit.app/) | [Cheat Sheet](https://cheat-sheet.streamlit.app/) | [30-days-of-streamlit](https://blog.streamlit.io/30-days-of-streamlit/)

---
