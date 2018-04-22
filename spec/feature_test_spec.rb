require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'

def land_plane
  plane = Plane.new
  airport = Airport.new
  airport.land(plane, Weather.new(30))
  airport.planes == [plane]
end

def its_stormy
  weather = Weather.new
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.takeoff(plane, weather)
end

def stormy_landing
  plane = Plane.new
  airport = Airport.new
  airport.land(plane, Weather.new(36))
end

def stormy_takeoff
  plane = Plane.new
  airport = Airport.new
  airport.land(plane, Weather.new(34))
  airport.takeoff(plane, Weather.new(36))
end

def full_airport
  airport = Airport.new
  good_weather = Weather.new(40)
  20.times { airport.land(Plane.new, good_weather) }
  airport.land(Plane.new, good_weather)
end
