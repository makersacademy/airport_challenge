require './lib/plane'
require './lib/airport'

airport = Airport.new
plane = Plane.new
airport.land(plane) # if a plane is not already in the airport it can land, otherwise raise error "Plane already landed cannot land again"
airport.planes # planes array includes the plane that has landed
airport.takeoff(plane) # if a plane is in the airport it can take off, otherwise raise error "Plane not in the airport cannot takeoff"
airport.planes # the plane is no longer in the airport after takeoff
airport.full? # if airport is full
airport.land(plane) # prevent plane landing and raise error "Airport is full, no landing allowed"

airport.capacity # returns the airport capacity, the default capacity is 100 planes
airport.capacity = 50 # sets the airport capacity to 50 planes
airport.capacity = 200 # sets the airport capacity to 200 planes

weather = Weather.new
weather.stormy? # if the weather is stormy
airport.takeoff(plane) # prevent takeoff and raise error "Stormy weather, no takeoff allowed"
airport.land(plane) # prevent landing and raise error "Stormy weather, no landing allowed"
