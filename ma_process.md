Project Overview
---------

Approach
---------

This handrail has been taken from my incredible and extremely pragmatic Makers Academy mentor, Kim Diep. Thank you!

##CLIENT REQUIREMENTS

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

##USER STORIES

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

PROGRAM USAGE

* For the first iteration fo the product, this program will be usable in Interactive Ruby via the terminal using `irb`

###STEP 1 - SKETCHING OUT THE DOMAIN MODEL

Translating the user stories into a domain model

###STEP 2 - SET OUT THE OBJECTS / CHARACTERISTICS / INTERACTIONS

From the user stories, set out the objects and their interactions (messages) to be modelled

###STEP 3 - DEFINE METHODS AND WHAT THEY DO

Now that the domain model, objects and their interactions are clear, set out the methods

###STEP 4 - DEFINE TEST CLASS

Now I set out the test cases

###STEP 5 - TDD PROCESS

Using the notes gathered in the above five steps, go through the TDD process

* USER STORY
* FEATURE TEST
* UNIT TEST
* CODE IMPLEMENTATION
* FEATURE TEST

##CLASSES/OBJECTS

* Airport
* Weather
* Plane

##OBJECT CHARACTERISTICS

###AIRPORT

Has:

* List of planes
* Receive weather warnings
* Capacity

Methods:

* `land`
* `take_off`
* `at_capacity?`

###PLANE

Has a:

* Receives message to land from Airport
* Sends message to Airport to confirm it has left

Methods:

* `land`
* `take_off`

###WEATHER

Has a:

* Weather status

Methods:

* `stormy?`

##DOMAIN MODEL: MESSAGES/INTERACTIONS

(Screenshot of domain model)

##STORIES

###STORY 1

`As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport`

###OBJECTS

* Plane
* Airport

###MESSAGES

* Airport sends message to plane to land
* Plane receives message from airport to land
* Plane lands and tells Airport it has landed
* Airport receives landed message

###TEST CASES

- [X] Airport instantiated
- [X] Plane instantiated
- [X] Airport has `land` method
- [X] Airport sends message to tell plane to land; plane receives land
- [X] Airport has list of planes

###STORY 2

`As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport`

###OBJECTS

* Airport
* Plane

###MESSAGES

* Airport takes plane from list and tells it to take off
* Airport checks list to confirm it has taken off
* Airport provides confirmation message

###TEST CASES

- [X] Airport has a `take_off` method
- [X] Airport tells a plane from list of planes to take off
- [X] Airport checks plane is no longer in list; prints confirmation message

###STORY 3

`As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy`

###OBJECTS

* Weather
* Airport

###MESSAGES

* Weather uses random number generator to set weather as stormy or sunny
* Message (sunny or stormy) sent to Airport
* Airport receives message
* If weather is stormy plane prevented from taking off

###TEST CASES

- [X] Weather instantiated
- [X] Weather has a `stormy?` method
- [X] Weather has `stormy?` method which returns `true` when stormy or `false` when sunny at random
- [X] If Airport tells a plane to take off and `stormy?` returns true a plane does not take off and an error message is given

###STORY 4

`As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy`

###OBJECTS

* Weather
* Airport

###MESSAGES

* Weather uses random number generator to set weather as stormy or sunny (it is only stormy on rare occasions)
* Message (sunny or stormy) sent to Airport
* Airport receives message
* If weather is stormy plane prevented from taking off

###TEST CASES

- [X] If Airport tells a plane to land and `stormy?` returns true a plane does not land and an error message is given

###STORY 5

`As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full`

###OBJECTS

* Airport

###MESSAGES

* Airport has a set capacity
* Airport cannot send message to plane to land if the Airport is at capacity

###TEST CASES

- [ ] An error is raised if a plane is instructed to land and the number of planes in the airport equal capacity

###STORY 6

`As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate`

###OBJECTS

* Airport

###MESSAGES

* Airport has a default capacity
* Airport can set its own capacity when instantiated

###TEST CASES

- [ ] Default capacity is used if capacity is not specified when instantiated
