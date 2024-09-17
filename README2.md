Airport Challenge
==================

[![Build Status](https://travis-ci.org/jgeorgex/airport_challenge.svg?branch=master)](https://travis-ci.org/jgeorgex/airport_challenge)

## Approach to solving the challenge

This README is to briefly explain my approach to solving the Airport Challenge.

After reviewing the challenge I made a note of the tasks I'd need to complete.

1.  Create a set of classes/modules to satisfy user stories.

2.  Use a random generator with a 'stub' to set the weather.

3.  Check code produced defended against edge cases.

I also noted it would be necessary to create separate files for every class, module and test suite.

I drew a diagram identifying what classes I thought would work well with the user stories presented.

I then clarified what the purpose of each Class was in a diagram.

I then identified how each class would need to interact witch each other keeping in mind the single responsibility principle.

The classes I had where:

Plane
Airport
Weather
Capacity
System Designer

They would interact as follows:

Plane <--------> Airport
Is it OK to land / take off?

Airport <--------> Weather
Is the weather safe or not?

Capacity <--------> Airport
Is the Airport at capacity or not?

Capacity <--------> System Designer
Set the capacity

Single Responsibility Principle

This is what I originally identified:

Airport Class - Managing Planes
authorise_plane method - Give Plane class permission to land / take off
Check_weather method - Check with Weather class that weather is safe
Check_capacity - Check with Capacity class that there is spare capacity

Plane Class - Carrying Passengers
Land Method - Landing Plane
Take off Method - Taking off Plane

Weather Class - Reporting if weather is safe
Weather safe method - Is weather safe or not

Capacity Class - Storing capacity of Airport
Capacity method - What is the capacity of the Airport?
OK_to_land method - Is there room for a plane to land?

System Designer Class - setting capacity of Airport
Capacity method - set capacity of Airport

I then followed TDD principles to work through each user story in the order they where presented.

##  Current Status

There is 100% test coverage with Rubocop with no offences detected.
All tests are passing.

So far I have created methods and basic tests for the Plane Class to land and take off.  

The land and take off methods are the interfaces the Plane class will use to interact with the Airport class.

Right now the methods tests are only for the accessibility and existence of the methods because the Airport Class does not yet exist.  

The next stage would be to write the tests for the Airport methods that would interface with the plane method.  Then create the class and methods to get the tests to pass.

After that I would continue with the other classes and methods identified.  As I progress it's possible that it will become apparent that design will need to be adapted along the way. If that is the case I will review and adapt the original diagram and also make sure that all previously tested user stories are still being met.

Move over to Readme 1 + review changes
