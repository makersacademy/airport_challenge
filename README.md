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

Install program
---------------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Run program
-----------
Run irb and start with the following command
```
require './lib/airport.rb'
```
Create an airport (the default capacity of an airport is 5 planes, add an argument to the .new method to set your own capacity). Create a plane (the default status of a plane is "flying")
```
airport = Airport.new(7)
plane = Plane.new
```
You can then land the plane (providing the weather allows it!), then fly it.
```
airport.land(plane, Weather.new.weather_check)
airport.take_off(plane, Weather.new.weather_check)
```
You can check the current planes landed at the airports by running
```
airport.planes
```

Cases
-----

The commands will lead to errors in the following cases:

1. A plane should not be able to fly when it's already flying
2. A plane should not be able to land when it has already landed
3. A plane should not be able to take off if it's in another airport
4. A plane should not be able to take off in bad weather (>=8/10)
5. A plane should not be able to land in bad weather (>=8/10)
6. A plane should not be able to land if the airport is at full capacity.

Comments
--------

I chose not to initialize the weather when creating a new instance of an airport because I thought the weather should be checked every time a plane is taking off or landing. Therefore a new instance of the Weather must be checked every time the .land or.take_off method is called.
