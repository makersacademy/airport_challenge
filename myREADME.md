# Airport Challenge! #

## My approach ##

I prepared for the challenge by reading all of the instructions and supporting material throughly.

Following this I listed all aspects to be tested to verify I have covered them all along with any other additional notes on code I will need to use and any other requirements of my program/tests.

I then began the challenge itself by reading each of the User Stories and creating a Domain Model of each one composed of an object and a message acting on that object. These will form the basis for my unit tests and subsequently my code so that my program will be written in a test-driven manner.

Following on from this, for each user story my approach was: run a feature test in pry to test the interaction between my objects and messages.

I used the outcome of this feature test to drive the content of my unit tests, and the subsequent outcomes/errors of these to write my code.

I then re-tested my unit and feature tests to confirm the program worked as intended.

I did this for each used story and finished by making sure my test coverage was 100% and my code defended against edge cases and used stubs to override random weather behaviour.



## How the app is used (in pry): ##
[1] pry(main)> require './lib/airport.rb'
=> true
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007ffa6a1ff948 @capacity=2, @planes=[], @storm=true>
[3] pry(main)> airport1 = Airport.new
=> #<Airport:0x007ffa6a1b6950 @capacity=2, @planes=[], @storm=false>
[4] pry(main)> plane = Plane.new
=> #<Plane:0x007ffa6a060f88>
[5] pry(main)> airport.land_plane(plane)
RuntimeError: Weather is too stormy to land
from /Users/oliviafrost/Desktop/Makers/FullCourse/Week1/AirportChallenge/airport_challenge/lib/airport.rb:19:in `land_plane'
[6] pry(main)> airport1.land_plane(plane)
=> [#<Plane:0x007ffa6a060f88>]
[7] pry(main)> airport1.land_plane(plane)
RuntimeError: This plane has already landed in this airport
from /Users/oliviafrost/Desktop/Makers/FullCourse/Week1/AirportChallenge/airport_challenge/lib/airport.rb:47:in `check_if_plane_is_already_in_airport'
[8] pry(main)> plane1 = Plane.new
=> #<Plane:0x007ffa68a2c6b8>
[9] pry(main)> airport1.land_plane(plane1)
=> [#<Plane:0x007ffa6a060f88>, #<Plane:0x007ffa68a2c6b8>]
[10] pry(main)> plane2 = Plane.new
=> #<Plane:0x007ffa6a21ec80>
[11] pry(main)> airport1.land_plane(plane1)
RuntimeError: This plane has already landed in this airport
from /Users/oliviafrost/Desktop/Makers/FullCourse/Week1/AirportChallenge/airport_challenge/lib/airport.rb:47:in `check_if_plane_is_already_in_airport'
[12] pry(main)> airport1.land_plane(plane2)
RuntimeError: Airport is full
from /Users/oliviafrost/Desktop/Makers/FullCourse/Week1/AirportChallenge/airport_challenge/lib/airport.rb:21:in `land_plane'


## Contents ##

Lib folder containing:
    1. airport.rb
    2. plane.rb
    3. weather.rb

Spec folder containing:
    1. airport_spec.rb
    2. plane_spec.rb
    3. weather_spec.rb
    4. spec_helper.rb

## Authors ##

Olivia Frost

This repository was forked and then cloned from makersacademy/airport_challenge