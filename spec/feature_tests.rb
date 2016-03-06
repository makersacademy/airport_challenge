require './lib/airport'
require './lib/plane'
require './lib/weather'

gatwick = Airport.new
plane = Plane.new

print 'Show new Aiport: '
p gatwick

gatwick.land(plane)
puts
print 'Show Aiport after plane arrived: '
p gatwick

gatwick.depart(plane)
puts
print 'Show Aiport after plane departed: '
p gatwick

# ---

standsted = Airport.new(50)
boing = Plane.new

50.times { standsted.land(boing) }

standsted.land(boing) #raise error 'Airport full'


# feature_tests.rb
##### EDGE CASES #######
# planes can only take off from airports they are in
# planes that are already flying cannot take off and/or be in an airport
# planes that are landed cannot land again and must be in an airport



####### USER STORIES #########

# User story 6
# default airport capacity that can be overridden

# User story 5
# prevent landing when airport is full

# User story 4
# I want to prevent landing when weather is stormy

# User story 3
# prevent takeoff when weather is stormy

# User story 2
# instruct a plane to land at an airport
# confirm that it has landed

# User story 1
# instruct a plane to take off from an airport
# confirm that it is no longer in the airport
