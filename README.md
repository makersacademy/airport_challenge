

Airport Challenge         [![Build Status](https://travis-ci.org/MarcoCode/airport_challenge.svg?branch=master)](https://travis-ci.org/MarcoCode/airport_challenge)  
=================

What is it?
---------

* My solution to the challenge

Rationale
-------

* The ControlTower class instructs planes
  - It is designed to instruct Planes to land or take_off from/to a specific airport
* The Airport class let planes land and take-off
  - It is designed to store Planes that have landed 
* The Plane class keeps track of the flying state
  - It is designed to communicate its status to the ControlTower class
  - Each instance has to be docked when created in order to take-off from an airport


Example
-------

irb(main):004:0> ct = ControlTower.new

=> #<ControlTower:0x007f9eb983e168>

irb(main):005:0> stansted = Airport.new "Stansted"

=> \#\<Airport:0x007f9eb982c7b0 @name="Stansted", @capacity=3, @weather=:sunny, @planes=[]\>

irb(main):006:0> plane = Plane.new

=> \#\<Plane:0x007f9eb9827850 @plane_id="737-1", @flying=false\>

irb(main):007:0> plane1 = Plane.new

=> \#\<Plane:0x007f9eb98667a8 @plane_id="737-2", @flying=false\>

irb(main):008:0> plane.dock(stansted)

=> [\#\<Plane:0x007f9eb9827850 @plane_id="737-1", @flying=false\>]

irb(main):009:0> stansted.planes

=> [\#\<Plane:0x007f9eb9827850 @plane_id="737-1", @flying=false\>]

irb(main):010:0> ct.take_off(plane, stansted)

=> "737-1 took-off from Stansted"

irb(main):012:0> ct.take_off(plane1, stansted)

=> "737-2 is not in Stansted"

irb(main):013:0> plane2 = Plane.new

=> \#\<Plane:0x007f9eb994bf88 @plane_id="737-3", @flying=false\>

irb(main):014:0> ct.land(plane, stansted)

=> "737-1 landed in Stansted"

irb(main):015:0> ct.land(plane2, stansted)

=> "737-3 is not flying"


