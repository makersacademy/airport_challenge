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
  weather = Weather.new(90)
  airport.plane_lands(plane, weather)
  p airport.planes
  p plane.landed
end

plane_land

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

def plane_take_off
  plane = Plane.new(true)
  airport = Airport.new
  weather = Weather.new(90)
  airport.planes << plane
  airport.plane_take_off(plane, weather)
  p airport.planes
  p plane.landed
end

plane_take_off

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

def prevent_take_off
  plane = Plane.new(true)
  airport = Airport.new
  weather = Weather.new(5)
  airport.planes << plane
  airport.plane_take_off(plane, weather)
  p airport.planes
  p plane.landed
end

# prevent_take_off

# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

def prevent_landing
  plane = Plane.new
  airport = Airport.new
  weather = Weather.new(5)
  airport.plane_lands(plane, weather)
  p airport.planes
  p plane.landed
end

# prevent_landing

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

def prevent_landing_when_full_default_cap
  plane = Plane.new
  landed_plane = Plane.new(true)
  airport = Airport.new
  airport.planes.concat [landed_plane, landed_plane]
  weather = Weather.new(90)
  airport.plane_lands(plane, weather)
  p airport.planes
  p plane.landed
end

# prevent_landing_when_full_default_cap

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

def capacity
  airport = Airport.new
  p airport.capacity
  airport.capacity = 3
  p airport.capacity
end

capacity

# Edge cases

# As the system designer
# So that the software is robust
# Planes can only take off from the airport they are in

def plane_take_off_edgecase
  plane = Plane.new(true)
  plane2 = Plane.new(true)
  airport = Airport.new
  airport.planes << plane
  airport.plane_take_off(plane2)
  p airport.planes
  p plane2.landed
end

# plane_take_off_edgecase

# As the system designer
# So that the software is robust
# Planes that are already in airport cannot land in it again

def plane_landed_edgecase
  plane = Plane.new(true)
  airport = Airport.new
  airport.planes << plane
  airport.plane_lands(plane)
  p airport.planes
  p plane.landed
end

# plane_landed_edgecase

# As the system designer
# So that the software is robust
# Planes that are already in another airport cannot land again

def plane_landed_edgecase2
  plane = Plane.new(true)
  airport = Airport.new
  airport2 = Airport.new
  airport.planes << plane
  airport2.plane_lands(plane)
  p airport.planes
  p airport2.planes
  p plane.landed
end

# plane_landed_edgecase2

# As the system designer
# So that the software is robust
# Planes already in air cannot take off again

def plane_take_off_edgecase2
  plane = Plane.new(true)
  plane.take_off
  plane.take_off
end

# plane_take_off_edgecase2
