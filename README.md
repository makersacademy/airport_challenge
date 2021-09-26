
# Airport Challenge
Implements the Airport Challenge. 

## Weather 
*  `Weather.new` creates a new instance of the weather class.
*  `weather.stormy?` usually returns `false`, but occasionally can be `true`.  

## Airport 
*  `Airport.new([capacity], [name])` initialises a new airport. Default capacity is 12.
*  `airport.name` returns name of the airport.
*  `airport.full?` returns true, if has no available space for planes inside.
*  `airport.land(plane)` add plane inside
*  `airport.departure(plane)` fixes that the plane is not inside anymore
*  `airport.stormy?` checks if the weather is stormy

## Plane
*  `Plane.new(airport)` initialise a new plane in the airport if it is not full.
*  `plane.next_destination(airport)` sets a new destination to travel.
*  `plane.take_off` leave the airport and fly to the destination.
*  `plane.land_at(airport)` landing at the selected airport.

## How to run in irb
```
irb -r "./lib/app"
```

### Example (irb)

```
3.0.2 :001 > lhr = Airport.new(1, "London Heathrow")
=> #<Airport:0x00005b68747f6d58

3.0.2 :002 > lhr.full?
=> false

3.0.2 :003 > airbus = Plane.new(lhr)
=> #<Plane:0x00005b6874aca480

3.0.2 :004 > lhr.full?
=> true

3.0.2 :005 > svo = Airport.new(4, "Moscow Sheremetyevo")
=> #<Airport:0x00005b68748f7f40

3.0.2 :006 > airbus.next_destination(svo)
=> "Fasten your seatbelts, please. We are ready to take off!"

3.0.2 :007 > airbus.take_off
=> "Flying!"

3.0.2 :008 > airbus.land_at(svo)
=> "Successfully landed at Moscow Sheremetyevo airport."

3.0.2 :009 > lhr.full?
=> false

3.0.2 :010 > airbus.next_destination(svo)
/home/iamsasha/projects/airport_challenge/lib/plane.rb:12:in `next_destination': Plane is already in the Moscow Sheremetyevo airport! (RuntimeError)

3.0.2 :011 > airbus.take_off
/home/iamsasha/projects/airport_challenge/lib/plane.rb:19:in `take_off': Set destination first! (RuntimeError)

3.0.2 :012 > svo.full?
=> false

3.0.2 :013 > exit
```