=begin
USER STORY 3
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
=end

require './lib/plane'
require './lib/airport'


plane = Plane.new
airport = Airport.new

# I want to prevent landing when the airport is full
10.times { airport.land(plane, false) }
airport.land(plane, false)
