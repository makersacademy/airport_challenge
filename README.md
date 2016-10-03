# Airport Challenge

## Introduction
Welcome to the Airport Challenge Program. This program helps control airport departures and arrivals. Planes are able to land and take off at airports. 

Airports come with tools to check whether the weather is suitable for flying, as well as space allocation.

## Getting Started
### Requiring the File
    2.2.3 :001 > require './lib/airport'
    => true


### Creating Airports, Planes and Weather
```
 2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fe59409c528 @landed_planes=[], @capacity=20>
2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007fe59408eba8 @flying=false>
2.2.3 :004 > weather = Weather.new
 => #<Weather:0x007fe59407edc0 @stormy=false>
```

## Landing and Taking Off

Air traffic controllers can land planes at airports and check whether they landed safely.

They can also take off planes from the airport and ensure that planes are flying.

 ```
2.2.3 :005 > airport.landed_planes
 => []
2.2.3 :006 > airport.land(plane, weather)
 => [#<Plane:0x007fe59408eba8 @flying=false>]
2.2.3 :007 > airport.landed_planes
 => [#<Plane:0x007fe59408eba8 @flying=false>]
2.2.3 :008 > airport.take_off(plane, weather)
 => #<Plane:0x007fe59408eba8 @flying=true>
2.2.3 :009 > airport.landed_planes.include?(plane)
 => false
2.2.3 :010 > plane.flying?
 => true
 ```

### Checks For Stormy Weather

Using the program, air traffic controllers can check if the weather is suitable for taking off or landing.

```
2.2.3 :005 > weather.make_it_rain
 => true
2.2.3 :006 > airport.land(plane, weather)
RuntimeError: Unsuitable weather for landing!
	from /Users/usr/airport_challenge/lib/airport.rb:16:in `land'
	from (irb):6
	from /Users/usr/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
2.2.3 :007 > airport.take_off(plane, weather)
RuntimeError: Too stormy to take off!
	from /Users/usr/airport_challenge/lib/airport.rb:24:in `take_off'
	from (irb):7
	from /Users/usr/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```
## Maximum Capacity Features
The airport class comes with a default capacity. This can be overridden by adding an argument when creating a new airport.

```
2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007fbeca09f6d8 @landed_planes=[], @capacity=20>
2.2.3 :003 > airport2 = Airport.new(40)
 => #<Airport:0x007fbeca094710 @landed_planes=[], @capacity=40>
2.2.3 :004 > airport.capacity
 => 20
2.2.3 :005 > airport2.capacity
 => 40
```
The program will show an error if a plane tries to land when there is no space.

```
2.2.3 :005 > 20.times { airport.land(plane, weather) }
 => 20
2.2.3 :006 > airport.capacity
 => 20
2.2.3 :007 > airport.land(plane, weather)
RuntimeError: No space for planes in airport
	from /Users/usr/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):7
	from /Users/usr/.rvm/rubies/ruby-2.2.3/bin/irb:15:in `<main>'
```