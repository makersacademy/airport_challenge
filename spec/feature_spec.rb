require 'plane'
require 'airport'

#makes a new plane
plane = Plane.new

#makes a new airport
airport = Airport.new

#let a plane land at an airport
airport.land(plane) #=>

#check if the airport has the landed plane
#airport.plane #=> plane
