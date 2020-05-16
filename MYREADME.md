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

---
## Objects & Messages

FIRST 2 USER STORIES

**A note of all the nouns(objects) in the user story**

1. plane
1. airport

**A note of all the verbs(messages) in the user story**
 
1. land at an airport
2. take off from an airport
3. confirm that it is no longer in the airport


Objects  |  Messages
---------| ------------
Controller |  
Plane | at_airport?
Airport | land, take_off, 
---
## Domain Model

```
Airport <--- land ---> a plane
Airport <--- take_off ---> a plane
Plane <--- at_airport? --> true/false
```
---
## Feature Test

## Airport Object

 - Run a feature test to create new Airport object.
 - Implement unit test for Airport constant
 - Create Airport Class. 

## Airport message
 - Run feature test to land(plane) at Airport
 - Created unit test for the land method.
 - Defined lane method within Airport class


## Plane Object
 - Run a feature test to create new Plane object.
 - Implement unit test to define Plane constant
 - Create Plane Class. 

## Plane messages
 -  Run a feature test to check if plane is at airport
 -  Created unit test for the at_airport? method
 -  Defined at_airport? method. 
---