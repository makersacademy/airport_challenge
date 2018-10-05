require './lib/Airport.rb'
require './lib/Plane.rb'

heathrow = Airport.new
plane = Plane.new
heathrow.land(plane)
heathrow.take_off(plane)
heathrow.hangar
