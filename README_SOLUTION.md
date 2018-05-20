Airport Challenge - Solution
============================

Working with a set of 6 user stories to write test driven  software for the control of planes at an airport. Requirements are based on planes only being able to land and take off when the weather is sunny.

### Approach to solving the challenge:
Starting with each user story, I have drawn out the objects and the behaviour that is relevant to building the feature and create a domain model on pen and paper:

(Insert picture of a domain model)

From the domain model, I have written a feature.rb file to write the desired software behaviour as a feature test - writing the lines of code that I envisage solving this particular issue for the user story.

Once I've received the predicted our come I took the lines of feature test code and reworked into a Rspec unit test.

Then use the red, green, refactor process to iterate on the tests and build the code base. Working to have 100% test coverage and all tests passing. 

### Status at point of push:


### Description of what code does:
#### Domain Model:
 <-- working? --> true/false

DockingStation <-- release_bike --> a Bike

### Build Status:
(Example with the Travis testing buttons.)

### Code Style:
Standard. Ran Rubocop before each commit it avoid recording any style errors.

### Tech/Framework used
Built in Ruby with Rspec test driven development.

### Features:
(What makes the project stand out?)

### Code Example:
(Brief example that shows how the project solves someones problem.)

### How to install the code:
Innit Rspec.
Run ```bundle```.

### How to use the code:
(If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.)

### How to run the tests:
Tests are broken out by class under test and are to be run with Rspec.

### Contribute:
Fork this repo and make a copy. Pull requests with updates are welcome.

### Credits:
This challenge was developed by Makers Academy for week one of the 12 week bootcamp course.
