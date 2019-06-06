# take off
# require './lib/airport.rb'
# => true
# airport = Airport.new
# => #<Airport:0x00007ff7f1910b18>
# plane = airport.take_off
# => #<Plane:0x00007ff7f1908490>

# landing
# require './lib/airport.rb'
# => true
# require './lib/plane'
# => false
# airport = Airport.new
# => #<Airport:0x00007fe37697c348>
# plane = Plane.new
# => #<Plane:0x00007fe376974648>
# airport.land(plane)
# => nil

# plane
# require './lib/airport.rb'
# => true
# require './lib/plane'
# => false
# plane = Plane.new
# => #<Plane:0x00007ffa5f127b98>
# airport = Airport.new
# => #<Airport:0x00007ffa5f11fcb8>
# airport.land(plane)
# => #<Plane:0x00007ffa5f127b98>
# airport.plane
# => #<Plane:0x00007ffa5f127b98>

# confirm take off
# require './lib/airport.rb'
# => true
# require './lib/plane'
# => false
# airport = Airport.new
# => #<Airport:0x00007f895c8b46c8 @planes=[]>
# plane = Plane.new
# => #<Plane:0x00007f895c8ac950>
# airport.land(plane)
# => [#<Plane:0x00007f895c8ac950>]
# airport.take_off
# => #<Plane:0x00007f895c8ac950>
# airport.planes.count
# => 0

# default capacity
# require './lib/airport.rb'
#  => true
# airport = Airport.new
# #<Airport:0x00007f80a20eb800 @planes=[], @capacity=10>
# plane = Plane.new
#  => #<Plane:0x00007f80a20e3920>
# airport.land(plane)
#  => [#<Plane:0x00007f80a20e3920>]
# 10.times { airport.land(plane) }
# Traceback (most recent call last):
#         5: from /Users/yems/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
#         4: from (irb):5
#         3: from (irb):5:in `times'
#         2: from (irb):5:in `block in irb_binding'
#         1: from /Users/yems/Projects/airport_challenge/lib/airport.rb:14:in `land'
# RuntimeError (Airport full)

# variable capacity at initialization
# require './lib/airport.rb'
#  => true
# airport = Airport.new(100)
# => #<Airport:0x00007f9faa138ca0 @planes=[], @capacity=100>
# plane = Plane.new
# #<Plane:0x00007f9faa130f78>
# 100.times { airport.land(plane) }
#  => 100
# airport.land(plane)
# Traceback (most recent call last):
#         3: from /Users/yems/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
#         2: from (irb):6
#         1: from /Users/yems/Projects/airport_challenge/lib/airport.rb:14:in `land'
# RuntimeError (Airport full)
