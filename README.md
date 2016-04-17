# Airport Challenge
---------
[![Build Status](https://travis-ci.org/iammatthewward/airport_challenge.svg?branch=master)](https://travis-ci.org/iammatthewward/airport_challenge)

Description
---------

This airport program allows multiple airports and planes to be created, and allows planes to land at any aiport. All landing and take off methods are handled within the airport class, with the instances of the plane class only having functionality to change their landed status.

The weather at the airport can also be set with the weather_change function, which randomly assigns the weather. If the weather is stormy at an airport then planes cannot take off or land.

The program was developed with the following user stories and edge cases, and is completely test driven using Rspec:

User Stories
---------

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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
Edge Cases
---------
```
Planes can only take off from airports they are in

Planes that are already flying cannot takes off and

Planes that are landed cannot land again and must be in an airport, etc.
```

Contact
---------
Matt Ward: iammatthewward@gmail.com
