OBJECTS AND MESSAGES
(I might be overcomplicating it with the air traffic controller object!)

Air traffic controller <-- instruct landing (unless stormy or airport full) --> Plane
Plane <-- lands (if flying) --> Airport
Plane <-- confirm landing --> Air traffic controller
Air traffic controller <-- instruct take off (unless stormy) --> Plane
Plane  <-- takes off (if in airport and not flying) --> Airport
Plane <-- confirm take off --> Air traffic controller
Airport to have default capacity that can be overridden

FEATURE TESTS

require './lib/airport.rb'
require './lib/plane.rb'

Feature 1: Land a plane in an airport DONE

plane = Plane.new       # Create a plane
airport = Airport.new   # Create an airport
airport.land(plane)     # Land the plane in the airport

Feature 2: Allow a plane to take off from an airport DONE

plane = Plane.new
airport = Airport.new
airport.takeoff(plane)

Feature 3: Airport has a default capacity DONE

airport = Airport.new
airport.capacity == described_class::DEFAULT_CAPACITY

Feature 4: You can change the airport's capacity DONE

airport = Airport.new
airport.capacity == described_class::DEFAULT_CAPACITY
airport.capacity = 15
airport.capacity (should return 15)

Feature 5: A plane cannot land if the airport is full DONE

airport = Airport.new
airport.capacity.times { airport.land(Plane.new) }
airport.full? (should equal true)
airport.land(Plane.new) (should raise error)

Feature 6: A plane cannot land unless it is flying DONE

plane = Plane.new
plane.flying?       # should equal to false
airport = Airport.new
airport.land(plane) # should raise an error

Feature 7: A plane cannot take off unless it is on the ground (not flying) DONE

plane = Plane.new
airport = Airport.new
airport.takeoff(plane)
airport.takeoff(plane)  # should raise an error because the plane has taken off already
