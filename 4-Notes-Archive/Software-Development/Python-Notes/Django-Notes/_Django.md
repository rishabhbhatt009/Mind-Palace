# Django 

Web Development Framework 

----
Course 1 : 

Model-View-Controller (MVC) -> Model-Template-View (**MTV**) + Controller 
Web Application Development : [Django](https://www.djangoproject.com/), Django ORM, CRUD Operations
packaging and virtual env : [pipenv](https://docs.pipenv.org/basics/#environment-management-with-pipenv) 
Debugging : django-debug-toolbar
HTTP Response Status : [Http Status Codes](https://serpwatch.io/wp-content/uploads/2022/02/HTTP-Status-Codes-Cheat-Sheet.png)

---
Course 2 :

- Web API dev : DRF = [Django REST Framework](https://www.django-rest-framework.org/)
- REST API Concepts : 
	- Serializers : 
	- Views : ViewSets, django-filter  
	- Routers : drf-nested-routers
- Signals
- Authentication : Users, Groups and Permissions
- Securing API : [Djoser](https://djoser.readthedocs.io/en/latest/getting_started.html), JSON Web Tokens (JWT), [Simple JWT](https://django-rest-framework-simplejwt.readthedocs.io/en/latest/settings.html), https://jwt.io/

----
Course 3 : 

- Uploading Files API : [django-cors-headers](https://github.com/adamchainz/django-cors-headers), pillow
- Sending Email : requires SMTP server [smtp4dev](https://github.com/rnwood/smtp4dev)
- Background Task : 
	- Task Management : [Celery](https://docs.celeryq.dev/en/stable/getting-started/introduction.html)
	- Message Broker : Redis
	- Monitoring Task : [Flower](https://flower.readthedocs.io/en/latest/)
- Testing : 
	- Automated Testing : [pytest](https://docs.pytest.org/en/7.4.x/), [pytest-django](https://pytest-django.readthedocs.io/en/latest/), [model-bakery](https://model-bakery.readthedocs.io/en/latest/)
	- Continuous Testing : [pytest-watch](https://github.com/joeyespo/pytest-watch)
	- Performance Testing : [Locust](https://docs.locust.io/en/stable/)(Load Testing), [Silk](https://silk.readthedocs.io/en/latest/) (Profiling)
	- Stress Testing : Performance test where we find the max
- Caching : Redis, [django-redis](https://github.com/jazzband/django-redis)
- Production :
	- Collecting and serving static files
	- Logging : [python-logging](https://docs.python.org/3/library/logging.html#logrecord-attributes) 
	- Deployment : [Heroku](https://devcenter.heroku.com/articles/heroku-cli)(Hosting Service) 
		- Deploy using GitHub : [link](https://www.youtube.com/watch?v=CrcN_TYLqGM&ab_channel=CodeWithArjun)
		- Railway for hosting

----
Resources :
- [Python Django Explained In 8 Minutes](https://www.youtube.com/watch?v=0sMtoedWaf0&ab_channel=DennisIvy)
- [What is Django? | IBM](https://www.youtube.com/watch?v=t_p4ZyAYyaY&ab_channel=IBMTechnology) 
- [Understanding the MVC pattern in Django](https://medium.com/shecodeafrica/understanding-the-mvc-pattern-in-django-edda05b9f43f)
- [You need to learn how to dockerize a Django REST API. NOW! (Python, Docker, REST)](https://www.youtube.com/watch?v=newaz3DA6e4&ab_channel=JesseLeonard-CloudArchitect)
- https://django-news.com/
- https://learndjango.com/

---