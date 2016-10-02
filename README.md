# Airport Challenge #

Program to control the flow of planes at an airport. The program is broken down into 3 distinct files/classes:

* Airport (aiport.rb) - The main program which controls the takeoff and landing of aircraft.

* Plane (plane.rb) - Responds to takeoff and landing, and stores the current airport.

* Weather (weather.rb) - Randomly generates a current weather state.

[![Build Status](https://travis-ci.org/JG075/airport_challenge.svg?branch=master)](https://travis-ci.org/JG075/airport_challenge)

## Run ##

To run:

```
ruby airport.rb
```

## Example ##

```
2.2.3 :001 > load "./lib/airport.rb"
 => true
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fbfe181d2f8 @planes=[], @weather=#<Weather:0x007fbfe181d2d0>, @capacity=10>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fbfe3003098>
2.2.3 :004 > airport.land(plane)
RuntimeError: Cannot land due to stormy weather
2.2.3 :005 > airport.land(plane)
 => [#<Plane:0x007fbfe3003098 @landed=true, @airport="#<Airport:0x007fbfe181d2f8>">]
2.2.3 :006 > airport.take_off(plane)
RuntimeError: Cannot takeoff due to stormy weather
2.2.3 :007 > airport.take_off(plane)
 => #<Plane:0x007fbfe3003098 @landed=false, @airport="#<Airport:0x007fbfe181d2f8>">
 2.2.3 :008 > airport.planes
  => []
  ```
