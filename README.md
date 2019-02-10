

The current status of this challenge is the following:

------------------------------------------------------------------------
The results of rspec
Finished in 0.00388 seconds (files took 0.19891 seconds to load)
12 examples, 0 failures
COVERAGE: 100.00% -- 83/83 lines in 6 files

------------------------------------------------------------------------
The results of rubocop
Inspecting 9 files
.........
9 files inspected, no offenses detected

------------------------------------------------------------------------
I got to the stage where I needed to write a stub to override random weather conditions.
I ran out of time looking up stubs.

To Do:
Test stub
Edge Cases
Doubles
------------------------------------------------------------------------
Below is the method that I used to get to this point...

My challege is to 

1. Write the unit tests for the following
2. Test in irb and confirm that the failure is as predicted
3. Write the feature test in the spec file 
4. Write the code to eliminate the error and met the functionality

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
plane = Plane.new
plane.land

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
plane = Plane.new
plane.takeoff
plane.airbourne == true

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
plane = Plane.new
stormy = true
weather = Weather.new(stormy)
plane.takeoff(weather.stormy?) == false

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
plane = Plane.new
stormy = true
weather = Weather.new(stormy)
plane.land(weather.stormy?) == false

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
plane = Plane.new
full = true
airport = Airport.new(full)
plane.land(airport.full?) == false

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
airport = Airport.new
airport.capacity = 50
airport.set_capacity(1000) == "Airport capacity is now 1000"


