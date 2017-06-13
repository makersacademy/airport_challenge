### What the programme does
The programme mimics an airport air traffic control system.

### How to use
The programme can perform the following basic functions:
- land plane and confirm plane has landed
- take off and confirm plane has landed
- prevent take of or landing in stormy conditions
- prevent planes landing if the airport is full

```2.4.0 :001 > require './docs/airport.rb'
 => true
2.4.0 :002 > gatwick = Airport.new
 => #<Airport:0x007f9b8904f458 @planes=[], @weather="calm", @capacity=45>
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007f9b8903e130>
2.4.0 :004 > gatwick.land(plane)
 => [#<Plane:0x007f9b8903e130>]
2.4.0 :005 > gatwick.confirm_land(plane)
 => true
2.4.0 :006 > gatwick.take_off(plane)
 => #<Plane:0x007f9b8903e130>
2.4.0 :007 > gatwick.confirm_take_off(plane)
 => true
2.4.0 :008 > gatwick.unsafe_to_fly?
 => false
2.4.0 :009 > exit```
