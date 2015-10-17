require_relative 'airport'  # => true

# Feature test: 1
# ----------------
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

airport = Airport.new    # => #<Airport:0x007f9554060b58 @good_weather=true>
airport.land(Plane.new)  # => #<Plane:0x007f95540609f0>

##################################################################

# Feature test: 2
# ----------------
# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

aiport = Airport.new        # => #<Airport:0x007f9554060888 @good_weather=true>
aiport.take_off(Plane.new)  # => #<Plane:0x007f9554060748>

##################################################################

# Feature test: 3
# ----------------
# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

airport = Airport.new    # => #<Airport:0x007f9554060630 @good_weather=true>
airport.land(Plane.new)  # => #<Plane:0x007f95540604f0>
begin
airport.land(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Airport is full!"
end                      # => "Error: Airport is full!"

##################################################################

# Feature test: 4
# ----------------
# As an air traffic controller
# So that I can avoid accidents
# I want to prevent airplanes landing or taking off when the weather is stormy

airport = Airport.new        # => #<Airport:0x007f9554060180 @good_weather=true>
airport.weather              # => false
airport                      # => #<Airport:0x007f9554060180 @good_weather=false>
begin
airport.land(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"              # => "Error: Denied. Weather is stormy!"
end                          # => "Error: Denied. Weather is stormy!"
begin
airport.take_off(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"              # => "Error: Denied. Weather is stormy!"
end                          # => "Error: Denied. Weather is stormy!"

##################################################################

# Feature test: 5
# ----------------
# As an air traffic controller
# So that I can ensure safe take off procedures
# I want planes only to take off from the airport they are at
