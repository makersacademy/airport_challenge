Airport Challenge
=================

Overview
---------

This repo contains software which performs a number of basic functions of an air traffic controller. Many more were planned; unfortunately due to having to move house this weekend there was unavoidably much less time available to build these than would have been ideal. Nonetheless, a number of important functions are implemented:

* Airport and plane objects can be created
* Airports can land planes with the `.land` method, and instruct them to take off with the `.take_off` method.
* The weather is randomly stormy or fine, as dictated by the `.weather` method in the Airport class. 1/10 of the time it is stormy.
* If the weather is stormy, an error will be raised if trying to `land` or `take_off` a plane.

Testing
---------

A particular concern of mine with this challenge was for all development to be test-driven. All tests were written in advance of writing the corresponding code, and I strove to test in sufficient detail (including, for example, testing the initial creation of classes and methods). Mocks and doubles were used to control behaviour of the weather in tests that required fine or stormy weather.

Further features
---------
Ideally the controller would have a method to certify that a plane that had taken off was no longer in the airport (this would be fairly easy to implement by running the `.include?` method on the `@plane_array` variable with the plane as an argument- this functionality is contained in the test for the `take_off` method). Capacity of the airport could be held by an instance variable, created with an argument added to `Airport.new()` (and with a default set if no argument is given). A guard condition would then need adding to the `land` method. Functionality to prevent landed planes being told to `land` or flying planes being told to `take_off` could be added with a boolean `@flying` instance variable for each plane, and the relevant guard clauses being added to the airport methods (which would also need to interface with the plane object to change this variable when the plane is successfully landed or takes off).  


Coding experience
---------
Personally, I quite enjoyed this challenge and was sorry not to have enough time to complete it properly (thankfully moving house was a one-off event). It was not too difficult to approach and understand the concepts within, and it was good to practice using mocks and stubs to control behaviour relating to the weather. I was particularly keen to write in a test-driven manner, and found this helpfully focussed my attention on the expectations of the program.
