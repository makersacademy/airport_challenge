require_relative 'airport'  # => true

# Feature test: 1
# ----------------
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

airport = Airport.new    # => #<Airport:0x007fcd7d05ce70>
airport.land(Plane.new)  # => #<Plane:0x007fcd7d05cd08>

##################################################################

# Feature test: 2
# ----------------
# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

aiport = Airport.new        # => #<Airport:0x007fcd7d05cba0>
aiport.take_off(Plane.new)  # => nil

##################################################################

# Feature test: 3
# ----------------
# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

airport = Airport.new    # => #<Airport:0x007fcd7d05c970>
airport.land(Plane.new)  # => #<Plane:0x007fcd7d05c7e0>
begin
airport.land(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Airport is full!"
end                      # => "Error: Airport is full!"
##################################################################
