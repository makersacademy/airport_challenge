# feature_test
require './lib/airport'

print airport = Airport.new
puts
airport.capacity = 10
puts
print 5.times { airport.land(Plane.new) }
puts
print 6.times { airport.land(Plane.new) }
puts
print 10.times { airport.land(Plane.new) }
puts
print 11.times { airport.land(Plane.new) }
