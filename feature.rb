require_relative './lib/airport.rb'
require_relative './lib/plane.rb'
require_relative './lib/weather.rb'

american_1 = Plane.new
lufthansa_1 = Plane.new

heathrow = Airport.new
frankfurt = Airport.new

heath_weather = Weather.new
frank_weather = Weather.new


frankfurt.arrive(american_1, frank_weather)
frankfurt.arrive(lufthansa_1, frank_weather)

frankfurt.planes

frankfurt.depart(lufthansa_1, frank_weather)
frankfurt.planes


heathrow.arrive(lufthansa_1, heath_weather)
heathrow.planes
frankfurt.planes


