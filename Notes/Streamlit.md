# Streamlit

Creating quick web-application for dashboarding data to stakeholders. 

---
Creating an application 

- Configuring a page
- Adding elements 
- Basic Concepts : 
	- Pages
	- Grids 
	- Widgets 

---
- How do we deploy ? 
	- Where : Heroku, AWS, Railway 
	- Authentication 
	- Cost

- Adding Authentication Layer 

---
Resources :
- Streamlit : [Documentation](https://docs.streamlit.io/) | [Gallery](https://streamlit.io/gallery) | [3rd party components](https://streamlit.io/components ) | [RoadMap](https://roadmap.streamlit.app/) | [Cheat Sheet](https://cheat-sheet.streamlit.app/) | [30-days-of-streamlit](https://blog.streamlit.io/30-days-of-streamlit/)

---
Documentation : link

```python 
import streamlit as st

st.configpage()

st.header()
st.subheader()
st.markdown()

st.write()

st.dataframe()
st.table()

col1, col2 = st.column([1,1])
with col1 :
	# code 
with col2 : 
	# code
```