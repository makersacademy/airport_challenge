require_relative 'airport'  # => true

# Feature test: 1
# ----------------
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

airport = Airport.new    # => #<Airport:0x007f9602142658 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007f9602142040>]

################################################################################

# Feature test: 2
# ----------------
# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

airport = Airport.new    # => #<Airport:0x007f9602141eb0 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007f9602141cf8>]
airport.take_off         # => #<Plane:0x007f9602141cf8>

################################################################################

# Feature test: 3
# ----------------
# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

airport = Airport.new    # => #<Airport:0x007f96021416e0 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007f96021413c0>]
begin
airport.land(Plane.new)  # => [#<Plane:0x007f96021413c0>, #<Plane:0x007f9602141118>]
rescue RuntimeError=>e
  "Error: #{e}"
end                      # => [#<Plane:0x007f96021413c0>, #<Plane:0x007f9602141118>]

################################################################################

# Feature test: 4
# ----------------
# As an air traffic controller
# So that I can avoid accidents
# I want to prevent airplanes landing or taking off when the weather is stormy

airport = Airport.new    # => #<Airport:0x007f9602140c18 @planes=[], @good_weather=true, @capacity=20>
airport.weather          # => true
airport                  # => #<Airport:0x007f9602140c18 @planes=[], @good_weather=true, @capacity=20>
begin
airport.land(Plane.new)  # => [#<Plane:0x007f9602140790>]
rescue RuntimeError=>e
  "Error: #{e}"
end                      # => [#<Plane:0x007f9602140790>]

#--------------------------------------------------------

airport = Airport.new    # => #<Airport:0x007f9602140538 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007f9602140380>]
airport.weather          # => true
begin
airport.take_off         # => #<Plane:0x007f9602140380>
rescue RuntimeError=>e
  "Error: #{e}"
end                      # => #<Plane:0x007f9602140380>

################################################################################

# Feature test: 5
# ----------------
# As an air traffic controller
# So that I can ensure safe take off procedures
# I want planes only to take off from the airport they are at

airport = Airport.new    # => #<Airport:0x007f960213be70 @planes=[], @good_weather=true, @capacity=20>
begin
airport.take_off
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Cannot take-off an already flying plane"
end                      # => "Error: Cannot take-off an already flying plane"
airport.land(Plane.new)  # => [#<Plane:0x007f960213b308>]
airport.take_off         # => #<Plane:0x007f960213b308>

################################################################################

# Feature test: 6
# ----------------
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

airport = Airport.new      # => #<Airport:0x007f960213ae08 @planes=[], @good_weather=true, @capacity=20>
airport.capacity           # => 20
airport = Airport.new(50)  # => #<Airport:0x007f960213a890 @planes=[], @good_weather=true, @capacity=50>
airport.capacity           # => 50

################################################################################

# Feature test: 7
# ----------------
# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a flying plane cannot take off and cannot be in an airport

airport = Airport.new    # => #<Airport:0x007f960213a1d8 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007f9602139e18>]
airport.take_off         # => #<Plane:0x007f9602139e18>
begin
airport.take_off
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Cannot take-off an already flying plane"
end                      # => "Error: Cannot take-off an already flying plane"
airport.planes           # => []

################################################################################

# Feature test: 8
# ----------------
# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a plane that is not flying cannot land and must be in an airport




################################################################################
