# Theory of Operation
I've written the classes in a way that represents their real-world behaviours. For example, to land a plane, you pass the airport object you wish it to land at:

    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
If the landing is successful, the plane will store its location as the airport object, and pass itself to the airport where it will be stored in the hanger.
# Planes
To create a new plane:

    plane = Plane.new	# creates a plane in_flight
    plane2 = Plane.new(airport)	# creates a plane inside airport

## Taking off
To have a plane take off:

    plane.takeoff
The plane will remove itself from the airport object it is currently in, and set its location to :in_flight

## Landing
To land a plane at an airport:

    plane.land(airport)

## Location
To find a planes location:

    plane = Plane.new
    plane.location	#	=> returns :in_flight
    plane.land(airport)
    plane.location	#	=> returns airport object

# Airports
Airports are created with a default weather of "sunny", and a maximum capacity of 10. These can be changed when initialized:

    airport = Airport.new(weather="stormy", max_capacity=50)
## Weather
The weather can be read or set:

    airport.weather	#	=> returns "stormy"
    airport.weather = "sunny"
When a plane tries to take off or land, it will first check with the airport if it is safe to do so:

    airport.weather = "stormy"
    plane.land(airport)	#	=> throws exception "Weather is unsafe"
## Planes
To see the planes that are currently in the airport:

    airport.planes	#	=> returns the list of plane objects currently stored in airport

# My approach
I started off by treating planes and airports as two separate, independent objects, with each class in its own file. I created spec files for the *plane.rb* and *airport.rb* classes, which only imported the named file and used doubles for the other class (i.e. *plane_spec.rb* uses an airport double object). Afterwards I made a spec that imports both classes and tests them together to ensure that the interact properly. This allowed me to build and test each class independently, before ensuring that they played nicely together.
