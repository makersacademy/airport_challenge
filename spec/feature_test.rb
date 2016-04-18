=begin
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
=end


#passanger - no passengers yet in requirements
#plane .land(takes airport argument)
#plane  .landed?
#airport - takes a plane object


require "./lib/airport"
plane = Plane.new
heathrow = Airport.new
heathrow.land(plane)
heathrow.plane_holder


#fails to land need to create an airport object which store plane
#passes feature test and unit tests.

=begin

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
=end


require "./lib/airport"
plane = Plane.new
heathrow = Airport.new
heathrow.land(plane)
heathrow.plane_holder
heathrow.take_off(plane)
heathrow.plane_holder

=begin
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
=end


require "./lib/airport"
plane = Plane.new
heathrow = Airport.new
heathrow.land(plane)
heathrow.plane_holder
plane.weather = true
heathrow.take_off(plane)
heathrow.plane_holder


=begin
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
=end
require "./lib/airport"
plane = Plane.new
heathrow = Airport.new
plane.weather = true
heathrow.land(plane)
heathrow.plane_holder

=begin
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
=end

require "./lib/airport"
plane1 = Plane.new
plane1.weather = false
plane2 = Plane.new
plane2.weather = false
plane3 = Plane.new
plane3.weather = false
plane4 = Plane.new
plane4.weather = false
plane5 = Plane.new
plane5.weather = false
plane6 = Plane.new
plane6.weather = false
plane7 = Plane.new
plane7.weather = false
plane8 = Plane.new
plane8.weather = false
plane9 = Plane.new
plane9.weather = false
plane10 = Plane.new
plane10.weather = false
plane11 = Plane.new
plane11.weather = false
heathrow = Airport.new
heathrow.land(plane1)
heathrow.land(plane2)
heathrow.land(plane3)
heathrow.land(plane4)
heathrow.land(plane5)
heathrow.land(plane6)
heathrow.land(plane7)
heathrow.land(plane8)
heathrow.land(plane9)
heathrow.land(plane10)
heathrow.plane_holder
heathrow.land(plane11)
heathrow.plane_holder

=begin
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
=end


require "./lib/airport"
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
plane5 = Plane.new
heathrow = Airport.new(4)
heathrow.land(plane1)
heathrow.land(plane2)
heathrow.land(plane3)
heathrow.land(plane4)
heathrow.land(plane5)






