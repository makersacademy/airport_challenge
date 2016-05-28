require_relative './lib/plane.rb'             # => true
require_relative './lib/airport.rb'           # => true


plane = Plane.new            # => #<Plane:0x007fde539be388 @flying=true>
Geneva = Airport.new(20, 5)  # => #<Airport:0x007fde539be158 @weather_reporter=20, @capacity=5, @planes=[]>
Geneva.land(plane)           # ~> NoMethodError: undefined method `stormy?' for 20:Fixnum

# ~> NoMethodError
# ~> undefined method `stormy?' for 20:Fixnum
# ~>
# ~> /Users/sdawes/Documents/projects/airport_challenge/lib/airport.rb:38:in `stormy?'
# ~> /Users/sdawes/Documents/projects/airport_challenge/lib/airport.rb:16:in `land'
# ~> /Users/sdawes/Documents/projects/airport_challenge/feature_test.rb:7:in `<main>'
