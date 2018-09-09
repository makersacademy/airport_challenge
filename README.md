Airport Challenge
=================

This is my attempt at the first week challenge of Makers Academy.

These were the initial instructions: https://github.com/makersacademy/airport_challenge


Approach
-----
To solve the challenge, three different classes have been created: airport, plane and weather.

The planes can land or take off from airports and the airports can host a certain number of planes inside them. We have also tried to cover different edge cases (example: a plane will not be able to take off from an airport if they are not landed there).

An individual RSPEC test has also been created for each different class.

User stories
-----

These are the user stories around which the different features of the program have been designed:

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
