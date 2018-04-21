require_relative '../lib/plane'
require_relative '../lib/airport'
require_relative '../lib/weather'

def land_plane
  plane = Plane.new
  airport = Airport.new
  airport.land(plane, Weather.new(30))
  airport.planes == [plane]
end

def takeoff_plane
  plane = Plane.new
  airport = Airport.new
  weather = Weather.new(30)
  airport.land(plane, weather)
  airport.take_off(plane, weather)
  airport.planes == []
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
  calm_weather = Weather.new(34)
  20.times { airport.land(Plane.new, calm_weather) }
  airport.land(Plane.new, calm_weather)
end

def full_test
  heathrow = Airport.new
  hong_kong = Airport.new
  plane1 = Plane.new
  plane2 = Plane.new
  calm_weather = Weather.new(10)
  stormy_weather = Weather.new(38)
  heathrow.land(plane1, calm_weather)
  hong_kong.land(plane2, calm_weather)
  p "*" * 10
  p "Before takeoff"
  p "*" * 10
  p heathrow.planes
  p hong_kong.planes
  heathrow.take_off(plane1, calm_weather)
  hong_kong.take_off(plane2, calm_weather)
  p "*" * 10
  p "After takeoff"
  p "*" * 10
  p plane1
  p plane2
  heathrow.land(plane2, calm_weather)
  hong_kong.land(plane1, calm_weather)
  p "*" * 10
  p "After Landing"
  p "*" * 10
  p heathrow.planes
  p hong_kong.planes
end

def code_example_1
  require './lib/airport'
  require './lib/plane'
  require './lib/weather'

  calm_weather = Weather.new(Weather::STORMY_WIND_SPEED - 1)
  houston_airport = Airport.new
  gatwick_airport = Airport.new
  airbus_a380 = Plane.new

  houston_airport.land(airbus_a380, calm_weather)
  houston_airport.planes # => [airbus_a380]

  houston_airport.take_off(airbus_a380, calm_weather)
  houston_airport.planes # => []

  gatwick_airport.land(airbus_a380, calm_weather)
  gatwick_airport.planes # => [airbus_a380]
end

def code_example_2
  require './lib/airport'
  require './lib/plane'
  require './lib/weather'

  stormy_weather = Weather.new(Weather::STORMY_WIND_SPEED)
  houston_airport = Airport.new
  airbus_a380 = Plane.new

  houston_airport.land(airbus_a380, stormy_weather) # => It's too stormy!
end

def code_example_3
  require './lib/airport'

  houston_airport = Airport.new(45)
  houston_airport.capacity # => 45
end
