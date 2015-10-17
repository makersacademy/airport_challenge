require_relative 'airport'  # => true

# Feature test: 1
# ----------------
# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

airport = Airport.new    # => #<Airport:0x007fbc0c130ce8 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007fbc0c130b08>]

################################################################################

# Feature test: 2
# ----------------
# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off

airport = Airport.new    # => #<Airport:0x007fbc0c1309c8 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007fbc0c130810>]
airport.take_off         # => #<Plane:0x007fbc0c130810>

################################################################################

# Feature test: 3
# ----------------
# As an air traffic controller
# So that I can avoid collisions
# I want to prevent airplanes landing when my airport if full

airport = Airport.new                 # => #<Airport:0x007fbc0c1305b8 @planes=[], @good_weather=true, @capacity=20>
20.times { airport.land(Plane.new) }  # => 20
begin
airport.land(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"                       # => "Error: Airport is full!"
end                                   # => "Error: Airport is full!"

################################################################################

# Feature test: 4
# ----------------
# As an air traffic controller
# So that I can avoid accidents
# I want to prevent airplanes landing or taking off when the weather is stormy

airport = Airport.new    # => #<Airport:0x007fbc0c12bc70 @planes=[], @good_weather=true, @capacity=20>
airport.weather          # => false
airport                  # => #<Airport:0x007fbc0c12bc70 @planes=[], @good_weather=false, @capacity=20>
begin
airport.land(Plane.new)
rescue RuntimeError=>e
  "Error: #{e}"          # => "Error: Landing denied. Weather is stormy!"
end                      # => "Error: Landing denied. Weather is stormy!"

#--------------------------------------------------------

airport = Airport.new    # => #<Airport:0x007fbc0c12b1d0 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007fbc0c12afa0>]
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

airport = Airport.new    # => #<Airport:0x007fbc0c12aac8 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007fbc0c12a8e8>]
airport.take_off         # => #<Plane:0x007fbc0c12a8e8>

################################################################################

# Feature test: 6
# ----------------
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

airport = Airport.new      # => #<Airport:0x007fbc0c12a690 @planes=[], @good_weather=true, @capacity=20>
airport.capacity           # => 20
airport = Airport.new(50)  # => #<Airport:0x007fbc0c12a320 @planes=[], @good_weather=true, @capacity=50>
airport.capacity           # => 50

################################################################################

# Feature test: 7
# ----------------
# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a flying plane cannot take off and cannot be in an airport

airport = Airport.new    # => #<Airport:0x007fbc0c12a028 @planes=[], @good_weather=true, @capacity=20>
airport.land(Plane.new)  # => [#<Plane:0x007fbc0c129e48>]
airport.take_off         # => #<Plane:0x007fbc0c129e48>
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

airport = Airport.new                # => #<Airport:0x007fbc0c1298d0 @planes=[], @good_weather=true, @capacity=20>
2.times { airport.land(Plane.new) }  # => 2
airport.planes                       # => [#<Plane:0x007fbc0c129718>, #<Plane:0x007fbc0c1296f0>]
begin
airport.land(airport.planes[0])
rescue RuntimeError=>e
  "Error: #{e}"                      # => "Error: Plane has already landed and is in airport"
end                                  # => "Error: Plane has already landed and is in airport"
airport.planes                       # => [#<Plane:0x007fbc0c129718>, #<Plane:0x007fbc0c1296f0>]

################################################################################

# Feature test: 9
# ----------------
# As an air traffic controller
# So the system is consistent and correctly reports plane status and location
# I want to ensure a plane that has taken off from an airport is no longer in that airport

airport = Airport.new                # => #<Airport:0x007fbc0c1290d8 @planes=[], @good_weather=true, @capacity=20>
2.times { airport.land(Plane.new) }  # => 2
airport.planes                       # => [#<Plane:0x007fbc0c128e80>, #<Plane:0x007fbc0c128e58>]
2.times { airport.take_off }         # => 2
airport.planes                       # => []
