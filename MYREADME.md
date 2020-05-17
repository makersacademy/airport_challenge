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
---
  ## User Story 2
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

```
Airport <--- take_off(plane_one) ----> plane_one
plane_one <---- at_airport? -----> true / false
```

**Airport class should respond to take_off**
 - Featured tested take_off method on airport. Unidentified method error.
 - Wrote test for take_off to respond to Airport objects. Test failed
 - Defined take_off method in Airport class. Test passed.

**Airport should know which plane is taking off specifying it in an argument** 
 - Featured tested take_off with plane argument. Wrong number of arguments error.
 - Rewrote unit test for take_off method to expect 1 argument. Test failed.
 - Defined take_off method to accept 1 argument. Test passed. 

 **Airport should return a plane once it has taken off**

 - Feature tested take_off with argument of Plane object. Returned nil.
 - Wrote unit test for take_off to expect return of Plane object. Test failed. 
 - Defined take_off method to return the value of argument. Test passed

 **Plane should confirm it has left the airport**

 - Feature tested at_airport on return take_off value. Error undefined method `at_airport?'.
 - Wrote test for Plane object to respond to at_airport? Test failed. 
 - Defined method at_airport? Test passed.
 - Feature test at_airport returns nil value.
 - Wrote unit test describing at_airport? return to equal false once plane has taken off. Test failed.
 - Defined false return at_airport? method. Test passed. 
---
## User Story 3

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
```
airport <---- land(plane) ---> raise error when airport is full
```

**Airport should know it's own capacity**
 - Feature test. Airport should know it's own capacity.
 - Wrote unit test for Airport objects to respond to capacity. Test failed
 - Defined capacity method as an attribute with attr_reader. Test passed. 

 **Airport airport should store number of planes in capacity after landing**
 - Feature test. Capacity method should return landed planes at the airport
 - Wrote unit test for capacity to return plane which have landed. Test failed.
 - Rewrote land method to store in landed planes in capacity. Test passed. 

**If the capcacity is full land(plane) should raise an error** 
 - Feature test. If capcity length is over a certain value. Airport will raise error to land method.
 - Write unit test for land method to raise error if plane is already landed. Test Failed.
 - Defined full? method in private. Set full? to capacity == 1. Raised error if full?. Test passed.
---
 ## User Story 4
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

```
airport <--- capacity ---> default_value
```

**Airport capacity should have a default value**
 - Feature test to add argument into new airport. 
 - Wrote unit test for Airport to accept argument when created. Test failed.
 - Define initialize method to accept any argument when being created. Test passed.


**Airport capacity should be set once new airport is created**
- Feature tested for argument on new Airport to equal capacity. Failed.
- Wrote unit test for Airport

