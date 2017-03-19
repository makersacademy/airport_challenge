require './lib/plane'
require './lib/airport'
require './lib/weather'

weather = Stormy_Weather.new.report

plane = Plane.new
airport = Airport.new(5)
