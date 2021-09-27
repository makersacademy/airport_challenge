# # Require files
# require_relative '../lib/airport.rb'
# require_relative '../lib/plane.rb'
# require_relative '../lib/weather.rb'

# # ***Feature Tests***

# # Create Airport object
# airport = Airport.new
# puts airport
# puts "Airport default capacity is 10."

# # Create Plane object
# plane = Plane.new

# # Specific tests
# puts "Override capacity to 50:"
# airport_override_capacity = Airport.new(50)
# puts airport_override_capacity 

# puts "Plane can land"
# plane_land = Plane.new
# weather = double(:Weather, :stormy? => false)
# plane_land.land(plane_land, weather)

# puts "Plane can take off"
# plane_takeoff = Plane.new
# weather = double(:Weather, :stormy? => false)
# plane_takeoff.takeoff(plane_takeoff, weather)

# puts "Plane cannot land when airport full"
# plane = Plane.new
# airport = Airport.new
# weather = double(:stormy? => false)
# 10.times { airport.land(plane, weather) } 
# airport.land(plane, weather)

# puts "Plane cannot land when stormy"
# plane = Plane.new
# airport = Airport.new
# weather = double(:stormy? => true)
# plane.land(plane, weather)

# puts "Plane cannot take off when stormy"
# plane = Plane.new
# airport = Airport.new
# weather = double(:stormy? => true)
# plane.takeoff(plane, weather)

# puts "Plane already flying cannot takeoff"
# plane = Plane.new
# airport = Airport.new
# weather = double(:stormy? => false)
# airport.takeoff(plane, weather)
# plane.planes_flying(subject)
# plane.flying?(subject)
# plane.edge_flying(plane, airport)

# puts 'Plane already flying cannot be at airport'
# plane = Plane.new
# airport = Airport.new
# weather = double(:stormy? => false)
# airport.takeoff(plane, weather)
# airport.at_airport?(plane, airport)
# plane.edge_flying(plane, airport)

# puts 'Planes already landed cannot land again'
# plane = Plane.new
# airport = Airport.new
# weather = double(:stormy? => false)
# airport.land(plane, weather)
# plane.edge_landed(plane, airport)

# puts 'Planes can only takeoff from the airport it landed'
# plane = Plane.new
# airport = Airport.new
# weather = double(:stormy? => false)
# airport.land(plane, weather)
# another_airport = Airport.new
# another_airport.takeoff(plane, weather)
# plane.wrong_airport(airport, another_airport)
