# Airport Challenge - Weekend 1
I found this really challenging and have submitted a partial solution. The parts that felt similar to Boris Bike Challenge were doable but I did struggle beyond that.

I have looked at some previous years solutions but not copied from one single one. My code is more of an update of my boris bike
bike challenge so I didn't manage to integrate a plane landing AT a specific airport.
I only had airports being passed a plane object but I think you would need to pass a plane an airport object?
-----

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
``` 
I think I managed this user story - an airport can land a plane.

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
I did not have the confirmation part, only a take off method 
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
I used similar code and testing from boris bike challenge about a dock being full for this user story
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Similar to docking station capacity, option to provide capacity as argument to airport instance but set to a default constant
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
Weather module had the random number generator to give sunshine around 80% of the time

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
- I didn't manage to have planes landing at specific airports so I didn't test for planes taking off from aiports they weren't in

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.
- I think I was able to do this. The die example was really helpful.

Please create separate files for every class, module and test suite. 
 Creating a weather module rather than class - this helped with understanding the difference between modules and classes.



