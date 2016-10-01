OBJECTS AND MESSAGES

Plane <-- lands (if flying, and if not stormy and airport not full) --> Airport
Plane  <-- takes off (if in airport and not flying and not stormy) --> Airport
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
plane.flying?           # should equal to false
airport = Airport.new
airport.land(plane)     # should raise an error

Feature 7: A plane cannot take off unless it is on the ground (not flying) DONE

plane = Plane.new
airport = Airport.new
airport.takeoff(plane)
airport.takeoff(plane)  # should raise an error because the plane has taken off already

Feature 8: Plane responds to flying? DONE

plane = Plane.new
plane.flying            # should return false

Feature 9: If plane takes off, flying equals true DONE (although stub didn't work)

plane = Plane.new
airport = Airport.new
airport.takeoff(plane)
plane.flying?           # should return true

Feature 10: If plane lands, flying equals false DONE

plane = Plane.new
airport = Airport.new
airport.takeoff(plane)
plane.flying?           # should return true
airport.land(plane)
plane.flying?           # should return false

Feature 10: You can check the weather at the airport DONE (forced both sunny and stormy)
airport = Airport.new
airport.weather         # should return randomly sunny or stormy

Feature 11: A plane cannot land if the weather is stormy DONE

plane = Plane.new
airport = Airport.new
airport.takeoff(plane)
airport.weather = stormy
airport.land(plane)     # should raise an error "can't land plane in storm" or similar.

Feature 12: A plane cannot take off if the weather is stormy DONE

plane = Plane.new
airport = Airport.new
airport.weather = stormy
airport.takeoff(plane)  # should raise an error "can't take off in storm" or similar.

Feature 13: A plane is flying by default DONE

plane = Plane.new
plane.flying?           # should return true

Feature 14: If the plane lands, it should be confirmed that it's in the airport

plane = Plane.new
airport = Airport.new
airport.land(plane)
plane.in_airport?      # should return true

Feature 15: If the plane takes off, it should no longer be in the airport

plane = Plane.new
airport = Airport.new
airport.land(plane)
plane.in_airport?      # should return true
airport.takeoff(plane)
plane.in_airport?       # should return false



REFACTORING NEEDED
If plane not in airport, can't take off.
Put stubs back in instead of real Plane objects
Need to confirm that plane has landed
Need to confirm that plans has taken off and is no longer in the airport
Need a method to check if a plane is in the airport or not
Need to read documentation on mocks.
Refactor to make weather it's own class?
