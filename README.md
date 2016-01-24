Airport Challenge
=================
Created by Mark Hill 24/1/16

Using TDD to respond to user stories and build software controlling the flow of planes into an airport.

Content:
Three classes
(1) Plane - Records the state of the plane (landed/not-landed), contains methods 'land' and 'takeoff' checking weather/ condition of the airport.
(2) Airport - Records the planes that have landed and the capacity of the airport. Contains full? method which checks to see if the number of planes has reached the capacity.
(3) Weather - Randomly generates a weather condition, with a 75% chance of sunny weather and a 25% chance of stormy weather.



 User Stories:

 Instruct a plane to land at an airport and confirm that it has landed
 Instruct a plane to take off from an airport and confirm that it is no longer in the airport
 Prevent takeoff when weather is stormy
 Prevent landing when weather is stormy
 Prevent landing when the airport is full
 Create a default airport capacity that can be overridden as appropriate
 Raise errors for inconsistent system states.
