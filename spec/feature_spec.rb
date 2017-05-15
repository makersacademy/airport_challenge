require './lib/airport'
require './lib/plane'
require './lib/weather'

# Instruct planes to land at airport, confirm landing
airport = Airport.new
plane = Plane.new
airport.land_plane(plane)

# Instruct planes to take off from airport, confirm takeoff
airport = Airport.new
plane = Plane.new
airport.land_plane(plane)
airport.takeoff_plane(plane)

# Check if stormy
airport = Airport.new
airport.stormy?

# Return planes in hangar
airport = Airport.new
plane = Plane.new
airport.land_plane(plane)
airport.check_hangar

# Return empty notification if no planes in hangar
airport = Airport.new
airport.check_hangar
