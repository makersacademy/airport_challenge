require_relative '../lib/plane'
require_relative '../lib/airport'
require_relative '../lib/weather'

def land_plane
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.planes == [plane]
end

def takeoff_plane
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.take_off(plane)
  airport.planes == []
end

def stormy_landing
  calm_weather = Weather.new(34)
  stormy_weather = Weather.new(36)
  plane = Plane.new
  airport = Airport.new
  airport.land(plane, stormy_weather)
end

def stormy_takeoff
  calm_weather = Weather.new(34)
  stormy_weather = Weather.new(36)
  plane = Plane.new
  airport = Airport.new
  airport.land(plane, calm_weather)
  airport.take_off(plane, stormy_weathere)
end

def full_airport
  airport = Airport.new
  calm_weather = Weather.new(34)
  20.times { airport.land(Plane.new, calm_weather) }
  airport.land(Plane.new, calm_weather)
end
