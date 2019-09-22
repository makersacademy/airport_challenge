Airport Challenge
=================

This is an air traffic control app that instructs planes to land in the airport or to take off depending on weather conditions. It's initially designed for the airports with capacity of 12 planes, but this can be changed upon initialisation.


## Features
* Planes can land or take off if weather is not stormy.
* Planes won't be able to land if the airport is full.
* A plane is contained at the airport when it's landed.
* A plane can no longer be found at the airport after it took off.
* Implemented edge cases: a plane can't land when it's already landed, it also can't take off again when it's already in flight. It's also impossible to instruct plane to take off if the airport is empty.


## Feature test: Landing and taking off multiple planes

```
[1] pry(main)> require './lib/plane'
=> true
[2] pry(main)> require './lib/weather'
=> true
[3] pry(main)> require './lib/airport'
=> true
[4] pry(main)> weather = Weather.new
=> #<Weather:0x00007fc25ab0dd70>
[5] pry(main)> weather.stormy?
=> false
[6] pry(main)> airport = Airport.new(3, weather)
=> #<Airport:0x00007fc25b0389d0 @capacity=3, @landed_planes=[], @weather=#<Weather:0x00007fc25ab0dd70>>
[7] pry(main)> plane1 = Plane.new
=> #<Plane:0x00007fc25a9e6d98 @in_flight=true>
[8] pry(main)> plane2 = Plane.new
=> #<Plane:0x00007fc25aa1f378 @in_flight=true>
[9] pry(main)> plane3 = Plane.new
=> #<Plane:0x00007fc25aa5e078 @in_flight=true>
[10] pry(main)> plane4 = Plane.new
=> #<Plane:0x00007fc25aa955c8 @in_flight=true>
[11] pry(main)> plane1.in_flight?
=> true
[12] pry(main)> airport.land(plane1)
RuntimeError: Too stormy to land!
[13] pry(main)> weather.stormy?
=> false
[14] pry(main)> airport.land(plane1)
=> "Plane landed!"
[15] pry(main)> airport.land(plane2)
=> "Plane landed!"
[16] pry(main)> plane2.landed?
=> true
[17] pry(main)> plane1.landed?
=> true
[18] pry(main)> airport.land(plane3)
=> "Plane landed!"
[19] pry(main)> airport.land(plane4)
RuntimeError: No extra space!
[20] pry(main)> airport.take_off(plane1)
RuntimeError: Too stormy to fly!
[21] pry(main)> airport.take_off(plane1)
RuntimeError: Too stormy to fly!
[22] pry(main)> airport.take_off(plane1)
=> "Plane took off!"
```
