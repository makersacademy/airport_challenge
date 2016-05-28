require_relative './lib/plane.rb'    # => true
require_relative './lib/airport.rb'  # => true

geneva = Airport.new  # => #<Airport:0x007ff8a39b3ea0>
plane = Plane.new     # => #<Plane:0x007ff8a39b3cc0>
plane.land            # => nil
plane.report_landed   # => nil
