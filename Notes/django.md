# Web-Development Framework (Django)

## Table Of Content <!-- omit from toc -->
- [Why Django was **created** ?](#why-django-was-created-)
- [Fundamentals of Web Development](#fundamentals-of-web-development)
- [Fundamentals of Django](#fundamentals-of-django)
- [Environment Setup and Debugging](#environment-setup-and-debugging)
- [Django Project](#django-project)
  - [Create new project](#create-new-project)
  - [Running the server](#running-the-server)
  - [Creating new application](#creating-new-application)
  - [Views](#views)
  - [Mapping URLs to view functions](#mapping-urls-to-view-functions)
  - [Templates](#templates)
- [Data Models](#data-models)
  - [Building a Data-Model](#building-a-data-model)
  - [Data Model Organization](#data-model-organization)
- [Object Relational Manager (ORM)](#object-relational-manager-orm)

<hr>

## Why Django was **created** ? 

- Django is a web development framework 
- [Web App Architecture](https://www.youtube.com/watch?v=sDlCSIDwpDs&ab_channel=ForrestKnight) 
- [Backend Dev Overview](https://www.youtube.com/watch?v=XBu54nfzxAQ&list=LL&index=1&ab_channel=SuperSimpleDev)

## Fundamentals of Web Development

- There are 2 sides :
  - **Frontend** : 
    - loaded in a web browser on client machine 
    - responsible for how a user sees and interacts a web page 
  - **Backend** : 
    - runs on the web server  
    - responsible for data processing and validating business rules 

- URL - Uniform Resource Locator  
- HTTP (Hypertext Transfer) Protocol 
  - how clients and servers can communicate
  - [Client] --- http Request --> [Server] 
  - [Client] <-- http Response -- [Server]
- HTTPS (Hypertext Transfer **Secure**) Protocol
  - HTTPS uses TLS (or SSL) to encrypt HTTP requests and responses
- HTML (Hypertext Markup Language) 
  - Language to represent web pages and its content

- Two options :
  1. The server generates the web page and returns an HTML document 
  2. The server generates returns the data which the client machine uses to generate the web page 

- options-2 considered **INDUSTRY BEST PRACTICE** : 
  - Option 2 pushes the responsibility of generating HTML to the client 
  - this frees up server and allows it to handle more clients (making the application scalable)
  - therefore, server becomes gateway to data (through **end-point**) ~ server becomes an **API**

- Client Side Tools : REACT, ANGULAR, VUE
- Server Side Tools : DJANGO (Python), ASP.NET CORE (C#), EXPRESS (JS)

<hr>

## Fundamentals of Django

- Open source framework for building web application with Python
- Others : Flask 
- **Batteries Included Framework** : Comes with a lot of features out of the box
- Some Django Features :
  - Admin Site 
  - Object-relational mapper (ORM)
  - Authentication
  - Caching

<hr>

## Environment Setup and Debugging 
- python (latest)
- create a virtual environment
- install dependencies 
  - django 
- Debugging Django application
  - Using VSCode 
    - create a launch profile 
    - select `django` default config
    - add breakpoints and debug
  - Using [django debug toolbar](https://django-debug-toolbar.readthedocs.io/en/latest/)

<hr>

## Django Project 

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
- add to list of installed apps in `settings.py`

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
- HTML can have variables ~ `{{var_name}}` and conditions 

<hr>

## Data Models 

### Building a Data-Model

#### Entities 
- entities created as `Model` classes and inherit `models.Model`
- entities have **attributes** which we call **fields** 
- there are multiple [field types](https://docs.djangoproject.com/en/4.2/ref/models/fields/#model-field-types)
- each field type has options (common to all types) and additional options (specific to individual type)
  
What happens to Primary Key ? 
- Django creates an `id` field automatically 
- This becomes the primary key unless one is specified explicitly 

#### Relationships 
- relationship exists between entities (parent <--- child)
- parent should be defined before a child can inherit it
- Sometime the relationship between 2 entities have attributes which are represented as **association class**
- However we can replace this with an additional entity 

- Types of relationships :
  - 1-1
    - `field_name = models.OneToOneField(to = parent_class, on_delete = ... , primary_key = True)`
  - 1-many 
    - `field_name = models.ForeignField(to = parent_class, on_delete = ...)`
  - many-many 
    - `field_name = models.ManyToManyField(to = parent_class, on_delete = ...)`

- Extra Notes : 
  - django automatically creates reverse relationships by adding a field called `name_set` in the other class
    - we can be changed by setting the `related_name` parameter 
    - we can also omit the reverse relationship by setting `related_name='+'`
  - Sometimes we can not order classes in a way such that the parent class comes before the child class (**CIRCULAR DEPENDENCIES**)
    - we use `'class_name'` for such situations 
    - caveat : if we change the name of the class the name inside `''` does not get updated 
  - what happens to children when a parent is deleted ?
    - `on_delete` attribute is specified 
    - it defines what happens to children when a parent gets deleted 
    - `CASCADE`, `DEFAULT`, `PROTECT`, `NULL`
  - users can be defined from `from django.contrib.auth.models import User`


#### **Generic Relationships** :
  - relationships across apps 
  - Method 1 : 
    - by `importing` classes from app module 
    - problem : will have to import multiple classes for all over the project, which creates dependencies  
  - Method 2 :
    - using `ContentType`
    - we need type and id to identify any object in our application
    - we may also need the object

      ```python
      from django.contrib.contenttypes.models import ContentType
      from django.contrib.contenttypes.fields import GenericForeignKey
      
      # Method 2 :
      content_type = models.ForeignKey(to=ContentType, on_delete=models.CASCADE)
      object_id = models.PositiveIntegerField()
      content_object = GenericForeignKey()
      ```
    - limitation : we have to know the type of the primary key

### Data Model Organization 
- A django project is divided into a number of apps. 
- Each app handles a some specific functionality and has its own data model.  

#### Design philosophy :
1. Monolith 
   - put everything into 1 app 
   - we don't have to worry about dependencies
   - it will eventually become bloated
   - problem : 
     - difficult to understand
     - difficult to maintain
     - difficult to debug and reuse

2. UNIX Philosophy 
   - each app handles 1 functionality really well 
   - problem : 
     - dependencies or coupling 

#### What is a good design ? 
A good design finds middle-ground b/w monolith and unix.  
- each app should be self-contained 
- each app should handle 1 functionality 
- Zero coupling ~ independently change and deploy them without changing other apps 

Therefore a good design has **minimum coupling** and **high cohesion (focus)**.

<hr>

## Migrations 

- Making migration files : `python manage.py makemigrations` (new migration created every time a feature is added- similar to commit in VCS like git)
- 

## Object Relational Manager (ORM)
