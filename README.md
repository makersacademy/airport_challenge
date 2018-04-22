Airport challenge
=================

Summary
-------

This program was written as part of Makers Academy course. It constitutes the weekend challenge for week 1.
The program simulates an Air Traffic Controller (ATC) who can control different airports and from these airports instruct planes to land or take off.
The ATC has the ability to alter the capacity of an airport and will need to be aware that occasionally storms might mean planes cannot take off and land. Don't worry though these storms will pass quickly so have patience.

Instructions
------------

Set-up:

1. Fork or clone this repo to your local machine
2. Run the command `gem install bundler` (if you don't have bundle already)
3. When the installation completes, run `bundle install`

Running the code:

* Require './lib/controller' into a REPL
* To create a new airport - airport_name = Airport.new(airport_args) - please see section on airport args below
* To create a plane - plane_name = Plane.new
* To land a plane - airport_name.land(plane_name)
* To ask a plane to take off - airport_name.release(plane_name)
* To change the capacity of an airport - airport_name.capacity = 10 (any integer will do)
* To check the capacity of an airport - airport.capacity
* To see which planes are at an airport - airport.planes
* DO NOT GIVE COMMANDS TO PLANES DIRECTLY

Airport arguments:

* Arguments are passed to the airport as a hash.
* Airport receives the following args :capacity, :weather_forecast
* These arguments will default to 10 and the Weather Class if not provided
* Custom weather_forecast must respond to the method stormy? with a true or false

Future Directions
-----------------

Many new features are planned such as:

* Develop a user interface to control the airport and plane objects more robustly
* Implement better message passing and verification between planes and airports
* Remove the hard coded Weather object in Airport DEFAULTS

Problems or questions? File an issue at GitHub.

Contributors
------------

This is primarily the work of George Sykes, but would not have been possible without my fellow developers and coaches at Makers Academy.
