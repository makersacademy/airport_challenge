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
  airport.take_off(plane, weather)
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
  airport.take_off(plane, Weather.new(36))
end

def full_airport
  airport = Airport.new
  calm_weather = Weather.new(40)
  20.times { airport.land(Plane.new, calm_weather) }
  airport.land(Plane.new, calm_weather)
end
