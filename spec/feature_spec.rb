require "./lib/airport"
require "./lib/plane"
require "./lib/weather_station"
require "./lib/air_traffic_control"

control = AirTrafficControl.new

leeds_bradford = Airport.new
heathrow = Airport.new

plane_1 = Plane.new
plane_2 = Plane.new
plane_3 = Plane.new
plane_4 = Plane.new
plane_5 = Plane.new
plane_6 = Plane.new
plane_7 = Plane.new
plane_8 = Plane.new
plane_9 = Plane.new
plane_10 = Plane.new

#control.land_plane(plane_1, heathrow)
