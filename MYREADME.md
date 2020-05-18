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

I used the RED, GREEN, REFACTORED approach building my program with TDD. I also created separate files for every class and test suite.



## Domain Model

Below I have mapped out the user stories to understand the objects and messages (classes and methods)
I will need to build out my program.

| Objects        | Messages         | 
| ------------- |:-------------:| 
| Plane   | at_airport? |
| Airport     |  land, take_off, stormy?, capacity, full?  |  

--- 
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
 - Feature tested the creation of airport. **Error unintialized constant Airport.**
 - Created airport_spec.rb file and wrote unit test describing Airport class. **Error message matches feature test.**
 - Created airport.rb file and defined Airport class. **Test passed**
 - Feature tested my new airport object to respond to land. **Error undefined method.**
 - Wrote test for Airport to respond to land. **Test failed.**
 - Defined land method in Airport class. **Test Passed.**

**There should be a Plane to tell Airport which plane is landing**

 - Feature tested the creation of a new plane. **Error unintialized constant Plane.**
 - Created plane_spec.rb file and wrote unit test describing a Plane object. **Test failed.**
 - Created plane.rb file and defined the Plane class. Require file in plane_spec.rb. **Test passed.**
 - Feature tested land with argument plane. Error wrong number of arguments for land.
 - Updated airport_spec.rb to now test for land method with 1 argument. **Test failed.**
 - Updated airport.rb land method. Now accepts 1 argument plane. **Test passed.**

 **Airport should return plane which has landed**
  
  - Feature tested airport.land(plane). **Returns nil value.**
  - Wrote test to specify the return of plane on airport.land(plane). **Test failed**
  - Updated land method in Airport class to return the value of the argument passed. **Test passed.**
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
 - Feature tested take_off method on airport. **Unidentified method error.**
 - Wrote unit test for take_off to respond to Airport objects. **Test failed**
 - Defined take_off method in Airport class. **Test passed.**

**Airport should know which plane is taking off specifying it in an argument** 
 - Featured tested take_off with plane argument.** Wrong number of arguments error.**
 - Rewrote unit test for take_off method to expect 1 argument. **Test failed.**
 - Defined take_off method to accept 1 argument. **Test passed.**

 **Airport should return a plane once it has taken off**

 - Feature tested take_off on a Airport object with a Plane object as an argument.**Returned nil.**
 - Wrote unit test for take_off to expect return Plane object. **Test failed.**
 - Defined take_off method to return the value of argument. **Test passed**

 **Plane should confirm it has left the airport**

 - Feature tested at_airport? method on plane object returned after take off. **Error undefined method `at_airport?'.**
 - Wrote unit test for Plane object to respond to at_airport? in the plane_spec.rb file. **Test failed.** 
 - Defined method at_airport? in the plane.rb file. **Test passed.**
 - Feature tested at_airport? on Plane object after take off. **Returns nil value.**
 - Wrote unit test describing at_airport? method. Set return value to equal false once plane has taken off. **Test failed.**
 - Defined false return at_airport? method. **Test passed.**
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

**Airport should have attribute to know when it's full**
 - Named attribute airport_hanger to represent airports fullness. 
 - Feature tested airport_hanger method on Airport object. **Unidentified method error.**
 - Wrote unit test for Airport objects to respond to airport_hanger. **Test failed**
 - Defined airport_hanger instant variable as an attribute which can be called using attr_reader. **Test passed.**

 **Airport should store fullness in the form of planes that have landed**
 - Feature tested Plane object landing in airport. 
 - Used airport_hanger method to retrieve landed plane object. **No plane returned.**
 - Rewrote unit test for airport_hanger to plane object stored after landing. **Test failed.**
 - Redefined land method to store returned planes in airport_hanger array. **Test passed.**

**If airport_hanger is full land(plane) should raise an error** 
 - Assummed airport had capacity for one plane. 
 - Feature tested landing two seperate plane objects in airport. **Landing second plane did not raise expected error.**
 - Wrote unit test for land method to raise error if second plane object atempted to land. **Test Failed.**
 - Defined full? method in private to return true, if airport_hanger length was equal to one.
 - Redefined land method to raise error if full? returned true. If not, plane will be stored in airport_hanger. **Test Passed** 
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

** A new Airport should have a default capacity value**

 - Feature tested new airport to return default value when capacity method called. **Wrong number of arguments.**
 - Wrote unit test for Airport object to respond to new with 1 argument. **Test failed.**
 - Defined initialize method accepting capacity as an arugment. 
 - Created instant variable capacity to equal capacity, retrievable using attr_reader. 
 - Set default value of capacity to equal to one **Test passed**
 - Refactored full? method to return true, if airport_hanger.length was equal to capacity.

## User Story 5 & 6

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
```
airport <------ stormy? ------> true / false
```

**Airports should know when weather is stormy**
 - Feature tested weather method on new airport. **Unidentified method**
 - Wrote unit test for airport to respond to stormy. **Test failed**
 - Defined stormy method in Airport class. **Test passed**
 - Feature tested return value of stormy? method called on airport. **Return value nil**
 - Wrote unit test for stormy? to return true or false. **Test failed**


**Airport should be able to read weather forcast**
 - Feature test weahter. Constant undefined. 

---
**RAN OUT OF TIME**

Steps I would have taken.

1. complete feature test for user story 5,6
2. feature tested and test to satisfy edge cases.
3. go more indepth in README  explaining style guide (rubocop)