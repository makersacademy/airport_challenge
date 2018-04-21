# To use : irb -r './spec/feature_tests.rb'

require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

def plane_land
  plane = Plane.new
  airport = Airport.new
  weather = Weather.new
  airport.plane_lands(plane)
  p airport.planes
  p plane.landed
end

plane_land

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# Note: Weather is random
def plane_take_off
  plane = Plane.new
  airport = Airport.new
  weather = Weather.new
  airport.planes << plane
  airport.plane_take_off(plane, weather)
  p airport.planes
  p plane.landed
end

plane_take_off

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

# Note: Weather is random
def prevent_take_off
  plane = Plane.new
  airport = Airport.new
  weather = Weather.new
  airport.planes << plane
  airport.plane_take_off(plane, weather)
  p airport.planes
  p plane.landed
end

prevent_take_off
