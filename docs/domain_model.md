# From User Stories to Domain Model

## Classes and their public interface

A plane currently has no responsibilities: it is just an object that could wither be in an airport or not be in an airport.

An airport is responsible for storing planes. Its default capacity can be modified.

Weather is responsible for knowing what the current weather is.

A dispatcher is responsible for allowing planes to land/take off pending weather conditions.

Objects    | Messages
-------    | -------------
Plane      | 
Airport    | receive(plane), release(plane), parked?(plane)
Weather    | stormy? 
Dispatcher | travel_allowed?=

## Verbose feature tests

The Interface for this application will be irb. 
The following desired features are written at the time of drafting the model, and are a limited set of examples to show the interface.
Please refer to the suite of feature test for latest feature set.

### Operator lands a plane (weather is good) and checks that it is safely in the airport
```
*2.2.3 :001 >* my_jet = Plane.new

 => #<Plane:0x00023fe02>
 
*2.2.3 :002 >* airport = Airport.new

 => #<Airport:0x00023fe02 @capacity = 50>
 
*2.2.3 :003 >* airport.receive(my_jet)

 => #<Plane:0x00023fe02> landed
 
*2.2.3 :004 >* airport.parked?(my_jet)

 => true
```
### Designer creates a series of airports with different capacities
```
*2.2.3 :001 >* standard_airport = Airport.new

 => #<Airport:0x00023fe02 @capacity = 50>
 
*2.2.3 :002 >* big_airport = Airport.new(9999)

 => #<Airport:0x000333e0b @capacity = 9999>
 ```
