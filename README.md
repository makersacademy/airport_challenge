Airport Challenge
=================

This challenge was given to us in our first week of the Makers Academy on-site course. It allowed me to practice transforming user stories into usable code using test driven development.

Steps to run this program
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Using this program
-------
```
irb
require './lib/airport.rb'
airport = Airport.new
plane = Plane.new
airport.land(plane)
plane.landed?
airport.take_off(plane)
```

My Approach
---------

I was given the following task and user stories, under each of which I have explained my approach to solving this problem:  

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
I decided that I needed an Airport class and a Plane class and a method to land a plane(object) in the airport(object).

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
I needed to create a method that enabled planes to take off from the airport. In order to confirm that the plane was no longer at the airport, I wanted to create methods in the plane class to record that the plane has taken off and is now flying.

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
In order to ensure that the Single Responsibility Principle was adhered to, I wanted to create a separate Weather class which randomised weather instances. I wanted it to be more likely that it would be a sunny day, but occasionally there would be a storm which would prevent the plane from taking off. This would involve a method in the Airport class checking that the weather was not stormy and an error being raised if it was.

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
My approach was the same as it was for preventing take off during a storm. I used a method in the Airport class to check the weather and raised an error to prevent landing if the weather was stormy.

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
I initially set the capacity as a set number but later changed this to 'DEFAULT_CAPACITY' so that this could be easily changed later if necessary (if my airport was to be expanded). I created a method to show when the airport was full (i.e. the number of planes was equal to or greater than the DEFAULT_CAPACITY) and raised an error that told the planes the airport was too full for them to land.

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
When initializing the Airport class, I passed an argument for setting the airport capacity, using a constant (DEFAULT_CAPACITY) which will be the default airport capacity if the user does not pass an argument.

I also defended edge cases such as ensuring that planes could only take off if they were in the airport. To improve this code, I would defend against further edge cases by ensuring that planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

What I learned from this challenge
-----
* How to use stubs in my tests
* Further practice with TDD and Rspec
* Defending against edge cases
* OOP and Encapsulation 


Author/Acknowledgements
-----
Jordan Roberts
Makers Academy Challenge
