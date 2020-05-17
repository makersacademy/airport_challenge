# Airport Challenge

Task
-----

We have a request from a client to write the 
software to control the flow of planes at an airport. 
The planes can land and take off provided that the weather 
is sunny. Occasionally it may be stormy, in which case 
no planes can land or take off.  Here are the user stories 
that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## Development Approach 

TEXT TO GO HERE

## Domain Model

Here I will map out the user stories to understand the objects and messages (classes and methods)
I will need to build out my program.

## User Story 1

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
**There should be a method to land the plane at an Airport**
 - Feature tested the creation of the airport. Error unintialized constant Airport.
 - Created unit test for describing Airport class. Error message matches feature test.
 