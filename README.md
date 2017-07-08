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

require plane.rb and airport.rb irb or other Ruby interpreter.

## Comments

Created with a Plane and Airport class

Airports are passed land and take_off methods, with planes as arguments to add and remove them from the airport's runway.  
Runway capacity defaults to 10 but can be changed by passing an integer to the airport when instantiated.  
Airports cannot land planes at full runways.  
Airports cannot take off planes unless they are on the runway.  
Airports cannot land grounded planes.  
Planes are grounded when they land and ungrounded when they take off.  
Airports can only land Planes.  
Airports cannot land or take off planes when there is a storm.  
There is a 10% chance of a storm.  
All actions are confirmed.  

Planes instantiate with a random five digit name, format AA000.

**Limitations**

Airports can only land and take off planes one at a time.  
Storm conditions cannot be customised.  
Planes cannot be renamed.  
There is no way to remove or add planes to runways other than landing and taking off.  

**Notes**

Clears Rubocop except for 7 "unexpected token tLCURLY" errors which breaks the Rspec test if adjusted.  
100% test coverage.
