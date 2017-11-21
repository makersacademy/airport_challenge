require 'airport'
require 'plane'

airport = Airport.new
plane = Plane.new
weather = Weather.new
plane.flying?

airport.land(plane, weather)
p plane.landed?
p airport
airport.take_off(plane, weather)
p plane.flying?
p airport
