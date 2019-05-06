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
