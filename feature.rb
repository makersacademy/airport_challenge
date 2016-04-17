require './lib/airport.rb'
require './lib/plane.rb'

# User story 1:
# Instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.in_airport?(plane)

# User story 2:
# Instruct a plane to take off from an airport and confirm this
# Will need to revisit this when rewriting into Rspec


airport.take_off(plane)

# User story 3:
# I want to prevent take off when weather is stormy
# Will need to revisit this when rewriting into Rspec

airport.land(plane)
airport.take_off(plane)

# User story 4:
# I want to prevent landing when weather is stormy
# Will need to revisit this when rewriting into Rspec

airport.land(plane)

# You can't land a plane which has already landed

# puts airport.land(plane)

# User story 5
# I want to prevent landing when the airport is full

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate




