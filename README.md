Airport Challenge
=================

Task
-----

This challenge was to write a piece of software to control the flow of planes at an airport, adhering to the requirements of a set of user stories.


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

User Story 1
-------------

The first user story requires interaction between two new objects, Plane and Airport.

My first decision was whether to create a land method for the Plane or Airport class. I decided to go with the Plane using the land method because I felt that ```plane.land(airport)``` would make more sense to the user.

The land method takes the airport as the parameter and returns it when called on a plane.

Next I created the landed? method, which uses the instance variable landed to return a boolean. This is initialized to false when the place is created, and is set to true by the land method.

User Story 2
-------------

Before starting on this story I did some refactoring. I decided that the landed? method was superfluous and instead kept the landed state of the plane in an attribute reader.

My first step was to implement the take_off method for the Plane class. When called ```plane.take_off``` it changes the @landed variable from true to false.

To confirm that the plane is no longer at an airport, I created an airport attribute reader. This is initialized to :flying when the place is created. I then updated the land method to change @airport to the airport passed in. When take_off is called, it resets the @airport variable back to :flying.