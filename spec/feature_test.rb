require 'airport.rb'

airport = Airport.new
plane = Plane.new
weather = Weather.new

"plane status"
p "#{airport}"
p "#{plane}"

"plane land"
p "#{airport.land(plane)}"
