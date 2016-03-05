require './lib/airport'
require './lib/plane'

ap = Airport.new
plane = Plane.new

print 'Show new Aiport: '
p ap

ap.arrive(plane)
puts
print 'Show Aiport after plane arrived: '
p ap

ap.depart(plane)
puts 
print 'Show Aiport after plane departed: '
p ap

# feature_tests.rb
