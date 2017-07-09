require '../lib/airport.rb'
require '../lib/plane.rb'

# USER STORY
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

airport = Airport.new
plane = Plane.new

airport.take_off(plane) # confirms plane can take off (may return error if the weather is stormy).
plane.departed? # confirms plane has taken off
p plane # outputs plane status

# Output should look like this:
# #<Plane:0x007ff58686c648 @landed=false, @taken_off=true>
