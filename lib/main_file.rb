require './lib/airport.rb'
require './lib/plane.rb'
require './lib/air_traffic_controller.rb'

london_city = Airport.new(50, "LCY")
easejet_plane = Plane.new("FCO")
atc = Air_traffic_controller.new
atc.land(london_city, easejet_plane)
