# planning

Weather needs to be generated at random numerically, but should be mostly sunny. Maybe a rand between 1-10 and if number is greater 8 it is stormy?

weather		sunny (planes can land)
weather		stormy (planes cannot land)


## Two main objects?

plane
airport
and possibly... weather???

## methods

plane land 
- plane confirm landed
plane take off 
- confirm not docked (airborne)

airport land plane
airport confirm plane landed (airport or plane?? perhaps a plane method)
airport release plane
airport confirm plane not docked (airport or plane??)
airport prevent takeoff if stormy
airport prevent landing if stormy
airport prevent landing if full

airport have default capacity that can be overriden

## assumptions

- airport is empty at the beginning of the session (will need to create x times Plane instances and fill array)
- a plane is on the ground when created

## feature tests:

plane = Plane.new
airport = Airport.new

airport.weather # => "sunny" or "stormy" (private method)
airport.full? (private method)

airport.land(plane) # => checks if full, checks weather, adds to array of planes
airport.capacity = 30 # => updates the airport capacity to 

plane.status # => landed / airborne



