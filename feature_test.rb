require_relative './lib/plane.rb'
require_relative './lib/airport.rb'
require_relative './lib/weather_report.rb'


B747 = Plane.new
A380 = Plane.new
B777 = Plane.new
SA230 = Plane.new

Geneva = Airport.new
Northolt =Airport.new

weather_report.stormy?

Geneva.land(B747)
Geneva.land(A380)
Geneva.land(B777)
Geneva.depart(B777)
Geneva.depart(B747)
