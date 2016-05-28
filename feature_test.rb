require_relative './lib/plane.rb'    # => true
require_relative './lib/airport.rb'  # => false

plane1 = Plane.new  # => #<Plane:0x007fab9300a0c8>
plane2 = Plane.new  # => #<Plane:0x007fab93009ee8>
plane3 = Plane.new  # => #<Plane:0x007fab93009d08>

Geneva = Airport.new  # => #<Airport:0x007fab93009b28 @planes=[]>
Geneva.land(plane1)   # => [#<Plane:0x007fab9300a0c8>]
Geneva.land(plane2)   # => [#<Plane:0x007fab9300a0c8>, #<Plane:0x007fab93009ee8>]
Geneva.land(plane3)   # => [#<Plane:0x007fab9300a0c8>, #<Plane:0x007fab93009ee8>, #<Plane:0x007fab93009d08>]

Geneva.depart(plane3)  # => #<Plane:0x007fab93009d08>
Geneva                 # => #<Airport:0x007fab93009b28 @planes=[#<Plane:0x007fab9300a0c8>, #<Plane:0x007fab93009ee8>]>
