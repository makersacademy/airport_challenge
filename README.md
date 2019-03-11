# Airport Simulator Challenge
This is a ruby program designed to simulate planes taking-off & landing at an airport.

# Instructions

To run, first open the Airport_Challenge directory in irb.

To require all relevant files - input this code into irb:

2.5.0 :001 > Dir["./lib/*.rb"].each { |file| require file }

To add a plane & airport to the enviroment:

2.5.0 :002 > airport = Airport.new
2.5.0 :003 > plane = Plane.new

To take off & land input:

2.5.0 :004 > airport.land(plane)
2.5.0 :005 > airport.take_off(plane)

# Version

V 1.0

# Built Using

Ruby, Rspec, RVM
