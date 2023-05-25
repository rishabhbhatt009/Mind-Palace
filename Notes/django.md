# Web-Development Framework (Django)

## Table Of Content <!-- omit from toc -->
- [Fundamentals](#fundamentals)
  - [Fundamentals of Web Development :](#fundamentals-of-web-development-)
  - [Fundamentals of Django :](#fundamentals-of-django-)
- [Environment Setup](#environment-setup)
- [Debugging Django app in VSCode](#debugging-django-app-in-vscode)
- [Notes](#notes)
  - [Create new project](#create-new-project)
  - [Running the server](#running-the-server)
  - [Creating new application](#creating-new-application)
  - [Views](#views)
  - [Mapping URLs to view functions](#mapping-urls-to-view-functions)
  - [Templates](#templates)
  - [](#)

<hr>

## Fundamentals

### Fundamentals of Web Development :

- There are 2 sides :
  - **Frontend** : 
    - loaded in a web browser on client machine 
    - responsible for how a user sees and interacts a web page 
  - **Backend** : 
    - runs on the web server  
    - responsible for data processing and validating business rules 

- URL - Uniform Resource Locator  
- HTTP Protocol (how clients and servers can communicate)
  - [Client] --- http Request --> [Server] 
  - [Client] <-- http Response -- [Server]
- HTML : Language to represent web pages and its content

- Two options :
  1. The server generates the web page and returns an HTML document 
  2. The server generates returns the data which the client machine uses to generate the web page 

- options-2 considered **INDUSTRY BEST PRACTICE** : 
  - Option 2 pushes the responsibility of generating HTML to the client 
  - this frees up server and allows it to handle more clients (making the application scalable)
  - therefore, server becomes gateway to data (through **end-point**) ~ server becomes an **API**

- Client Side Tools : REACT, ANGULAR, VUE
- Server Side Tools : DJANGO (Python), ASP.NET CORE (C#), EXPRESS (JS)

### Fundamentals of Django :

- Open source framework for building web application with Python
- Others : Flask 
- **Batteries Included Framework** : Comes with a lot of features out of the box
- Some Django Features :
  - Admin Site 
  - Object-relational mapper (ORM)
  - Authentication
  - Caching

<hr>

## Environment Setup
- python (latest)
- create a virtual environment
- install dependencies 
  - django 

## Debugging Django app in VSCode 
- create a launch profile 
- select `django` default config
- add breakpoints and debug

<hr>

## Notes

### Create new project 
- `django-admin` : list subcommands 
- `django-admin startproject <project-name> <location>` 
- Once the project folder is setup you will have `manage.py` which you can use instead of `django-admin`
- `python manage.py <subcommand>` ~ `django-admin <subcommand>`
- A django project is a collection of apps, each app provides certain functionality :
    
    ```python 
    INSTALLED_APPS = [
        "django.contrib.admin", # managing admin interface
        "django.contrib.auth", # authentication functionality 
        "django.contrib.contenttypes",
        "django.contrib.sessions", # legacy not use
        "django.contrib.messages",
        "django.contrib.staticfiles", # serving static files 
        "new-app" # registering new app to the list of apps 
        ...
        ...
        ...
    ]
    ```
### Running the server 
- Running the server using `python manage.py runserver`

### Creating new application
- Create new app : `python manage.py startapp <name>`

### Views 
- Views are **request handler** 
- This implies that a view function takes in a request and response
- Create a view function

### Mapping URLs to view functions
- `path` maps route -> functions 
- we add `paths` to `urlpatterns`
- Add urls patterns to app  

    ```python
    ### URL Config
    urlpatterns = [
        path('hello/', views.hello)
    ]
    ```

- Modify the urls patterns in the main project, this add app-name prefix to urls

    ```python 
    urlpatterns = [
        path("admin/", admin.site.urls),
        path('playground/', include('playground.urls'))
    ]
    ```

### Templates 
- we use template to return HTML content to client
- HTML can have variables ~ `{{var_name}}` and conditions `{% if %} {% else %} {% endif %}`

###