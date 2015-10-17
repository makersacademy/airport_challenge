require_relative 'airport'  # => true

# Feature test: 1
# ----------------
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

airport = Airport.new    # => #<Airport:0x007fef1385a818 @good_weather=true>
airport.land(Plane.new)  # => #<Plane:0x007fef1385a548>

##################################################################

# Feature test: 2
# ----------------
# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

airport = Airport.new    # => #<Airport:0x007fef1385a200 @good_weather=true>
airport.land(Plane.new)  # => #<Plane:0x007fef13859f58>
airport.take_off         # => #<Plane:0x007fef13859f58>

##################################################################

# Feature test: 3
# ----------------
# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

airport = Airport.new    # => #<Airport:0x007fef13859a08 @good_weather=true>
airport.land(Plane.new)  # => #<Plane:0x007fef13859738>
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

airport = Airport.new    # => #<Airport:0x007fef138590d0 @good_weather=true>
airport.weather          # => false
airport                  # => #<Airport:0x007fef138590d0 @good_weather=false>
begin
airport.land(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Landing denied. Weather is stormy!"
end                      # => "Error: Landing denied. Weather is stormy!"

#--------------------------------------------------------

airport = Airport.new    # => #<Airport:0x007fef138584f0 @good_weather=true>
airport.land(Plane.new)  # => #<Plane:0x007fef138581f8>
airport.weather          # => false
begin
airport.take_off
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Take-off denied. Weather is stormy!"
end                      # => "Error: Take-off denied. Weather is stormy!"

##################################################################

# Feature test: 5
# ----------------
# As an air traffic controller
# So that I can ensure safe take off procedures
# I want planes only to take off from the airport they are at

airport = Airport.new    # => #<Airport:0x007fef13853c98 @good_weather=true>
begin
airport.take_off
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: No plane at airport"
end                      # => "Error: No plane at airport"
airport.land(Plane.new)  # => #<Plane:0x007fef138533b0>
airport.take_off         # => #<Plane:0x007fef138533b0>
