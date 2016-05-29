require_relative './lib/plane.rb'           # => true
require_relative './lib/airport.rb'         # => false
require_relative './lib/weather_report.rb'  # => true


B747 = Plane.new   # => #<Plane:0x007fda1c24b410 @in_air=true>
A380 = Plane.new   # => #<Plane:0x007fda1c24b1e0 @in_air=true>
B777 = Plane.new   # => #<Plane:0x007fda1c24afd8 @in_air=true>
SA230 = Plane.new  # => #<Plane:0x007fda1c24add0 @in_air=true>

Geneva = Airport.new   # => #<Airport:0x007fda1c24abc8 @capacity=3, @parking_area=[]>
Northolt =Airport.new  # => #<Airport:0x007fda1c24a970 @capacity=3, @parking_area=[]>

Geneva.land(B747)  # => [#<Plane:0x007fda1c24b410 @in_air=false, @airport=#<Airport:0x007fda1c24abc8 @capacity=3, @parking_area=[...]>>]
