Scenario
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

USER STORIES

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

------------------------------

I did not work on the weather functionality until the rest of my code was working.

I decided that the plane class should call the methods take_off and land, as only a plane would know when to do those actions.
However, I made those methods be dependent on airport methods. My logic was that, a plane would announce to an airport that they wanted to land or takeoff but that the airport would respond back, letting them know whether the plan was ok to do that.

I also wanted to allow any airport to find where any plane was, at any given time. 
