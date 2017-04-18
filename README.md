Airport Challenge
=================

First weekend challenge of Makers Academy course. In this challenge we are required to write software to control the flow of planes in an airport.

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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


My task was to test drive the creation of a set of classes to satisfy all the above user stories. I had to use a random number generator to set the weather to either 'stormy' or 'sunny'. In my tests, I used a stub to override the random weather to ensure consistent test behaviour

My code defends against edge cases such that the states of the system ensures the planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

Below I demonstrate some of features of the code using IRB:
```
2.4.0 :001 > require './lib/airport'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fc58a96e3d8 @weather=#<Weather:0x007fc58a96e3b0>, @capacity=20, @planes=[]>
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007fc58a9665e8>
2.4.0 :004 > airport.land(plane)
RuntimeError: can not land, weather condition stormy
```
When I tried to land the plane my code raised the error: "can not land, weather condition stormy" because my 'land' method checks the weather before landing, if it is stormy it will not let the plane land. In this case the random number set the weather to stormy hence the error was raised.
```
2.4.0 :005 > airport.land(plane)
 => [#<Plane:0x007fc58a9665e8>]
 2.4.0 :006 > airport
 => #<Airport:0x007fc58a96e3d8 @weather=#<Weather:0x007fc58a96e3b0 @condition=:sunny>, @capacity=20, @planes=[#<Plane:0x007fc58a9665e8>]>
```
Now my plane landed because the weather was set to 'sunny'.
