require './lib/airport.rb'
require './lib/plane.rb'

airport = Airport.new
planes = (0..9).map{Plane.new}
planes.each{|plane| plane.land(airport)}
planes[-1].take_off(airport)
plane = Plane.new
plane.land(airport)
