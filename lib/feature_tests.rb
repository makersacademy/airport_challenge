
require './plane.rb'
require './airport.rb'

cardif = Airport.new
21.times { cardif.land_plane(Plane.new) }
