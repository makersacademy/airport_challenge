require '../lib/plane'
require '../lib/airport'

plane = Plane.new
airport = Airport.new(100)

p airport.capacity
