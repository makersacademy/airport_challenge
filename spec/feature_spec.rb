require_relative '../lib/airport.rb'

# Instantiate new Airport object, with hangar capacity of 5
heathrow = Airport.new(5)

# Instantiate new Plane object. Default status 'Flying'
boeing = Plane.new

# Land first plane at airport. Plane status set to landed.
heathrow.land_plane(boeing)

# Take off plane from the airport hangar. Plane status set to flying.
heathrow.take_off_plane
