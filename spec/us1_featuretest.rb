require './lib/software_airport'

# create envirionment for test: airport, plane, etc
# airport = Airport.new
plane = Plane.new

# simulate user input in software
# requesting list of fleet to identify 'plane'
Plane.list_planes

# requesting 'plane' to 'land' at allocated destination
plane.land
