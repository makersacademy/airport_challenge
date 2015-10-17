require_relative 'airport'  # => true

# Feature test: 1
# ----------------
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

airport = Airport.new    # => #<Airport:0x007fd9f2821080 @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => #<Plane:0x007fd9f2820dd8>

################################################################################

# Feature test: 2
# ----------------
# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

airport = Airport.new    # => #<Airport:0x007fd9f2820b58 @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => #<Plane:0x007fd9f2820838>
airport.take_off         # => #<Plane:0x007fd9f2820838>

################################################################################

# Feature test: 3
# ----------------
# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

airport = Airport.new    # => #<Airport:0x007fd9f2820338 @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => #<Plane:0x007fd9f28200b8>
begin
airport.land(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Airport is full!"
end                      # => "Error: Airport is full!"

################################################################################

# Feature test: 4
# ----------------
# As an air traffic controller
# So that I can avoid accidents
# I want to prevent airplanes landing or taking off when the weather is stormy

airport = Airport.new    # => #<Airport:0x007fd9f281bbf8 @good_weather=true, @capacity=20>
airport.weather          # => true
airport                  # => #<Airport:0x007fd9f281bbf8 @good_weather=true, @capacity=20>
begin
airport.land(Plane.new)  # => #<Plane:0x007fd9f281b338>
rescue RuntimeError=>e
  "Error: #{e}"
end                      # => #<Plane:0x007fd9f281b338>

#--------------------------------------------------------

airport = Airport.new    # => #<Airport:0x007fd9f281afc8 @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => #<Plane:0x007fd9f281ae60>
airport.weather          # => false
begin
airport.take_off
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Take-off denied. Weather is stormy!"
end                      # => "Error: Take-off denied. Weather is stormy!"

################################################################################

# Feature test: 5
# ----------------
# As an air traffic controller
# So that I can ensure safe take off procedures
# I want planes only to take off from the airport they are at

airport = Airport.new    # => #<Airport:0x007fd9f281a9d8 @good_weather=true, @capacity=20>
begin
airport.take_off
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: No plane at airport"
end                      # => "Error: No plane at airport"
airport.land(Plane.new)  # => #<Plane:0x007fd9f281a5f0>
airport.take_off         # => #<Plane:0x007fd9f281a5f0>

################################################################################

# Feature test: 6
# ----------------
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

airport = Airport.new      # => #<Airport:0x007fd9f281a370 @good_weather=true, @capacity=20>
airport.capacity           # => 20
airport = Airport.new(50)  # => #<Airport:0x007fd9f281a0c8 @good_weather=true, @capacity=50>
airport.capacity           # => 50

################################################################################
