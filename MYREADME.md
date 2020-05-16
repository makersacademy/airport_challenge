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

**A note of all the nouns(objects) in the user story**


As an air traffic **controller**
So I can get **passengers** to a **destination**
I want to instruct a **plane** to land at an **airport**

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport


**A note of all the verbs(messages) in the user story**
 
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to **land at an airport**

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to **take off from an airport** and **confirm that it is no longer in the airport**



Objects  |  Messages
---------| ------------
Controller |  
Plane | land, take_off
Airport | plane_in_airport?

```
Plane <--- land ---> Airport 
Plane <--- take_off ---> Airport
Airport <--- plane_in_airport? ---> true/false
```
## Airport Object

 - Run a feature test to create new Airport object.
 - Implement unit test for Airport constant
 - Create Airport Class. 

## Airport message
 - Run feature test on Airport instant responding to plane_in_airport?
 - Created unit test for the plane_in_airport? method.
 - Defined plane_in_airport? method. 


## Plane Object

 - Run a feature test to create new plane object.
 - Implement unit test for Airport constant
 - Create Airport Class. 

## Plane messages
 1. Ran feature test on Plane instant responding to land
 2. Created unit test for the land method.
 3. Defined land method. 
 4. Repeated steps 1-3 for take_off message.