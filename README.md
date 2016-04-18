Welcome to the Airport Challenge.

A couple of issues:

1. My tests use reader methods to check whether airport/plane attributes change as expected when different things happen. I'd prefer the readers to be private, as they aren't actually used by methods in other classes, but I can't work out how I'd properly test the correct changes are happening when planes land or take off...

2. My application works by calling .try_to_land or .try_to_takeoff on a plane object. These methods check the plane's internal attributes to see if it is able to land/take off (i.e. is it already landed?), then ask the airport to receive or dispatch the plane. The airport then checks the weather - which seems like something done in the airport not by the plane - and if the weather is clear, they call .land or .take_off on the plane, so the plane's internal attributes are changed (to landed or not landed) by the plane class not the airport. All this is to avoid one class changing or reading the state of another class object. However, it means I have a .land and .take_off method that could cheat the system! They could be called directly, kidding the plane to think it's landed/not landed when it hasn't been through the correct landing/take-off procedure. I don't know if this is a real problem, or if it'd be ok to prevent the commands a user could give through a separate script...?

Anyway...

Instructions:
- clone this repo to your machine
- run bundle from within the repo to install the necessary software listed in the Gemfile
- open IRB and require each of:
	- './lib/airport.rb'
	- './lib/plane.rb'
	- './lib/weather.rb'
- create airports and planes, land them, and fly them!:
	- Plane.new creates a new plane
	- Airport.new creates a new airport (and set a new capacity as an integer in brackets after new)
	- planeobject.try_to_land(airportobject) lands a plane
	- planeobject.try_to_takoff flies a plane
- for a rundown on features, run:
	- ruby feature_test.rb
