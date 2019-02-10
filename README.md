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
weather = Weather.new
weather.set_stormy
plane.takeoff(weather) == false
