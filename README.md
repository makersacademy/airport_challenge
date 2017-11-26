## Airport Challenge

A simple airport model:
  - Airports store a number of planes (with a maximum capacity)
  - Airports have access to weather information
  - Planes can takeoff/land at Airports
  - Adverse weather/airports being at max capacity can prevent landings/takeoffs

#### Implementation
```
$ irb
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007f9ca8076510 @planes=[], @capacity=30, @weather=#<Weather:0x007f9ca80764e8 @stormy=false>>
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007f9ca806e860>
2.4.0 :004 > airport.land(plane)
 => [#<Plane:0x007f9ca806e860 @flying=false>]
 ```
