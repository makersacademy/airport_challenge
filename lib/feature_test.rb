require_relative 'airport'  # => true

# Feature test: 1
# ----------------
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

airport = Airport.new    # => #<Airport:0x007fd0b2851198>
airport.land(Plane.new)  # => nil

##################################################################

# Feature test: 2
# ----------------
# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

aiport = Airport.new        # => #<Airport:0x007fd0b2850f40>
aiport.take_off(Plane.new)  # => nil

##################################################################
