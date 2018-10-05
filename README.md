# Airport Challenge

## My Approach

* I have extracted two key types of object from the user stories - airport and plane - and made classes to represent them.

### Airports
* Airports can store planes in an array, and have a maximum capacity (5 by default, but changeable).
* Airports have weather, which is randomly assigned upon initialisation, with a 10% chance of stormy weather and a 90% chance of sunny weather (by default - this can be changed).

### Planes
* Planes have a location, which can be an airport object or "sky"
* Planes can land in airports.
  * An error will be raised if the weather is stormy, the airport is at capacity, or the plane is already in an airport.
  * If the plane lands successfully, its location will be updated and it will be added to the airport's list of planes.
* Planes can take off from airports.
  * An error will be raised if the weather is stormy, or the plane is in another airport or in the sky.
  * If the plane takes off successfully, its location will be updated to "sky" and it will be removed from the airport's list of planes.
* Planes can tell the user whether or not they are in a particular airport.

## How to Use

* Open up a session in `irb` or equivalent.
* `require` airport.rb and plane.rb.
* To create a new airport, type `airport = Airport.new`.
* To create a new plane, type `plane = Plane.new`
* To land the plane in the airport, type `plane.land(airport)`
* To take off again, type `plane.take_off(airport)`
