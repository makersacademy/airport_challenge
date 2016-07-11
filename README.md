#Airport Challenge#

This repository contains the Airport Challenge, the first weekend challenge at Makers Academy.

There are three classes - airport, plane and weather, each with an associated spec file for testing. There is a feature test to allow easy manipulation of input.  

The Air Traffic Controller (user) can generate new airports and planes, and call them to land or take off (depending on weather conditions).

The airport starts with a default capacity of five, which can be set by the user when initializing. The airport can be queried for whether it is full, and at present for the planes it contains (although a further revision to this program and its tests should make the latter information private).

The status of the plane, which airport it is in (currently only by ID), and the weather can be queried. Weather changes during the operation of the program - it is checked when performing operations e.g. take off and landing.

##IRB code sample##

```
$ irb
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > Gatwick = Airport.new
 => #<Airport:0x007fc4e404f4d8 @capacity=5, @planes=[]>
2.2.3 :003 > plane1 = Plane.new
 => #<Plane:0x007fc4e403de18 @status=:flying>
2.2.3 :004 > plane1.status
 => :flying
2.2.3 :005 > Weather.stormy?
 => true
2.2.3 :006 > Gatwick.full?
 => false
2.2.3 :007 > Weather.stormy?
 => false
2.2.3 :008 > Gatwick.land(plane1)
 => #<Airport:0x007fc4e404f4d8 @capacity=5, @planes=[#<Plane:0x007fc4e403de18 @status=:landed, @airport=#<Airport:0x007fc4e404f4d8 ...>>]>
2.2.3 :009 > plane1.status
 => :landed
2.2.3 :010 > plane1.airport
 => #<Airport:0x007fc4e404f4d8 @capacity=5, @planes=[#<Plane:0x007fc4e403de18 @status=:landed, @airport=#<Airport:0x007fc4e404f4d8 ...>>]>
2.2.3 :011 > Gatwick.take_off(plane1)
 => #<Plane:0x007fc4e403de18 @status=:flying, @airport=:nil>
2.2.3 :012 > plane1.status
 => :flying
 ```
