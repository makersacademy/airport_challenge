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

```
Airport <--- land(plane_one) ----> plane_one
```

**There should be an Airport which responds to land**
 - Feature tested the creation of the airport. Error unintialized constant Airport.
 - Created unit test for describing Airport class. Error message matches feature test.
 - Defined the class Airport. Test passed
 - Wrote test for Airport to respond to land. Test failed.
 - Defined land method is Airport class. Test Passed.

**There should be a Plane to tell Airport which plane is landing**

 - Feature test the creation of new plane. Error unintialized constant Plane.
 - Create plane_spec.rb. Describe the Plane object. Test failed.
 - Create plane.rb. Define Plane class. Require file in plane_spec.rb. Test passed.
 - Feature test land with argument plane. Error wrong number of arguments for land.
 - Updated airport_spec.rb to now test for land method with 1 argument. Test failed.
 - Updated airport.rb land method. Now accepts 1 argument plane. Test passed.

 **Airport should return plane which has landed**
  
  - Feature test airport.land(plane). Returns nil value.
  - Wrote test to specify the return of plane on airport.land(plane). Test failed
  - Updated land method in Airport class to return the value of the argument passed. Test passed.