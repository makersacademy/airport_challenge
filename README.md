#Airport Challenge

[![Build Status](https://travis-ci.org/AnnaHollandSmith/airport_challenge.svg?branch=master)](https://travis-ci.org/AnnaHollandSmith/airport_challenge)
=========================

[1] pry(main)> require './lib/plane'
=> true
[2] pry(main)> airport = Airport.new(2)
=> #<Airport:0x007f9fd43ec8f0 @capacity=2, @landed_planes=[]>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f9fd437ecd8 @at_airport=false, @flying=true>
[4] pry(main)> plane2 = Plane.new
=> #<Plane:0x007f9fd43279b0 @at_airport=false, @flying=true>
[5] pry(main)> plane3 = Plane.new
=> #<Plane:0x007f9fd5277a00 @at_airport=false, @flying=true>
[6] pry(main)> plane3.flying?
=> true
[7] pry(main)> airport.land(plane3)
=> "The plane has now landed"
[8] pry(main)> plane3.flying?
=> false
[9] pry(main)> airport.take_off(plane3)
=> "The plane has taken off"
[10] pry(main)> airport.take_off(plane3)
RuntimeError: There are no planes available for take off
===============================

The program was developed to enable planes to be instructed to land in and take-off from an airport and for the air traffic controller to be able to confirm that the plane had landed/taken-off. 

The program whas also been developed to take into consideration weather conditions. In stormy weather, planes will be unable to land or take-off. 

The airport has a default capacity of 8. This can be varied at initialization. The airport will not accept any planes beyond it's capacity and will return an error message if there is any attempt to exceed capacity.  
================================



