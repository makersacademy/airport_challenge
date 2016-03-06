require_relative 'plane'
require_relative 'airport'


airport = Airport.new
p 1
p airport.planes
p 2
p airplane = Plane.new
p
airplane.land(airport)
p 3.1
#p airport.stormy?
p 3.2
p airport.planes
p 4
p airplane.take_off(airport)
#airport.allow_take_off(airplane)#[0]

p 5
p airplane

p 6
p airport.planes
