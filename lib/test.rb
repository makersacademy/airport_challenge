load 'airport.rb'
load 'plane.rb'
load 'air_traffic_controller.rb'
load 'weather.rb'

weather = Weather.new
heathrow = Airport.new
gatwick = Airport.new
plane = Plane.new(airport)
atc = AirTrafficController.new
