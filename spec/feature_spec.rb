require './lib/Airport.rb'

heathrow = Airport.new
plane = Plane.new
heathrow.land(plane)
heathrow.hangar
