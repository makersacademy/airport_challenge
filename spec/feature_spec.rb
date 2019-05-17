require './lib/airport.rb'
require './lib/weather'
require './lib/plane'
airport = Airport.new
weather = Weather.new
plane = Plane.new

plane.land(weather)
plane.take_off(weather)
weather

airport.hello(plane)
49.times {airport.hello(Plane.new) }
#airport.hello(Plane.new)
airport
airport.byebye(plane)