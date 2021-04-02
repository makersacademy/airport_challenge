Airport Challenge
=================

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

Approach
---------

All the stories were approached using TDD ([planning](https://github.com/KaneG9/airport_challenge/blob/master/Airport_plan.HEIC)).
* Both `takeoff` and `land` were created as methods within the `Airport` class
* Made program produce an error message when `land` was called whilst the hanger was full.
* Created a default capacity as well as giving it `attr_accessor` status so it can be overridden.
* Created the private `weather` method which is called whenever a plane takes off or lands. If `weather` is stormy an error is produced (This was tested using a stub).
* Had to edit the rspec configuration to call a stub setting the `weather` sunny before testing to prevent an error due to stormy weather. 
* Created errors for edge cases of planes taking off if they don't exist in the hanger and planes landing if they already exist in the hanger.
* Attempted to use rescue to prevent weather errors crashing the program in a feature test but it broke the weather tests which I couldn't work out how to fix.