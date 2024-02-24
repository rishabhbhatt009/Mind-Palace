# Test Driven Development 

## Material to cover : 
- [TDD Full Course (Learn Test Driven Development with Python)](https://www.youtube.com/watch?v=eAPmXQ0dC7Q&ab_channel=WesDoyle) | Builds a web app using test driven dev 
- [Automated Testing in Python with pytest, tox, and GitHub Actions](https://www.youtube.com/watch?v=DhUpxWjOhME&ab_channel=mCoding)
- [Unit Test Python Playlist](https://www.youtube.com/watch?v=_QtM7QGuj1A&list=PLS1QulWo1RIaNFUz4zrztWlCJgkpXht-H&ab_channel=ProgrammingKnowledge)
- [Testing Python for Beginners | Google IT Automation with Python Certificate](https://www.youtube.com/watch?v=x_N4qAFsCrs&ab_channel=GoogleCareerCertificates)

<hr>

## Different types of testing 
- unit test 
- integration test
- E2E (End to End) test 

<hr>

## Testing in Python 

- pyTest for testing 

```python 
import unittest 

class TestingFuncA (unittest.TestCase):

    def testing_for_positive_numbers(self, a,b):
        pass

    def testing_for_negative_numbers(self, a,b):
        pass

    def testing_for_zero(self, 0):
        pass

```