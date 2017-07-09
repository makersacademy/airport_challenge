require '../lib/airport.rb'
require '../lib/plane.rb'
require '../lib/weather.rb'

# USER STORY
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed

airport = Airport.new
plane = Plane.new

airport.authorise_land(plane) # authorises plane can land.
plane.landed? # confirms plane has landed
p plane # outputs status of plane

# Output should look like this:
# <Plane:0x007fea1a138358 @landed=true, @taken_off=false>
