Airport Challenge
==================

[![Build Status](https://travis-ci.org/yyl29/airport_challenge.svg?branch=master)](https://travis-ci.org/yyl29/airport_challenge)

What is it?
-----------

This is Week 1 weekend challenge of Makers Academy. It is a software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Full instructions for the challenge can be found in [INSTRUCTIONS.md](https://github.com/yyl29/airport_challenge/blob/master/INSTRUCTIONS.md).

Features
---------

* Airport can land or take off planes
* Plane can show status
* Plane cannot land or take off when weather is stormy
* Airport capacity can be set
* Weather condition can be set

User Guide
-----------

This programme can be run in `irb` or `pry` from the command line.

```
$ irb
2.2.1 :001 > require './airport_challenge/lib/airport'
 => true
2.2.1 :002 > airport = Airport.new
 => #<Airport:0x007fe3c403c230 @planes=[], @capacity=10, @weather=#<Weather:0x007fe3c403c208 @weather=:sunny>>
2.2.1 :003 > plane = Plane.new
 => #<Plane:0x007fe3c402ea90>
2.2.1 :004 >
```

To instruct the plane to land or take off, use the `.land` and `.takeoff` commands.

```
2.2.1 :004 > airport.land(plane)
 => #<Plane:0x007fe3c402ea90 @status=:arrived>
2.2.1 :005 >
```

The `.planes` command shows all the planes currently at the airport.

```
2.2.1 :005 > airport.planes
 => [#<Plane:0x007fe3c402ea90 @status=:arrived>]
2.2.1 :006 >
```

Status for a plane can be obtained by using the `.status` command. Status can be `:arrived`, `:departed` or `nil` if it hasn't landed at the airport.

```
2.2.1 :006 > plane.status
 => :arrived
2.2.1 :007 >
```

The default airport capacity is set as 10 planes and can be changed when creating a new airport.

```
2.2.1 :007 > airport2 = Airport.new(capacity: 20)
 => #<Airport:0x007fe3c48662a8 @planes=[], @capacity=20, @weather=#<Weather:0x007fe3c4866258 @weather=:stormy>>
2.2.1 :008 >
```