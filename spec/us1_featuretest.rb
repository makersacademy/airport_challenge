require './lib/software_airport'

# create envirionment for test: airport, plane, etc
# airport = Airport.new
puts "Create a 'plane'"
plane = Plane.new

# check initialization of status
puts "\nCheck status of new plane"
puts plane.status

# simulate user input in software
puts "\nRetrieve list of planes"
puts Plane.list_planes

# requesting 'plane' to 'land' at allocated destination
puts "\nSet status of plane to 'in_air' and land plane"
plane.status = "in_air"
puts plane.status
plane.land
puts plane.status

"Feature tests passed if results are expected"
