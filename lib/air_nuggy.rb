require_relative 'plane'
require_relative 'airport'


puts ""
airport = Airport.new("not full", 10)
plane = Plane.new
#airport.take_off(5)
airport.stormy = true

airport.land_plane(plane, 5)
