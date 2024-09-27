Airport Challenge
=================

As the Friday "solo challenge" of Week 3 at Makers Academy, we have been asked to:

```
Write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  
````
````
Using a TDD (test-driven development) approach, create a set of classes/modules to satisfy all of the user stories. 
````

Tech / code languages
---------
* Ruby
* RSpec for testing
* Rubocop for code improvements


User stories, tables and Domain Model
-------

(See User_stories.MD)

User stories, nouns and verbs. Objects and messages, classes and methods.

Plane class. Airport class.


TDD approach
-----
Followed the steps of writing a failing test, writing code to pass, then refactor (if needed). This approach helped me to get high% code coverage. 


Partial Solution
-------

Next steps would be:

* Work on dependencies between Plane and Airport classes. I would like to use the Plane objects to access plane methods, while completing these methods at an Airport object. For example, plane.land - needs to check on if the airport is full, what is the weather like? 

* If planes have a location attribute of sky or airport, this needs to be changed when the plane lands or takes off. 
* weather conditions
* randomiser for weather
* IDs for each airport 

