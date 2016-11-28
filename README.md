Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Instructions for running my code
---------
* Call `land` and `take_off` on Airport with Plane as the argument to successfully land and take off planes, as below

```
[2] pry(main)> airport = Airport.new
=> #<Airport:0x007f853bc8ab00 @capacity=20, @planes=[], @weather=#<Weather:0x007f853bc8aab0 @current_weather="not stormy">>
[3] pry(main)> plane = Plane.new
=> #<Plane:0x007f853bc234c8 @status="flying">
[4] pry(main)> airport.land(plane)
=> [#<Plane:0x007f853bc234c8 @status="landed">]
[5] pry(main)> airport.take_off(plane)
=> #<Plane:0x007f853bc234c8 @status="flying">
[6] pry(main)>
```
* Call `weather_randomizer` on `airport.weather` to possibly change the Weather to stormy at random. Planes should then not be able to land or take off

```
[10] pry(main)> airport.weather.weather_randomizer
=> "stormy"
```

```
[35] pry(main)> airport_2
=> #<Airport:0x007f853b857038 @capacity=20, @planes=[#<Plane:0x007f853bf2b580 @status="landed">], @weather=#<Weather:0x007f853b856660 @current_weather="stormy">>
[36] pry(main)> airport
=> #<Airport:0x007f853bc8ab00 @capacity=20, @planes=[], @weather=#<Weather:0x007f853bc8aab0 @current_weather="stormy">>
[37] pry(main)> airport.land(plane)
RuntimeError: weather is too stormy
from /Users/amanda/Desktop/makers_academy/weekend_challenges/airport_challenge/lib/airport.rb:42:in `too_stormy'
[38] pry(main)> airport_2.take_off(plane)
RuntimeError: weather is too stormy
from /Users/amanda/Desktop/makers_academy/weekend_challenges/airport_challenge/lib/airport.rb:42:in `too_stormy'
```

* Airports have a `DEFAULT_CAPACITY` of 20, but this can be overridden when instantiating a new Airport

```
[2] pry(main)> airport = Airport.new(50)
=> #<Airport:0x007fcd1c454a70 @capacity=50, @planes=[], @weather=#<Weather:0x007fcd1c454a20 @current_weather="not stormy">>
[3] pry(main)>
```

* If `DEFAULT_CAPACITY` has been reached, no planes can land

```
[39] pry(main)> airport = Airport.new
=> #<Airport:0x007f853bd31540 @capacity=20, @planes=[], @weather=#<Weather:0x007f853bd314c8 @current_weather="not stormy">>
[40] pry(main)> plane = Plane.new
=> #<Plane:0x007f853bcd0e20 @status="flying">
[41] pry(main)> 20.times { airport.land(Plane.new) }
=> 20
[42] pry(main)> airport.land(plane)
RuntimeError: Airport is full
from /Users/amanda/Desktop/makers_academy/weekend_challenges/airport_challenge/lib/airport.rb:20:in `land'
```

* Planes cannot take off from Airports where they are not present, or land if they have already landed

```
[43] pry(main)> airport = Airport.new
=> #<Airport:0x007f853bc12a60 @capacity=20, @planes=[], @weather=#<Weather:0x007f853bc12998 @current_weather="not stormy">>
[44] pry(main)> plane = Plane.new
=> #<Plane:0x007f853bb99fc0 @status="flying">
[45] pry(main)> airport.take_off(plane)
RuntimeError: Plane not available for take off
from /Users/amanda/Desktop/makers_academy/weekend_challenges/airport_challenge/lib/airport.rb:29:in `take_off'
[46] pry(main)> airport.land(plane)
=> [#<Plane:0x007f853bb99fc0 @status="landed">]
[47] pry(main)> airport.land(plane)
RuntimeError: This plane has already landed
from /Users/amanda/Desktop/makers_academy/weekend_challenges/airport_challenge/lib/airport.rb:18:in `land'
[48] pry(main)> airport_2 = Airport.new
=> #<Airport:0x007f853b9a9210 @capacity=20, @planes=[], @weather=#<Weather:0x007f853b9a91c0 @current_weather="not stormy">>
[49] pry(main)> airport_2.land(plane)
RuntimeError: This plane has already landed
from /Users/amanda/Desktop/makers_academy/weekend_challenges/airport_challenge/lib/airport.rb:18:in `land'
```
