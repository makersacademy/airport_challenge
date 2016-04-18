Welcome to the Airport Challenge.

Instructions:
- clone this repo to your machine
- run bundle from within the repo to install the necessary software listed in the Gemfile
- open IRB and require each of:
	1. './lib/airport.rb'
	2. './lib/plane.rb'
	3. './lib/weather.rb'
- create airports and planes, land them, and fly them!:
	- Plane.new creates a new plane
	- Airport.new creates a new airport (and set a new capacity as an integer in brackets after new)
	- <planeobject>.try_to_land(<airportobject>) lands a plane
	- <planeobject>.try_to_takoff flies a plane
- for a rundown on features, run:
	- ruby feature_test.rb
