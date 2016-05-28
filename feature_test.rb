require_relative './lib/plane.rb'    # => true
require_relative './lib/airport.rb'  # => false

plane = Plane.new         # => #<Plane:0x007ff212189668>
airport = Airport.new(3)  # => #<Airport:0x007ff212189488 @planes=[], @capacity=3>
airport.land(plane)       # => [#<Plane:0x007ff212189668>]
plane2 = Plane.new        # => #<Plane:0x007ff212189028>
plane3 = Plane.new        # => #<Plane:0x007ff212188e48>
airport.land(plane2)      # => [#<Plane:0x007ff212189668>, #<Plane:0x007ff212189028>]
airport.land(plane3)      # => [#<Plane:0x007ff212189668>, #<Plane:0x007ff212189028>, #<Plane:0x007ff212188e48>]
plane4 = Plane.new        # => #<Plane:0x007ff2121887b8>
airport.depart(plane4)    # => #<Plane:0x007ff212188e48>
airport.depart(plane3)    # => #<Plane:0x007ff212189028>
airport.depart(plane2)    # => #<Plane:0x007ff212189668>
airport.depart(plane)     # ~> RuntimeError: No planes at airport

# ~> RuntimeError
# ~> No planes at airport
# ~>
# ~> /Users/sdawes/Documents/projects/airport_challenge/lib/airport.rb:21:in `depart'
# ~> /Users/sdawes/Documents/projects/airport_challenge/feature_test.rb:15:in `<main>'
