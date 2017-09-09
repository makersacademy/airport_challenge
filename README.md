# Airport Challenge

A small program written in ruby using TDD to satisfy the following user stories:

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

## Getting Started

require plane.rb and airport.rb in irb or other Ruby interpreter.

## Detail

Created with a Plane and Airport class

Airports are passed land and take_off methods, with planes as arguments to add and remove them from the airport's runway.  
Runway capacity defaults to 10 but can be changed by passing an integer to the airport when instantiated.  
There is a 10% chance of a storm.  
Planes instantiate with a random five digit name, format AA000.

## Comments

This program could be improved by extracting the weather functions to a separate class to keep the responsibilities more structured.  
There is a condition which raises an error if the object passed to the airport's land method is not a Plane.  This limits future expansion and so should be removed.
