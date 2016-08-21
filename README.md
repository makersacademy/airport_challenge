# Airport Challenge

## Description

The aim of this project is to design a program which can control the landing and take off of planes at any airport, given airport capacity and weather requirements. Planes are unable to land or take off from an airport under stormy weather conditions and a plane cannot land at an airport which has reached full capacity. Airports are given a default capacity of 20 unless specified.

## Classes

There are three classes used in this program.

1. Airport
2. Plane
3. Weather

### 1. Airport

* Properties

  * `capacity` defines maximum number of planes that an Airport object can store. The default is set to 20, but can be overridden upon initialization of the Airport object.
  * `planes` array which stores any planes which land at the airport.
  * `weather` associates Weather object with the airport.

* Methods

  * `land(plane)` when a Plane object lands at the airport it is stored at the Airport. This may fail if capacity or weather requirements for landing are breached or if the plane is already grounded.
  * `take_off(plane)` this removes a Plane object that is stored at the airport. This may fail if the weather requirements for take off are breached or if the plane is not grounded at the airport.
  * `full?` determines whether the airport has reached maximum capacity.

### 2. Plane

* Properties

  * `grounded` provided status of plane, i.e. whether it is in flight or is based at an airport. All Plane objects will initialize with a `false` state to indicate they are in the air.

* Methods

  * `landed` changes the `grounded` status of the plane to `true`.
  * `taken_off` changes the `grounded` status of the plane to `false`.

### 3. Weather

* Methods

  * `stormy?` returns `true` or `false` depending on the result of a random number generator.

## Feature Test

```
$ irb
2.3.0 :001 > require './airport.rb'
 => true
2.3.0 :002 > Heathrow = Airport.new
 => #<Airport:0x007fd8ca037320 @capacity=20, @planes=[], @weather=#<Weather:0x007fd8ca0372a8>>
2.3.0 :003 > JFK = Airport.new 30
 => #<Airport:0x007fd8c99218b0 @capacity=30, @planes=[], @weather=#<Weather:0x007fd8c99217e8>>
2.3.0 :004 > plane = Plane.new
 => #<Plane:0x007fd8c9918d28 @grounded=false>
2.3.0 :005 > Heathrow.land(plane)
 => [#<Plane:0x007fd8c9918d28 @grounded=true>]
2.3.0 :006 > Heathrow
 => #<Airport:0x007fd8ca037320 @capacity=20, @planes=[#<Plane:0x007fd8c9918d28 @grounded=true>], @weather=#<Weather:0x007fd8ca0372a8>>
2.3.0 :007 > JFK.land(plane)
RuntimeError: This plane is already at an airport
	from /Users/laurawilson/MakersAcademy/Projects/airport_challenge/lib/airport.rb:19:in `land'
	from (irb):7
	from /Users/laurawilson/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :008 > Heathrow.take_off(plane)
 => #<Plane:0x007fd8c9918d28 @grounded=false>
2.3.0 :009 > Heathrow
 => #<Airport:0x007fd8ca037320 @capacity=20, @planes=[], @weather=#<Weather:0x007fd8ca0372a8>>
2.3.0 :010 > Heathrow.take_off(plane)
RuntimeError: This plane is already flying
	from /Users/laurawilson/MakersAcademy/Projects/airport_challenge/lib/airport.rb:26:in `take_off'
	from (irb):13
	from /Users/laurawilson/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :011 > JFK.land(plane)
RuntimeError: Planes cannot land in stormy weather
	from /Users/laurawilson/MakersAcademy/Projects/airport_challenge/lib/airport.rb:17:in `land'
	from (irb):16
	from /Users/laurawilson/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
2.3.0 :012 > 20.times { Heathrow.land(Plane.new) }
=> [#<Plane:0x007fd8c985c218 @grounded=true>, #<Plane:0x007fd8c985c178 @grounded=true>, #<Plane:0x007fd8c985c150 @grounded=true>, #<Plane:0x007fd8c985c128 @grounded=true>, #<Plane:0x007fd8c9847868 @grounded=true>, #<Plane:0x007fd8c9847818 @grounded=true>, #<Plane:0x007fd8c982cc48 @grounded=true>, #<Plane:0x007fd8c99f13f8 @grounded=true>, #<Plane:0x007fd8c99f13d0 @grounded=true>, #<Plane:0x007fd8c99f1380 @grounded=true>, #<Plane:0x007fd8c99f1358 @grounded=true>, #<Plane:0x007fd8c99f1308 @grounded=true>, #<Plane:0x007fd8c99f12b8 @grounded=true>, #<Plane:0x007fd8c99f1290 @grounded=true>, #<Plane:0x007fd8c99f1268 @grounded=true>, #<Plane:0x007fd8ca05e448 @grounded=true>, #<Plane:0x007fd8ca05e3f8 @grounded=true>, #<Plane:0x007fd8ca05e3d0 @grounded=true>, #<Plane:0x007fd8c99c3610 @grounded=true>, #<Plane:0x007fd8c99c35c0 @grounded=true>]
2.3.0 :013 > Heathrow.land(plane)
RuntimeError: Planes cannot land when airport is full
	from /Users/laurawilson/MakersAcademy/Projects/airport_challenge/lib/airport.rb:18:in `land'
	from (irb):31
	from /Users/laurawilson/.rvm/rubies/ruby-2.3.0/bin/irb:11:in `<main>'
```
